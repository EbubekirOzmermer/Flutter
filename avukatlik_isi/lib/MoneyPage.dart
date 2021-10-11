import 'package:avukatlik_isi/Kazanc.dart';
import 'package:flutter/material.dart';

class MoneyPage extends StatefulWidget {
  const MoneyPage({Key? key}) : super(key: key);

  @override
  _MoneyPageState createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 1,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Ödemeler",
              ),
              Tab(
                text: "Kazançlar",
              ),
            ],
            labelColor: Colors.black,
            indicatorWeight: 1,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        body: TabBarView(children: [
          Kazanc(),
          Kazanc(),
        ]),
      ),
    );

    /*Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 270,
            child: Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xFFFD9515c),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ButtonBar(
                  children: [
                    SizedBox(
                      height: 45,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFD9515c)),
                        onPressed: () {},
                        child: Text(
                          "Ödemelerim",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFD9515c)),
                        onPressed: () {
                          setState(() {
                            
                          });
                        },
                        child: Text(
                          "Kazancım",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ); */
  }
}
