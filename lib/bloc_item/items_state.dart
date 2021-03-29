import 'package:flutter_app/bloc_item/shared/entity.dart';
import 'package:flutter_app/model/item_entity.dart';

class ItemsState extends EntityState<Item> {
  ItemsState([List<Item> items = const []]) : super(items);
}