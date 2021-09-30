import 'package:flutter/material.dart';
import 'package:galeri_app/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  Future<bool> sessionControl() async {
    var sp = await SharedPreferences.getInstance();

    String spUserName = sp.getString("UserName") ?? "Kullanıcı Adı Yok";
    String spPassword = sp.getString("Password") ?? "Şifre Yok";

    if (spUserName == "admin" && spPassword == "123") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeri',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder<bool>(
          future: sessionControl(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              bool passPermit = snapshot.data!;
              return passPermit ? HomePage() : LoginScreen();
            } else {
              return Container();
            }
          }),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var tfUserName = TextEditingController();
  var tfPassword = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  final snackBar = SnackBar(content: Text("Giriş Hatalı"));

  Future<void> loginControl() async {
    var un = tfUserName.text;
    var p = tfPassword.text;

    if (un == "admin" && p == "123") {
      var sp = await SharedPreferences.getInstance();

      sp.setString("UserName", un);
      sp.setString("Password", p);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  icon: Icon(Icons.person),
                  labelText: "Kullanıcı Adı",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                controller: tfUserName,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  icon: Icon(Icons.password_sharp),
                  labelText: "Şifre",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                controller: tfPassword,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    loginControl();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
