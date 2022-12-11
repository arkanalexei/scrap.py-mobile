import 'package:flutter/material.dart';
import 'package:scrappy/main.dart';
import 'package:scrappy/pages/deposit/deposit.dart';
import 'package:scrappy/pages/deposit/form.dart';
import 'package:scrappy/pages/leaderboard/formComment.dart';
import 'package:scrappy/pages/login.dart';
import 'package:scrappy/pages/register.dart';
import 'package:scrappy/pages/newsList.dart';
import 'package:scrappy/pages/newsSubmit.dart';
// leaderboard
import 'package:scrappy/pages/leaderboard/leaderboard.dart';
import 'package:scrappy/providers/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class PublicDrawer extends StatefulWidget {
  const PublicDrawer({super.key});
  @override
  _PublicDrawerState createState() => _PublicDrawerState();
}

class _PublicDrawerState extends State<PublicDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return SafeArea(
        child: Container(
      child: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu

            ListTile(
              leading: const Icon(Icons.recycling),
              iconColor: const Color(0xFF003320),
              title: const Text("Home"),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
           
            ExpansionTile(
              leading: const Icon(Icons.person),
              iconColor: const Color(0xFF003320),
              collapsedIconColor: const Color(0xFF003320),
              title: const Text("User"),
              textColor: const Color(0xFF198F85),
              children: [
                Visibility(
                  visible: !context.watch<UserProvider>().getLogin,
                  child: ListTile(
                    title: const Text('Login'),
                    onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: !context.watch<UserProvider>().getLogin,
                  child: ListTile(
                    title: const Text('Register'),
                    onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterPage()),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: context.watch<UserProvider>().getLogin,
                  child: ListTile(
                    title: const Text('Logout'),
                    onTap: () async {
                      // Route menu ke halaman form
                      final response = await request
                          .get("https://scrappy.up.railway.app/logout/");

                      context.read<UserProvider>().saveAdmin(false);
                      context.read<UserProvider>().saveLogin(false);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                  ),
                ),
              ],
            ),

            ExpansionTile(
              leading: const Icon(Icons.article),
              iconColor: const Color(0xFF003320),
              collapsedIconColor: const Color(0xFF003320),
              title: const Text("News"),
              textColor: const Color(0xFF198F85),
              children: [
                ListTile(
                  title: const Text('News List'),
                  onTap: () {
                    // Route menu ke halaman form
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const NewsList()),
                    );
                  },
                ),
                Visibility(
                  visible: context.watch<UserProvider>().getAdmin,
                  child: ListTile(
                    title: const Text('News Submit'),
                    onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const NewsSubmit()),
                      );
                    },
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(Icons.airline_seat_recline_normal_sharp),
              iconColor: const Color(0xFF003320),
              collapsedIconColor: const Color(0xFF003320),
              title: const Text("Deposit"),
              textColor: const Color(0xFF198F85),
              children: [
                ListTile(
                  title: const Text('Deposit Page'),
                  onTap: () {
                    // Route menu ke halaman form
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DepositHomePage()),
                    );
                  },
                ),
                Visibility(
                  visible: context.watch<UserProvider>().getLogin,
                  child: ListTile(
                    title: const Text('Waste Deposit Form'),
                    onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DepositFormPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(Icons.leaderboard_rounded),
              iconColor: const Color(0xFF003320),
              collapsedIconColor: const Color(0xFF003320),
              title: const Text("Leaderboard"),
              textColor: const Color(0xFF198F85),
              children: [
                ListTile(
                  title: const Text('Leaderboard'),
                  onTap: () {
                    // Route menu ke halaman form
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Board()),
                    );
                  },
                ),
                // Visibility(
                //   visible: context.watch<UserProvider>().getLogin,
                //   child: ListTile(
                //     title: const Text('Comment Form'),
                //     onTap: () {
                //       // Route menu ke halaman form
                //       Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const CommentFormPage()),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
