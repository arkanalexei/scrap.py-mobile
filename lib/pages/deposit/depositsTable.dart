import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/pages/deposit/depositApi.dart';

class DepositsTable extends StatefulWidget {
  const DepositsTable({Key? key}) : super(key: key);

  @override
  _DepositsTableState createState() => _DepositsTableState();
}

class _DepositsTableState extends State<DepositsTable> {
  final _registerFormKey = GlobalKey<FormState>();
  late final Future completedFuture;
  @override
  void initState() {
    super.initState();
    completedFuture = fetchRecentDeposits();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
        future: completedFuture,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "You have no past deposits. Deposit now!",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return const Text("this is supposed to be ListView or smth");
            }
          }
        });
  }
}
