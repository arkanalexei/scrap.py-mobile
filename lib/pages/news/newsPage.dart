import 'package:flutter/material.dart';
import 'package:scrappy/main.dart';
import 'package:scrappy/drawer.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatelessWidget {
  const NewsPage(
      {super.key,
      required this.pk,
      required this.title,
      required this.description,
      required this.user,
      required this.date});

  final int pk;
  final String title;
  final String description;
  final int user;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    // var date = date.toString().substring(0, 10);
    var dateStr = DateFormat('yMMMMd').format(date);
    var pkStr = pk.toString();
    var userStr = user.toString();

    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
          backgroundColor: Color(0xFF003320),
        ),

        // Menambahkan drawer menu
        drawer: PublicDrawer(),
        body: Column(
          children: [
            const SizedBox(height: 20.0),
            Container(
                child: Align(
              alignment: Alignment.center,
              child: Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
            )),
            const SizedBox(height: 20.0),
            Container(
                child: Align(
              alignment: Alignment.center,
              child: Text('Created $dateStr - News Issue #$pk',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            )),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xFF003320))),
                    )))
          ],
        ));
  }
}
