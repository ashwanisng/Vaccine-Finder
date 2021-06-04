import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine_finder/screens/homepage.dart';
import 'package:vaccine_finder/screens/splash_screen.dart';
import 'package:vaccine_finder/theme/style.dart';
import 'package:vaccine_finder/theme/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashSCreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchValue = false;
  ThemeProvider themeProvider = ThemeProvider();

  void getCurrentTheme() async {
    themeProvider.darkTheme = await themeProvider.themePrefrences.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Style.themeData(themeProvider.darkTheme),
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xff676FFE),
                title: Text('Where is my Vaccine'),
                actions: [
                  Switch(
                      value: switchValue,
                      onChanged: (val) {
                        themeProvider.darkTheme = !themeProvider.darkTheme;
                        setState(() {
                          switchValue = val;
                        });
                      })
                ],
              ),
              body: DataFeild(),
            ),
          );
        },
      ),
    );
  }
}
