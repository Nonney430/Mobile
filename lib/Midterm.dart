import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:
            Palette.myColor, // กำหนดธีมโดยใช้ชุดสี myColor ในคลาส Palette
      ),
      home: Midterm(),
    );
  }
}

// เพิ่มคลาสนี้
class Palette {
  static const MaterialColor myColor = const MaterialColor(
    0xff8b2030,
    const <int, Color>{
      50: const Color(0xff7d1d2b), //10%
      100: const Color(0xff6f1a26), //20%
      200: const Color(0xff611622), //30%
      300: const Color(0xff53131d), //40%
      400: const Color(0xff461018), //50%
      500: const Color(0xff380d13), //60%
      600: const Color(0xff2a0a0e), //70%
      700: const Color(0xff1c060a), //80%
      800: const Color(0xff0e0305), //90%
      900: const Color(0xff000000), //100%
    },
  );
}

class Midterm extends StatefulWidget {
  const Midterm({Key? key}) : super(key: key);

  @override
  _MidtermState createState() => _MidtermState();
}

class _MidtermState extends State<Midterm> {
  int score_red = 0;
  int score_blue = 0;
  int ten = 10;
  int nine = 9;
  int round = 0;

  bool end = false;
  bool press_red = false;
  bool press_blue = false;
  bool press = false;

  _button_red() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            score_red += ten;
            score_blue += nine;
            round++;
            press_red = true;
            press_blue = false;
            press = true;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFA00000),
        ),
        child: Icon(
          Icons.person,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  _button_blue() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            score_blue += ten;
            score_red += nine;
            round++;
            press_blue = true;
            press_red = false;
            press = true;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF0000A0),
        ),
        child: Icon(
          Icons.person,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var round_result = Row(
      children: [
        Text('$score_red' ,style: TextStyle(fontSize: 30),),
        Text('Round $round'),
        Text('$score_blue',style: TextStyle(fontSize: 30),),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("OLYMPIC BOXING SCORING"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: Center(
                  child: Text(
                "Women's Light (57-60kg) Semi-final",
                style: TextStyle(color: Colors.white),
              )),
              height: 25,
            ),
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Color(0xFFA00000),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/flag_ireland.png'),
                            width: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "IRELAND",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "HARRINTON Kellie Anne",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Color(0xFF0000A0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image:
                                AssetImage('assets/images/flag_thailand.png'),
                            width: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "THAILAND",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "SEESONDEE Sudaporn",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Color(0xFFA00000),
                      height: 5,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Color(0xFF0000A0),
                      height: 5,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(var i = 0;i<round;i++)
                    round_result
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _button_red(),
                    SizedBox(
                      width: 5.0,
                    ),
                    _button_blue(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
