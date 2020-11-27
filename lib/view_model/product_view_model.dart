import 'package:flutter/cupertino.dart';
import 'package:ordering_food/model/item.dart';

class ProductViewModel extends ChangeNotifier{

List<Item> _list = List();
List<Item> _list1 = List();


List<Item> get list1 => _list1;

  set list1(List<Item> value) {
    _list1 = value;
    notifyListeners();
  }

  List<Cart> _cartList = List();


List<Cart> get cartList => _cartList;

  set cartList(List<Cart> value) {
    _cartList = value;
    notifyListeners();
  }

  List<Item> get list => _list;

  set list(List<Item> value) {
    _list = value;
    notifyListeners();
  }

void removeItem({Cart item}) {
  // print('removed from cartItem: ${item.id} - ${item.name}');
  cartList.remove(item);
  count();
  notifyListeners();
}

void addItem({Cart item}) {
    cartList.add(item);
    count();
    notifyListeners();
}

void increaseItem(int index, int value) {
  _cartList[index].qty++;
  notifyListeners();
}

void decreaseItem(int index, int value) {
  _cartList[index].qty--;
  notifyListeners();
}

int count() {
  List<Cart> temp = cartList.toList();
  print("count : ${temp.length}");
  return temp.length;

}

double total() {
  double eachtotal = 0;
  double total = 0;
  cartList.forEach((element) {
    eachtotal = element.qty * element.item.price;
    total += eachtotal;
  });

  return total;
}



  void getData() {
    try {
      var data = [
        Item(1,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2019/06/top-view-for-box-of-2-burgers-home-made-413x619.jpg",12,3),
        Item(2,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2018/12/green-salad-with-hemp-seeds.jpg",12,3),
        Item(3,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2017/07/fancy-dinner-with-seafood-pasta-and-crayfish-413x620.jpg",12,3),
        Item(4,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2019/04/mae-mu-king-prawns-413x516.jpg",12,3),
        Item(5,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2019/01/seafood-noodles-413x620.jpg",12,3),
        Item(6,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2020/08/muscles-413x551.jpg",12,3),
        Item(7,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2019/04/mae-mu-fried-rice-413x330.jpg",12,3),
        Item(8,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2019/04/girl-pouring-hot-sauce-on-her-vietnamese-food-413x620.jpg",12,3),
        Item(9,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2017/08/almejas-en-salsa-413x622.jpg",12,3),
      ];
      list.addAll(data);

      var data1 = [
        Item(1,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2019/06/top-view-for-box-of-2-burgers-home-made-413x619.jpg",12,3),
        Item(2,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2018/12/green-salad-with-hemp-seeds.jpg",12,3),
        Item(3,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2017/07/fancy-dinner-with-seafood-pasta-and-crayfish-413x620.jpg",12,3),
        Item(4,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2019/04/mae-mu-king-prawns-413x516.jpg",12,3),
        Item(5,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2019/01/seafood-noodles-413x620.jpg",12,3),
        Item(6,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2020/08/muscles-413x551.jpg",12,3),
        Item(7,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2019/04/mae-mu-fried-rice-413x330.jpg",12,3),
        Item(8,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2019/04/girl-pouring-hot-sauce-on-her-vietnamese-food-413x620.jpg",12,3),
        Item(9,"Hot Tonu","https://www.foodiesfeed.com/wp-content/uploads/2017/08/almejas-en-salsa-413x622.jpg",12,3),
      ];
      list1.addAll(data1);

    } catch(e) {

    }
  }
}