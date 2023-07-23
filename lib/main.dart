import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQoutesApp());
}

class FunnyQoutesApp extends StatelessWidget {
  const FunnyQoutesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'คนที่คิดไปไกล สุดท้ายก็ต้องเติมน้ำมัน',
    'โตมาถึงได้รู้ว่า โลกไม่ได้สวยเหมือนเรา',
    'ชีวิตไม่เคยเป็นภาระใครเลย นอกจากสิ่งศักดิ์สิทธิ์',
    'ยายเธอจะว่าอะไรมั้ย? ที่เราชอบมองตาเธอ',
    'เราซื่อสัตย์นะ เธอซื่อหยัง?',
    'แมวอะชอบเกา ส่วนเราอะชอบแก',
    'ระหว่างแชมพูกับเรา อะไรเข้าตาเธอมากกว่ากัน?',
    'พร้อมบวกตลอดอะ โทรศัพท์มีเครื่องคิดเลข',
    'ทำไมเธอเลือกเขา ขนาดพระยังเลือก...ฉันเลย',
  ];
  List<Color> colorList = [
    Colors.purple,
    Colors.deepPurpleAccent,
    Colors.blueAccent,
    Colors.lightBlueAccent,
    Colors.lightGreen,
    Colors.yellow.shade600,
    Colors.orangeAccent,
    Colors.red,
    Colors.pinkAccent,
  ];
  var quote = quoteList[0]; // state variable
  Color textColor = Colors.green;

  int previousIndex = -1;
  int previousIndex2 = -1;

  void handleClickGo() {
    setState(() {
      var rand = Random();
      int randomIndex;
      int randomIndex2;
      do {
        randomIndex = rand.nextInt(quoteList.length);
        randomIndex2 = rand.nextInt(colorList.length);
      } while (randomIndex == previousIndex || randomIndex2 == previousIndex2);
      previousIndex = randomIndex;
      previousIndex2 = randomIndex2;
      quote = quoteList[randomIndex];
      textColor = colorList[randomIndex2];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคม/แคปชั่นกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote, //positional parameter/argument
            //named parameter/argument
            style: TextStyle(
              color: textColor,
              fontSize: 45,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w100,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
