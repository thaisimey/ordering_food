import 'package:flutter/material.dart';
import 'package:ordering_food/view/product_items_view.dart';

void main() {
  runApp(MyApp());
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
