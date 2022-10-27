import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_notifiers/add_item_screen.dart';
import 'package:provider_notifiers/item_add_notifier.dart';
import 'package:provider_notifiers/shop_name_notifier.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Providers"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddItemScreen(),
                  ));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Consumer<AddItemNotifier>(
              builder: (context, itemAddNotifier, child) {
                return Container(
                  color: Colors.blue,
                  height: 300,
                  child: ListView.builder(
                    itemCount: itemAddNotifier.itemList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          itemAddNotifier.itemList[index].itemName,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Consumer<ShopNameNotifier>(
              builder: (context, value, child) {
                return Text(
                  "Shop name: ${value.shopName}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
