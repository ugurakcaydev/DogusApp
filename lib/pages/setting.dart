import 'package:dogus_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Theme.of(context).colorScheme.primary,
          child: Row(
            children: [
              Text(
                "Göksu",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.exit_to_app,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
