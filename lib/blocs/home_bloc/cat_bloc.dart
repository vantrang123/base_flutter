import 'package:flutter/foundation.dart';
import 'package:flutter_app/blocs/home_bloc/cat_event.dart';
import 'package:flutter_app/blocs/home_bloc/cat_state.dart';
import 'package:flutter_app/models/cat.dart';
import 'package:flutter_app/ui/base/response.dart';
import 'package:flutter_app/ui/home/resource/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final HomeRepository homeRepository;

  CatBloc({@required this.homeRepository})
      : assert(homeRepository != null),
        super(CatEmpty());

  @override
  Stream<Transition<CatEvent, CatState>> transformEvents(
      Stream<CatEvent> events,
      TransitionFunction<CatEvent, CatState> transitionFn,
      ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<CatState> mapEventToState(CatEvent event) async* {
    final CatState currentState = state;
    if (event is Fetch) {
      try {
        if (currentState is CatEmpty) {
          yield CatLoading();
          final List<CatPhoto> books = await _fetchBooks();
          yield CatLoaded(books: books);
          return;
        }
        if (currentState is CatLoaded) {
          final List<CatPhoto> posts = await _fetchBooks();
          yield posts.isEmpty
              ? currentState.copyWith()
              : CatLoaded(books: currentState.books + posts);
        }
      } catch (_) {
        yield CatError();
      }
    }
  }

  Future<List<CatPhoto>> _fetchBooks() async {
    final response = await homeRepository.fetchData();
    if (response.status == Status.ConnectivityError) {
      //Internet problem
    }
    if (response.status == Status.Success) {
      return response.data;
    }

    return [];
  }
}