import 'package:flutter/material.dart';

class Bank extends StatefulWidget {
  const Bank({Key? key}) : super(key: key);

  @override
  _BankState createState() => _BankState();
}

class _BankState extends State<Bank> {
  
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  "Banka Bilgileriniz",
                  style: TextStyle(
                      color: Color(0xFFFD9515c),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xFFFD9515c),
                  indent: 55,
                  endIndent: 55,
                ),
                Text(
                  "IBAN numarası sizin adınıza olmalıdır!",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    width: screenWidth - 10,
                    height: screenHeight/7.7,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFbc4b4f),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, right: 205),
                            child: Text(
                              "Iban Numaranız",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(top: 14, left: 5),
                                filled: true,
                                fillColor: Color(0xFFFbc4b4f),
                                hintText: 'TR00 0000 0000 0000 0000 0000 00',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFbc4b4f),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 205),
                          child: Text(
                            "Banka Adı / Şubesi",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(top: 14, left: 5),
                              filled: true,
                              fillColor: Color(0xFFFbc4b4f),
                              hintText: 'ISBANK',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*Column(
            children: [
              Text(
                "Onaylı Üyelik",
                style: TextStyle(
                    color: Color(0xFFFD9515c),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 1,
                color: Color(0xFFFD9515c),
                indent: 55,
                endIndent: 55,
              ),
              Text(
                ".....",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ), */
        ],
      ),
    );
  }
}
