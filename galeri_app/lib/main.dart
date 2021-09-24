import 'package:flutter/material.dart';
import 'package:galeri_app/HomePage.dart';
import 'package:galeri_app/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> sessionControl() async {
    var sp = await SharedPreferences.getInstance();

    String spUserName = sp.getString("UserName") ?? "kullanıcı adı yok";
    String spPassword = sp.getString("Password") ?? "Şifre yok";

    if (spUserName == "admin" && spPassword == "123") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: sessionControl(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool passPermit = snapshot.data!;
            return passPermit ? HomePage() : Login();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center());
  }
}
