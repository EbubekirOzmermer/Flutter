import 'package:avukatlik_isi/Bank.dart';
import 'package:avukatlik_isi/SettingsPage.dart';
import 'package:flutter/material.dart';

class SettingBottomBar extends StatefulWidget {
  const SettingBottomBar({Key? key}) : super(key: key);

  @override
  _SettingBottomBarState createState() => _SettingBottomBarState();
}

class _SettingBottomBarState extends State<SettingBottomBar> {
  int seciliSayfa = 0;
  void sayfaDegistir(int index) {
    setState(() {
      seciliSayfa = index;
    });
  }

  Widget sayfaGoster(int seciliSayfa) {
    if (seciliSayfa == 0) {
      return Bank();
    } else if (seciliSayfa == 1) {
      return SettingsPage();
    } else if (seciliSayfa == 2) {
      return Center();
    } else {
      return Center();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 98 / 100,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Card(
                color: Colors.white,
                child: sayfaGoster(seciliSayfa),
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 20 / 100,
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                currentIndex: seciliSayfa,
                onTap: sayfaDegistir,
                type: BottomNavigationBarType.fixed,
                iconSize: 5,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFbc4b4f),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFbc4b4f),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFbc4b4f),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      label: ""),
                ],
              ),
            ),
            /********* */
            //DialogMesaj(),
            /********* */
          ],
        ),
      ],
    );
  }
}
