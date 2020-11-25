import 'package:cached_network_image/cached_network_image.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:ordering_food/model/item.dart';
import 'package:ordering_food/view/detail_view.dart';
import 'package:ordering_food/view/shopping_cart_view.dart';
import 'package:ordering_food/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductItemsView extends StatefulWidget {


  @override
  _ProductItemsViewState createState() => _ProductItemsViewState();
}

class _ProductItemsViewState extends State<ProductItemsView> {

  List<String> options = [
    'News', 'Entertainment', 'Politics',
    'Automotive', 'Sports', 'Education',
    'Fashion', 'Travel', 'Food', 'Tech',
    'Science',
  ];


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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductViewModel>(context, listen: false).getData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "SeaFood",
                          prefixIcon: Icon(Icons.search),
                          fillColor: Colors.black12,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          border: InputBorder.none,
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
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: options.length,
                    itemBuilder: (context,position) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ActionChip(
                          avatar: Icon(Icons.favorite),
                          label: Text(options[position]),
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
                  scrollDirection: Axis.horizontal,
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
                                  height: 300,
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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("People are looking for",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.fireplace_outlined),
                    Spacer(),
                    Text("See all"),
                  ],
                ),
              ),

              Consumer<ProductViewModel>(builder: (BuildContext context, value, Widget child) {
                return Container(
                  height: 400,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: value.list1.length,
                      itemBuilder: (context,position) {
                        return Container(
                          height: 80,
                          width: 100,
                          child: ListTile(
                            leading: Container(
                              height: 160,
                              width: 60,
                              child: CachedNetworkImage(
                                  imageUrl: "${value.list1[position].image}",
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
                              child: Text(value.list1[position].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(value.list1[position].name),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: IconButton(icon: Icon(Icons.add_box_rounded,size: 50,color: Colors.greenAccent,),onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailView(item: value.list1[position])));
                              },),
                            ),

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
