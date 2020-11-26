import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ordering_food/model/item.dart';
import 'package:ordering_food/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class DetailView extends StatefulWidget {

  final Item item;

  const DetailView({Key key, this.item}) : super(key: key);


  @override
  _DetailViewState createState() => _DetailViewState();

}

class _DetailViewState extends State<DetailView> {

  StreamController<int> _streamController = StreamController();
  int qty = 1;
  Item item;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    item = widget.item;
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                      imageUrl: "${item.image}",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      )
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 30,
                  child: Container(
                    height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: IconButton(icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,),onPressed: () {
                          Navigator.pop(context);
                        },)
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: CachedNetworkImage(
                        imageUrl: "${item.image}",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        Text(item.name,style: TextStyle(fontSize: 16,color: Colors.grey )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(19),
              width: MediaQuery.of(context).size.width,
              child: Text("simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, "
                  "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem"),
            ),
            Container(
              padding: EdgeInsets.only(left: 14),
              child: Row(
                children: [
                  Icon(Icons.phone_in_talk,color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("6.8", style: TextStyle(color: Colors.grey),),
                  ),
                  SizedBox(width: 20,),
                  Icon(Icons.location_on_sharp,color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("Kh. Arifin",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 12),
                      child: Text("Price",style: TextStyle(color: Colors.grey,fontSize: 20),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 6),
                      child: Text("\$ ${item.price}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 38.0),
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: IconButton(icon: Icon(Icons.shopping_cart,size: 30,color: Colors.greenAccent,),onPressed: () {
                        Cart temp = Cart(item, qty);
                        Provider.of<ProductViewModel>(context,listen: false).cartList.add(temp);
                      })),
                ),

              ],
            ),
            SizedBox(height: 10,),
            // ComponentPro.addMinus(MainAxisAlignment.center,context: context,item: item),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: IconButton(icon: Icon(Icons.remove,size: 30,color: Colors.greenAccent),onPressed: () {
                      _streamController.add(
                          (qty <= 1) ? qty==1 : qty -=1
                       );
                    },)),
                StreamBuilder<int>(
                  stream: _streamController.stream,
                  builder: (context, snapshot) {
                    int temp = snapshot.data == null ? qty: snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.only(left : 10.0,right: 10.0),
                      child: Text(temp.toString(), style: TextStyle(color: Colors.grey,fontSize: 22),),
                    );
                  }
                ),
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.greenAccent
                    ),
                    child: IconButton(icon: Icon(Icons.add,size: 30,color: Colors.white),onPressed: () {
                      qty += 1;
                      _streamController.add(qty);
                    },),),


              ],
            ),

          ],
        ),
      ),
    );
  }
}
