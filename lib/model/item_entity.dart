import 'package:flutter/cupertino.dart';
import 'package:flutter_app/bloc_item/shared/entity.dart';

@immutable
class Item extends Entity {
  final String title;

  Item({String id, this.title}) : super();

  @override
  List<Object> get props => super.props..addAll([id, title]);
}

final List<Item> samplesItem = [
  Item(title: "Item 1"),
  Item(title: "Item 2"),
  Item(title: "Item 3")
];
