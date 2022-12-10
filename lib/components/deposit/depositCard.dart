import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrappy/components/deposit/depositDetailPage.dart';
import 'package:scrappy/model/depositItem.dart';

class DepositCard extends StatelessWidget {
  const DepositCard({
    super.key,
    required this.deposit,
  });

  final WasteDeposit deposit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DepositDetailPage(deposit: deposit)),
      ),
      child: SizedBox(
        height: 125,
        child: Card(
          elevation: 3.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deposit.fields.description,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  DateFormat('dd MMMM yyyy').format(deposit.fields.date_time),
                  style: TextStyle(fontSize: 11),
                ),
                const Divider(),
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
    );
  }
}
