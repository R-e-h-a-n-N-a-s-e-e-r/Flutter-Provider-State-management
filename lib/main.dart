import 'package:flutter/material.dart';
import 'package:flutter_with_provider_state_management/provider/count_provider.dart';
import 'package:flutter_with_provider_state_management/provider/favourite_item_provider.dart';
import 'package:flutter_with_provider_state_management/provider/slider_provider.dart';
import 'package:flutter_with_provider_state_management/provider/theme_provider.dart';
import 'package:flutter_with_provider_state_management/screens/change_theme.dart';
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
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],

      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            themeMode: themeChanger.themeMode,
            home: ChangeTheme(),
          );
        },
      ),
    );
  }
}
