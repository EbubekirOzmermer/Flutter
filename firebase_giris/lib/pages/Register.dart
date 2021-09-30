import 'package:firebase_giris/pages/Login.dart';
import 'package:firebase_giris/service/auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  //final TextEditingController _checkController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //bool onayliyorum = false;
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Container(
                height: size.height * .7,
                width: size.width * .85,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(.75),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.75),
                          blurRadius: 10,
                          spreadRadius: 2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                            controller: _nameController,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              hintText: 'Kullanıcı adı',
                              prefixText: ' ',
                              hintStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.white,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                            )),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextField(
                            controller: _emailController,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.white,
                              ),
                              hintText: 'E-Mail',
                              prefixText: ' ',
                              hintStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.white,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                            )),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              hintText: 'Telefon Numarası',
                              prefixText: ' ',
                              hintStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.white,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                            )),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                              hintText: 'Parola',
                              prefixText: ' ',
                              hintStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.white,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                            )),
                        SizedBox(
                          height: size.height * 0.02,
                        ),

                        /*CheckboxListTile(
                            activeColor: Colors.black,
                            title: Text(
                              "Onaylıyorum",
                              style: TextStyle(color: Colors.white),
                            ),
                            value: onayliyorum,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (bool? veri) {
                              print("Onaylıyorum seçildi : $veri");

                              setState(() {
                                onayliyorum = veri!;
                              });
                            }), */
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            _authService
                                .createPerson(
                              _nameController.text,
                              _emailController.text,
                              _passwordController.text,
                              _phoneNumberController.text,
                            )
                                .then((value) {
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                  child: Text(
                                "Kaydet",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: size.height * .06, left: size.width * .02),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.black.withOpacity(.75),
                      size: 26,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                  ),
                  Text(
                    "Kayıt ol",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(.75),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
