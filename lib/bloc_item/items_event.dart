import 'package:flutter_app/bloc_item/shared/entity.dart';
import 'package:flutter_app/model/item_entity.dart';

class AddItemEvent extends EntityEvent {
  final Item item;

  AddItemEvent(this.item);

  @override
  List<Object> get props => [item];
}

class AddItemsEvent extends EntityEvent {
  final List<Item> items;

  AddItemsEvent(this.items);

  @override
  List<Object> get props => [items];
}

class RemoveItemsEvent extends EntityEvent {
  final List<Item> itemIds;

  RemoveItemsEvent(this.itemIds);

  @override
  List<Object> get props => [itemIds];
}
