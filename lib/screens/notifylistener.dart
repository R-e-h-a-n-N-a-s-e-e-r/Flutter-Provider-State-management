import 'package:flutter/material.dart';

class NotifyListener extends StatelessWidget {
  NotifyListener({super.key});

  final ValueNotifier<int> _count = ValueNotifier<int>(0);
  final ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print('Built');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text('NotifyListener'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder(
              valueListenable: _toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: _toggle.value,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffix: InkWell(
                      onTap: () {
                        _toggle.value = !_toggle.value;
                      },
                      child: Icon(
                        _toggle.value == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _count,
              builder: (context, value, child) {
                return Text(
                  _count.value.toString(),
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _count.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
