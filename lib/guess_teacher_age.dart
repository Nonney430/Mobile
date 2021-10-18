import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:hello/services/api.dart';

class Age extends StatefulWidget {
  const Age({Key? key}) : super(key: key);

  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  static var year = 0;
  static var month = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GUESS TEACHER'S AGE"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('อายุอาจารย์',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SpinBox(
                      decoration: InputDecoration(
                          labelText: 'ปี',
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      min: 0,
                      max: 100,
                      value: year.toDouble(),
                      onChanged: (value) {year = value.toInt();},

                    ),
                    SpinBox(
                      decoration: InputDecoration(
                          labelText: 'เดือน',
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      min: 0,
                      max: 11,
                      value: month.toDouble(),
                      onChanged: (value) {month = value.toInt();},
                    ),
                    ElevatedButton(onPressed: () => {
                      setState(() async {
                        var res = await Api().submit('guess_teacher_age', {'year' : 25,'month' : 6});
                        print(year.toInt());
                        print(month.toInt());
                        _showMaterialDialog("ผลการทาย",res['text']);
                      })
                    }, child: Text('ทาย')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
