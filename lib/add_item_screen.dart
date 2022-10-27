import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_notifiers/item_add_notifier.dart';
import 'package:provider_notifiers/shop_name_notifier.dart';

class AddItemScreen extends StatelessWidget {
  AddItemScreen({super.key});
  final TextEditingController textCtrl = TextEditingController();
  final TextEditingController shopCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add item"),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          TextField(
            controller: textCtrl,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15), hintText: "Items name"),
          ),
          TextField(
            controller: shopCtrl,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15), hintText: "Shop name"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            
            onPressed: () async {
              if (textCtrl.text.isEmpty) {
                return;
              }
              await Provider.of<AddItemNotifier>(context, listen: false)
                  .addItem(textCtrl.text);
              Navigator.pop(context);
            },
            child: const Text("Add Item"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddItemScreen(),
                  ));
            },
            child: const Text("Add New Screen"),
          ),
          TextButton(
            onPressed: () async {
              await Provider.of<ShopNameNotifier>(context, listen: false)
                  .updateShopName(shopCtrl.text);
              Navigator.pop(context);
            },
            child: const Text("Update Shop"),
          ),
        ]),
      ),
    );
  }
}
