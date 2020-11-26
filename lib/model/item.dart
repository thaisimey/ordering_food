class Item {

  int id;
  String name;
  String image;
  double price;
  int stock;
  int amount;

  Item(this.id, this.name, this.image, this.price, this.amount);
}

class Cart {
  Item item;
  int qty;

  Cart(this.item, this.qty);
}

class ItemAction {
  int id;
  String name;
  bool isSelect;

  ItemAction(this.id, this.name, this.isSelect);
}