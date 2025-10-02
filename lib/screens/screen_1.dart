import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_with_provider_state_management/provider/count_provider.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.counterFunc();
      // print('Timer' + countProvider.count.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('Building');
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            return Text(value.count.toString(), style: TextStyle(fontSize: 50));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.counterFunc();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
