import 'package:flutter/material.dart';
import 'package:scrappy/main.dart';
import 'package:scrappy/drawer.dart';
import 'package:scrappy/pages/newsPage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/pages/tukarpoin/fetchPerks.dart';
import 'package:scrappy/providers/userProvider.dart';

class Redeem extends StatefulWidget {
  const Redeem({Key? key}) : super(key: key);

  @override
  _RedeemState createState() => _RedeemState();
}

class _RedeemState extends State<Redeem> {
  final _registerFormKey = GlobalKey<FormState>();
  late final Future finalFuture;
  @override
  void initState() {
    super.initState();
    finalFuture = fetchPerks();
  }

  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: Text('You have ${context.watch<UserProvider>().getPoints} points'),
          backgroundColor: Color(0xFF003320),
        ),

        // Menambahkan drawer menu
        drawer: PublicDrawer(),
        body: FutureBuilder(
            future: finalFuture,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada news :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${snapshot.data![index].fields.nama} - ${snapshot.data![index].fields.harga} points",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    
                                    Visibility(
                                      visible: context
                                          .watch<UserProvider>()
                                          .getLogin,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Container(
                                          decoration: BoxDecoration(color: Colors.green),
                                          child: Center(
                                            child: TextButton(
                                              child: Text(
                                                "Redeem",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              onPressed: () async {
                                                var pk =
                                                    snapshot.data![index].pk;
                                                final response = await request.post(
                                                    "https://scrappy.up.railway.app/tukarpoin/redeem/$pk/",
                                                    {});

                                                context.read<UserProvider>().savePoints(response['points']);

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(response[
                                                            'message'])));

                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const Redeem()));
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )));
                }
              }
            }));
  }
}
