import 'package:firebase_giris/pages/Login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 3,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Spacer(),
              Spacer(),
              Text(
                "Firebase İle Giriş Yapılmıştır.",
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.red[800],
                    size: 40,
                  )),
              Text(" Çıkış Yap"),
              Spacer(),
              Spacer(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
