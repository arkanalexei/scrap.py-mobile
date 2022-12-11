import 'package:flutter/material.dart';
import 'package:scrappy/main.dart';
import 'package:scrappy/pages/deposit/deposit.dart';
import 'package:scrappy/pages/deposit/form.dart';
import 'package:scrappy/pages/tukarpoin/redeem.dart';
import 'package:scrappy/pages/login.dart';
import 'package:scrappy/pages/register.dart';
import 'package:scrappy/pages/newsList.dart';
import 'package:scrappy/pages/newsSubmit.dart';
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
              leading: Icon(Icons.recycling),
              iconColor: Color(0xFF003320),
              title: const Text("Home"),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),

            ExpansionTile(
              leading: Icon(Icons.person),
              iconColor: Color(0xFF003320),
              collapsedIconColor: Color(0xFF003320),
              title: Text("User"),
              textColor: Color(0xFF198F85),
              children: [
                Visibility(
                  visible: !context.watch<UserProvider>().getLogin,
                  child: ListTile(
                    title: const Text('Login'),
                    onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
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
                        MaterialPageRoute(builder: (context) => RegisterPage()),
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
                      // final response = await request.logout('https://scrappy.up.railway.app/logout/');
                      final response = await request
                          .get("https://scrappy.up.railway.app/logout/");

                      context.read<UserProvider>().saveAdmin(false);
                      context.read<UserProvider>().saveLogin(false);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ),
              ],
            ),

            ExpansionTile(
              leading: Icon(Icons.article),
              iconColor: Color(0xFF003320),
              collapsedIconColor: Color(0xFF003320),
              title: Text("News"),
              textColor: Color(0xFF198F85),
              children: [
                ListTile(
                  title: const Text('News List'),
                  onTap: () {
                    // Route menu ke halaman form
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NewsList()),
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
                        MaterialPageRoute(builder: (context) => NewsSubmit()),
                      );
                    },
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(Icons.airline_seat_recline_normal_sharp),
              iconColor: Color(0xFF003320),
              collapsedIconColor: Color(0xFF003320),
              title: Text("Deposit"),
              textColor: Color(0xFF198F85),
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

            Visibility(
              visible: context.watch<UserProvider>().getLogin,
              child: ExpansionTile(
                leading: Icon(Icons.article),
                iconColor: Color(0xFF003320),
                collapsedIconColor: Color(0xFF003320),
                title: Text("Tukar Poin"),
                textColor: Color(0xFF198F85),
                children: [
                  ListTile(
                    title: Text("Create"),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Redeem())
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
