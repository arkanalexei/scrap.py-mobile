// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/components/deposit/depositCard.dart';
import 'package:scrappy/model/depositItem.dart';

import '../../providers/constants.dart';

class RecentDeposits extends StatefulWidget {
  const RecentDeposits({Key? key}) : super(key: key);

  @override
  RecentDepositsState createState() => RecentDepositsState();
}

class RecentDepositsState extends State<RecentDeposits> {
  late final Future completedFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var request = context.watch<CookieRequest>();
    completedFuture = request.get('$SITE_URL/deposit/json/');

    return FutureBuilder(
        future: completedFuture,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text("You have no past deposits. Deposit now!"),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return widgetify(snapshot.data!);
            }
          }
        });
  }
}

Widget widgetify(List<dynamic> data) {
  List<Widget> arr = List<Widget>.generate(
    min(data.length, 4),
    (index) => DepositCard(
        deposit: WasteDeposit.fromJson(data[data.length - index - 1])),
  );

  return Column(children: arr);
}
