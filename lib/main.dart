import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/provider/cart_provider.dart';

import 'model/item.dart';

final List<Item> catalog = [
  Item(1, 'Shoes'),
  Item(2, 'Hats'),
  Item(3, 'Shirts'),
  Item(4, 'Tie'),
  Item(5, 'Pants'),
  Item(6, 'Jeans'),
  Item(7, 'Shorts'),
  Item(8, 'Underwear'),
  Item(9, 'Jumpers'),
  Item(10, 'Trousers'),
  Item(11, 'Sleepwear'),
  Item(12, 'Accessories'),
];

void main() {
  //Create an instance of the state manager (Provider) here
  runApp(
      ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          padding: EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context,index) => CartItem(item: catalog[index]), 
            separatorBuilder: (context,index) => Divider(), 
            itemCount: catalog.length,
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget { //data cannot change
  final Item item;
  const CartItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$item"),//Display item ID and item name -it will call the toSting method
        Expanded(child: SizedBox()), //insert empty spaces
        //Update the app state
        Consumer<CartProvider>(
          builder: (BuildContext context , CartProvider cart,Widget? child){
            return TextButton(
              onPressed: (){
                cart.add(item);
              },
              child: Text("Add"),
            );
            },
        ),

        TextButton(onPressed: (){},
        child:Text("Add")
        ),
      ],
    );
  }
}
