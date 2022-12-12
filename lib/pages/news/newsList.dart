import 'package:flutter/material.dart';
import 'package:scrappy/drawer.dart';
import 'package:scrappy/pages/news/fetchNews.dart';
import 'package:scrappy/pages/news/newsPage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/providers/userProvider.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _registerFormKey = GlobalKey<FormState>();
  late final Future finalFuture;
  @override
  void initState() {
    super.initState();
    finalFuture = fetchNews();
  }

  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: Text('North Depok Morning Post'),
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => NewsPage(
                                    pk: snapshot.data![index].pk,
                                    title: snapshot.data![index].fields.title,
                                    description: snapshot
                                        .data![index].fields.description,
                                    user: snapshot.data![index].fields.user,
                                    date: snapshot.data![index].fields.date))));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFF003320), width: 2.5),
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
                                        "${snapshot.data![index].fields.title}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // Visibility(
                                    //   visible: context
                                    //       .watch<UserProvider>()
                                    //       .getAdmin,
                                    //   child: TextButton(
                                    //     child: Text(
                                    //       "Delete",
                                    //       style: TextStyle(
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 15,
                                    //         color: Colors.red,
                                    //       ),
                                    //     ),
                                    //     onPressed: () async {
                                    //       var pk = snapshot.data![index].pk;
                                    //       final response = await request.post(
                                    //           "https://scrappy.up.railway.app/news/delete/$pk/",
                                    //           {});
                                    //     },
                                    //   ),
                                    // ),
                                    Visibility(
                                      visible: context
                                          .watch<UserProvider>()
                                          .getAdmin,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Center(
                                            child: TextButton(
                                              child: Text(
                                                "Delete",
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
                                                    "https://scrappy.up.railway.app/news/delete/$pk/",
                                                    {});

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(response[
                                                            'message'])));

                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const NewsList()));
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
