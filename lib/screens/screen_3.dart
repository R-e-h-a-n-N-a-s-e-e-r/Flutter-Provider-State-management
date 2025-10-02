import 'package:flutter/material.dart';
import 'package:flutter_with_provider_state_management/provider/favourite_item_provider.dart';
import 'package:provider/provider.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingCart()),
            );
          },
          child: Icon(Icons.shopping_cart, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Favourite',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouriteItemProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        value.addItem(index);
                        // value.removeItem(index);
                      },
                      title: Text('Item $index'),
                      trailing: value.favouriteItem.contains(index)
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border_outlined),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Shopping Cart',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer<FavouriteItemProvider>(
            builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: value.favouriteItem.length,
                  itemBuilder: (context, index) {
                    final item = value.favouriteItem[index];
                    return ListTile(
                      onTap: () {
                        value.addItem(item);
                      },
                      title: Text('Item $item'),
                      trailing: value.favouriteItem.contains(item)
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border_outlined),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
