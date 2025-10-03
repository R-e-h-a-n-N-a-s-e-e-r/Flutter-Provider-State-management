import 'package:flutter/material.dart';
import 'package:flutter_with_provider_state_management/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Theme Changer',
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
          RadioMenuButton<ThemeMode>(
            value: ThemeMode.light,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.changeTheme,
            child: Text('light Mode'),
          ),
          RadioMenuButton<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.changeTheme,
            child: Text('dark Mode'),
          ),
          RadioMenuButton<ThemeMode>(
            value: ThemeMode.system,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.changeTheme,
            child: Text('system Mode'),
          ),
        ],
      ),
    );
  }
}
