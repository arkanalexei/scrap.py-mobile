import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrappy/model/depositItem.dart';
import 'package:scrappy/pages/deposit/deposit.dart';

import '../../drawer.dart';

class DepositDetailPage extends StatelessWidget {
  const DepositDetailPage({
    super.key,
    required this.deposit,
  });

  final WasteDeposit deposit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PublicDrawer(),
      appBar: AppBar(
        title: Text('Deposit #${deposit.pk}'),
        backgroundColor: const Color(0xFF003320),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(80),
        child: Row(
          children: [
            // const BackButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const DepositHomePage()),
            //     );
            //   },
            // ),
            Expanded(
              flex: 2,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40), // if you need this
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(25)),
                      Text(
                        'Deposit #${deposit.pk} by user ${deposit.fields.user.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 36),
                      ),
                      Text(
                        DateFormat('dd MMMM yyyy - hh:mm')
                            .format(deposit.fields.date_time),
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      const Divider(thickness: 2, color: Colors.black),
                      const Padding(padding: EdgeInsets.all(10)),
                      Text(
                        'Desc: ${deposit.fields.description}',
                      ),
                      Text(
                        'Mass: ${deposit.fields.mass.toString()} kg',
                      ),
                      Text(
                        'Type: ${deposit.fields.type}',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
