import 'package:flutter_app/bloc_item/items_event.dart';
import 'package:flutter_app/bloc_item/items_state.dart';
import 'package:flutter_app/bloc_item/shared/entity.dart';
import 'package:flutter_app/model/item_entity.dart';

class ItemBloc extends EntityBloc<EntityEvent, ItemsState> {
  ItemBloc(ItemsState initialState) : super(initialState);

  @override
  Stream<ItemsState> mapEventToState(EntityEvent<Entity> event) async* {
    if (event is AddItemEvent) {
      final List<Item> items = List.from(state.entities)..add(event.item);
      yield ItemsState(items);
    }
  }
}