import 'package:cached_network_image/cached_network_image.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ordering_food/component/component.dart';
import 'package:ordering_food/model/item.dart';
import 'package:ordering_food/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class ShoppingCartView extends StatefulWidget {
  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {

  List<Item> listFood = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: IconButton(icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white),onPressed: () {
                            Navigator.pop(context);
                          },),
                        )),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Text("Order details",style: TextStyle(color: Colors.grey,fontSize: 25,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0,right: 28.0,top: 10),
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.orange),
                      color: HexColor("fdd5ad"),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:30.0,right: 30.0),
                      child: Row(
                        children: [
                          Text("Enjoy discount up to 50%",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 17),),
                          Spacer(),
                          Icon(Icons.face,color: Colors.deepOrangeAccent,)
                        ],
                      ),
                    )),
              ),
              SizedBox(height: 20,),
              Consumer<ProductViewModel>(builder: (BuildContext context, value, Widget child) {
                return Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: value.cartList.length,
                      itemBuilder: (context,position) {
                        return Container(
                          height: 80,
                          width: 100,
                          child: Slidable(
                            child: ListTile(
                                leading: Container(
                                  height: 160,
                                  width: 60,
                                  child: CachedNetworkImage(
                                      imageUrl: "${value.cartList[position].image}",
                                      imageBuilder: (context, imageProvider) => Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: imageProvider, fit: BoxFit.cover),
                                        ),
                                      )
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(value.cartList[position].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(value.cartList[position].name),
                                      SizedBox(height: 12,),
                                      Text("\$ ${value.cartList[position].price.toString()}",style: TextStyle(fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),

                                trailing:  ComponentPro.addMinus(MainAxisAlignment.end,width:330,height: 100,pos: position)

                            ),
                            actionPane: SlidableDrawerActionPane(),
                            secondaryActions: [
                              IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () => {
                                  Provider.of<ProductViewModel>(context,listen: false).removeItem(item: value.cartList[position])
                                },
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                );
              }),

              SizedBox(height: 20,),
              FDottedLine(
                dottedLength: 15,
                color: Colors.grey,
                width: 520,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text("Discount",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Icon(Icons.face),
                    Spacer(),
                    Text("\$ 20"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18,top: 9),
                child: Row(
                  children: [
                    Text("Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),),
                    Icon(Icons.face),
                    Spacer(),
                    Text("\$ 81",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60.0,right: 60.0,top: 10),
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("fdd5ad"),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:30.0,right: 30.0),
                      child: Row(
                        children: [
                          Text("Cashless",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 17),),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.money,color: Colors.deepOrangeAccent,),
                          ),
                          Spacer(),
                          Text("Detail",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 17),),

                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent
                      ),
                      child: Align(alignment: Alignment.center,child: Text("Check out",))),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
