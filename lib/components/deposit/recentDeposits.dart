import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/components/deposit/depositCard.dart';
import 'package:scrappy/model/depositItem.dart';

class RecentDeposits extends StatefulWidget {
  const RecentDeposits({Key? key}) : super(key: key);

  @override
  _RecentDepositsState createState() => _RecentDepositsState();
}

class _RecentDepositsState extends State<RecentDeposits> {
  final _registerFormKey = GlobalKey<FormState>();
  late final Future completedFuture;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var request = context.watch<CookieRequest>();
    completedFuture =
        request.get('https://scrappy.up.railway.app/deposit/json/');

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
              return WidgetsFromList(snapshot.data!);
            }
          }
        });
  }
}

Widget WidgetsFromList(List<dynamic> data) {
  List<Widget> arr = List<Widget>.generate(
    data.length,
    (index) => DepositCard(deposit: WasteDeposit.fromJson(data[index])),
  );

  return Row(children: arr);
}
