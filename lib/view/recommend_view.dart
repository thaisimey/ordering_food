import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ordering_food/model/item.dart';
import 'package:ordering_food/view/detail_view.dart';
import 'package:ordering_food/view/shopping_cart_view.dart';
import 'package:ordering_food/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class RecommendView extends StatefulWidget {
  @override
  _RecommendViewState createState() => _RecommendViewState();
}

class _RecommendViewState extends State<RecommendView> {

  bool isSelect = false;
  var _controller = TextEditingController();

  List<ItemAction> actionbar = [
    ItemAction(1, "All", true),
    ItemAction(2, "breakfast", false),
    ItemAction(3, "drink", false),
    ItemAction(4, "snack", false),
    ItemAction(5, "dinner", false),
    ItemAction(6, "dessert", false),
    ItemAction(6, "name", false),
    ItemAction(6, "name", false),
    ItemAction(6, "name", false),
    ItemAction(6, "name", false),
    ItemAction(6, "name", false),
    ItemAction(6, "name", false),
    ItemAction(6, "name", false),
  ];

  StreamSubscription subscription;

  @override
  void initState() {
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      print("result ${result}");
      if(result  == ConnectivityResult.none) {
        return Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM ,
          message: "no internet",
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.blue[300],
          ),
          duration: Duration(seconds: 6),
          leftBarIndicatorColor: Colors.blue[300],
        )..show(context);
      }
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductViewModel>(context, listen: false).getData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyCustomAppBar(
          height: 150,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),

              Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: actionbar.length,
                    itemBuilder: (context,position) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ActionChip(
                          backgroundColor: actionbar[position].isSelect ? Colors.orange : Colors.grey,
                          // avatar: Icon(Icons.favorite),
                          label: Text(actionbar[position].name),
                          onPressed: () {},
                        ),
                      );
                    }
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("Recommended food",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Icon(Icons.face),
                    Spacer(),
                    Text("See all",style: TextStyle(color: Colors.blueAccent),),
                  ],
                ),
              ),

              Consumer<ProductViewModel>(builder: (BuildContext context, value, Widget child) {
                return Container(
                  height: 300,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: value.list.length,
                      itemBuilder: (BuildContext context,int position) {
                        return Container(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailView(item: value.list[position])));
                                    },
                                    child: Container(
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: CachedNetworkImage(
                                            imageUrl: "${value.list[position].image}",
                                            imageBuilder: (BuildContext context, imageProvider) => Container(
                                              width: 120.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: imageProvider, fit: BoxFit.cover),
                                              ),
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned( bottom: 20,left: 20,
                                      child: Text(value.list[position].name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                );
              }),


            ],
          ),
        ),
      ),
    );
  }
}
class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return Stack(
      children: [

        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "SeaFood",
                    prefixIcon: Icon(Icons.search),
                    fillColor: Colors.black12,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () => _controller.clear(),
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: CircleAvatar(
                  radius: 30,
                  child: IconButton(icon: Icon(Icons.shopping_cart,size: 30,),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ShoppingCartView()));
                  })),
            )
          ],
        ),

        // Positioned(
        //   bottom: 0,
        //   child: Selector<ConnectivityResult, bool>(
        //       selector: (context, connectivity) => connectivity != ConnectivityResult.none,
        //       builder: (_, value, ___) {
        //         print("connectivity $value");
        //         if(value == false) {
        //           return Flushbar(
        //             flushbarPosition: FlushbarPosition.BOTTOM ,
        //             message: "no internet",
        //             icon: Icon(
        //               Icons.info_outline,
        //               size: 28.0,
        //               color: Colors.blue[300],
        //             ),
        //             duration: Duration(seconds: 3),
        //             leftBarIndicatorColor: Colors.blue[300],
        //           )..show(context);
        //         } else {
        //           return SizedBox.shrink();
        //         }
        //       }
        //   ),
        // ),
      ],
    );
  }
  Size get preferredSize => Size.fromHeight(height);
}

