import 'package:flutter/material.dart';
import 'package:scrappy/main.dart';
import 'package:scrappy/drawer.dart';
import 'package:intl/intl.dart';
import 'package:scrappy/model/achiever.dart';

import 'package:provider/provider.dart';
import 'package:scrappy/components/deposit/recentDeposits.dart';
import 'package:scrappy/pages/leaderboard/fetchLeaderboard.dart';

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
              title: const Text("Leaderboard"),
              backgroundColor: const Color(0xFF003320),
            ),
            drawer: const PublicDrawer(),
            body: FutureBuilder<List<Achiever>>(
              future: fetchLeaderboard(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text(
                            "Leaderboard",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 25),
                          child: const Text(
                            "Top 10 Achievers",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 600,
                          child: ListView.separated(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(snapshot.data![index].fields.name),
                                leading: Text("#${index + 1}"),
                                trailing: Text(snapshot
                                    .data![index].fields.points
                                    .toString()),
                                // trailing: Text("haloooooo ")
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                          ),
                        ),
                      ],
                    ),
                  );
            
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const Center(child: const CircularProgressIndicator());
              },
            )));
  }
}
