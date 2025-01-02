import 'package:counter_state_management/counter_provider.dart';
import 'package:counter_state_management/settings.dart';
import 'package:counter_state_management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    //to read a variable in the counter class
    final count = context.watch<Counter>().count;
    // final isDark = context.watch<ThemeProvider>().isDark;
    return Scaffold(
      // backgroundColor: isDark == false ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 100),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
                child: Text('Settings Screen'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //to call a method in counter class - increment method
          context.read<Counter>().incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
