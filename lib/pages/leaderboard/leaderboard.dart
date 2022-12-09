import 'package:flutter/material.dart';
import 'package:scrappy/main.dart';
import 'package:scrappy/drawer.dart';
import 'package:intl/intl.dart';
import 'package:scrappy/model/achiever.dart';

import 'package:provider/provider.dart';
import 'package:scrappy/components/deposit/recentDeposits.dart';
import 'package:scrappy/fetchLeaderboard.dart';



class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final _registerFormKey = GlobalKey<FormState>();
  late final Future finalFuture;

  @override
  void initState() {
    super.initState();
    finalFuture = fetchLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Leaderboard"),
              backgroundColor: Color(0xFF003320),
            ),
            drawer: PublicDrawer(),
            body: FutureBuilder<List<Achiever>>(
              future: fetchLeaderboard(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].fields.name),
                        subtitle: Text(snapshot.data![index].fields.points.toString()),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            )));
  }
}