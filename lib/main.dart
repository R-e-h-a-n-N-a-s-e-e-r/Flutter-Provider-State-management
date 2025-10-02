import 'package:flutter/material.dart';
import 'package:flutter_with_provider_state_management/provider/count_provider.dart';
import 'package:flutter_with_provider_state_management/provider/favourite_item_provider.dart';
import 'package:flutter_with_provider_state_management/provider/slider_provider.dart';
import 'package:flutter_with_provider_state_management/screens/screen_2.dart';
import 'package:flutter_with_provider_state_management/screens/screen_3.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_)=>FavouriteItemProvider())
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Screen3(),
      ),
    );
  }
}
