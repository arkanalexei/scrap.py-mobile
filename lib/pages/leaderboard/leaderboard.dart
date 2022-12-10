import 'package:flutter/material.dart';
import 'package:scrappy/main.dart';
import 'package:scrappy/drawer.dart';
import 'package:intl/intl.dart';
import 'package:scrappy/model/achiever.dart';

import 'package:provider/provider.dart';
import 'package:scrappy/components/deposit/recentDeposits.dart';
import 'package:scrappy/model/comment.dart';
import 'package:scrappy/pages/leaderboard/fetchLeaderboard.dart';
import 'package:scrappy/pages/leaderboard/fetchComment.dart';


import '../../providers/userProvider.dart';
import '../deposit/form.dart';
import 'formComment.dart';

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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<List<Achiever>>(
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
                                  itemCount: 10,
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
                  ),
                  // little gap
                  const Padding(padding: EdgeInsets.all(10.0)),
                  
                  // comment section
                  //if login
                  Visibility(
                    visible: context.watch<UserProvider>().getLogin,
                    child: Column(
                      children: [
                        // comment section
                        Container(
                          margin: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Comments Section",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        FutureBuilder<List<Comment>>(
                          future: fetchComments(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: 500,
                                child: ListView.separated(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(snapshot.data[index].fields.nama),
                                      subtitle: Text(DateFormat('dd-MM-yyyy').format(snapshot.data[index].fields.dateAdded)),
                                      // trailing: Text('"${snapshot.data[index].fields.comment}"'),
                                      //show the comment longer

                                      trailing: Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: SizedBox(
                                          width: 450,
                                          child: Text(
                                            '"${snapshot.data[index].fields.comment}"',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 7,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                  (BuildContext context, int index) =>
                                  const Divider(),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return const Center(child: const CircularProgressIndicator());
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, bottom: 30, top: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CommentFormPage()),
                              );
                            },
                            child: const Text("Send Comment")),
                        ),
                        // send comment button
                        
                        //gap
                        
                      ],
                    ),
                  ),
                  //if not login
                  Visibility(
                    visible: !context.watch<UserProvider>().getLogin,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                      child: Column(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Comments Section",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          //gap
                          Padding(padding: EdgeInsets.all(5.0)),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Please log in first to see the comment section",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          //gap
                          Padding(padding: EdgeInsets.all(20.0)),
                        ],
                      )
                    )
                  )
                ],
              ),
            )
        )
    );
  }
}
