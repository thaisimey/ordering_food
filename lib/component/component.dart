import 'package:flutter/material.dart';
import 'package:ordering_food/model/item.dart';
import 'package:ordering_food/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class ComponentPro {

  static Widget addMinus(MainAxisAlignment main,{int pos,double height,double width,Item item,BuildContext context}) {
    return Container(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: main,
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              child: IconButton(icon: Icon(Icons.remove,size: 30,color: Colors.greenAccent),onPressed: () {

              },)),
          Padding(
            padding: const EdgeInsets.only(left : 10.0,right: 10.0),
            child: Text(Provider.of<ProductViewModel>(context,listen: false).cartList[pos].amount.toString(),style: TextStyle(color: Colors.grey,fontSize: 22),),
          ),
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.greenAccent
              ),
              child: IconButton(icon: Icon(Icons.add,size: 30,color: Colors.white),onPressed: () {
                Provider.of<ProductViewModel>(context,listen: false).increaseItem(pos, item.amount);

              },)),


        ],
      ),
    );
  }
}