import 'package:flutter/material.dart';
import 'package:ordering_food/view/detail_view.dart';
import 'package:ordering_food/view/product_items_view.dart';
import 'package:ordering_food/view/shopping_cart_view.dart';
import 'package:ordering_food/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: ProductViewModel()),
        ],
        child: MyApp(),
      ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping",
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'GentiumBasic',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ) ,
      themeMode: ThemeMode.system,
      home: ProductItemsView(),
    );
  }
}
