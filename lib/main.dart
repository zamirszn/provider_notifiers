import 'package:flutter/material.dart';
import 'package:provider_notifiers/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider_notifiers/item_add_notifier.dart';
import 'package:provider_notifiers/shop_name_notifier.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddItemNotifier>(
          create: (context) => AddItemNotifier(),
        ),
        ChangeNotifierProvider<ShopNameNotifier>(
          create: (context) => ShopNameNotifier(),
        ),
      ], 
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
