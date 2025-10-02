import 'package:flutter/material.dart';
import 'package:flutter_with_provider_state_management/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    print('huhj');
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                value: value.value,
                onChanged: (val) {
                  value.onChangeValue(val);
                },
              );
            },
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: value.value),
                      ),
                      height: 100,
                      child: Center(child: Text('Box 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.red.withValues(alpha: value.value)),
                      height: 100,
                      child: Center(child: Text('Box 2')),
                    ),
                  ),
                ],
              );
            },
          ),

        ],
      ),
    );
  }
}
