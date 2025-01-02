import 'package:counter_state_management/counter_provider.dart';
import 'package:counter_state_management/screen2.dart';
import 'package:counter_state_management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Counter()),
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<Counter>().count;
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeProvider.themeData,
      home: MyHomePage(title: 'Flutter Demo Home Page...$count'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //to read a variable in the counter class
    final count = context.watch<Counter>().count;
    // final isDark = context.watch<ThemeProvider>().isDark;
    return Scaffold(
      // backgroundColor: isDark == false ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                      MaterialPageRoute(builder: (context) => Screen2()));
                },
                child: Text('Next Screen'))
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
