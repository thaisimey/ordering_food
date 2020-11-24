import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:ordering_food/model/item.dart';

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
  List<Item> list = [
    Item(1,"Hot Tonu","https://png.pngtree.com/png-clipart/20190520/original/pngtree-thailand-food-dong-yin-gong-decoction-png-image_3698645.jpg"),
    Item(2,"Hot Tonu","https://png.pngtree.com/png-clipart/20190520/original/pngtree-thailand-food-dong-yin-gong-decoction-png-image_3698645.jpg"),
    Item(3,"Hot Tonu","https://png.pngtree.com/png-clipart/20190520/original/pngtree-thailand-food-dong-yin-gong-decoction-png-image_3698645.jpg"),
    Item(4,"Hot Tonu","https://png.pngtree.com/png-clipart/20190520/original/pngtree-thailand-food-dong-yin-gong-decoction-png-image_3698645.jpg"),
    Item(5,"Hot Tonu","https://png.pngtree.com/png-clipart/20190520/original/pngtree-thailand-food-dong-yin-gong-decoction-png-image_3698645.jpg"),
    Item(6,"Hot Tonu","https://png.pngtree.com/png-clipart/20190520/original/pngtree-thailand-food-dong-yin-gong-decoction-png-image_3698645.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      child: Icon(Icons.shopping_cart,size: 30,)),
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
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: options.length,
                  itemBuilder: (context,position) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(list[position].image),
                        )
                      ),
                    );
                  }
              ),
            ),


          ],
        ),
      ),
    );
  }
}
