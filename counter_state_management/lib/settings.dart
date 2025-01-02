import 'package:counter_state_management/main.dart';
import 'package:counter_state_management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDark;
    return Scaffold(
      // backgroundColor: isDark == false ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Settings Screen'),
      ),
      body: Center(
        child: Switch(
            value: isDark,
            onChanged: (val) {
              context.read<ThemeProvider>().toggleTheme();
            }),
      ),
    );
  }
}
