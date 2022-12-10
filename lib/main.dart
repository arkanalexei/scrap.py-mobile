import 'package:flutter/material.dart';
import 'package:scrappy/pages/login.dart';
import 'package:scrappy/pages/register.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:scrappy/drawer.dart';
import 'package:scrappy/providers/userProvider.dart';

import 'package:appcenter/appcenter.dart';
import 'package:appcenter_analytics/appcenter_analytics.dart';
import 'package:appcenter_crashes/appcenter_crashes.dart';
import 'package:flutter/foundation.dart';

void main() async {
  final ios = defaultTargetPlatform == TargetPlatform.iOS;

  var app_secret = ios ? "3290fb23-9b25-4a35-b4f1-b26e098838ec" : "96781fae-f8e4-4114-98c3-51e7c52c8d53";
  await AppCenter.start(app_secret, [AppCenterAnalytics.id, AppCenterCrashes.id]);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // final admin = context.watch<AdminProvider>();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        drawer: PublicDrawer(),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Home"),
          backgroundColor: Color(0xFF003320),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.recycling,
                    size: 100,
                    color: Color(0xFF003320),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Scrap.py',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
        
                  const SizedBox(height: 20),
                  
                  Visibility(
                    visible: !context.watch<UserProvider>().getLogin,
                    child: Text("Login to see full features!"),
                  ),
                  Visibility(
                    visible: context.watch<UserProvider>().getLogin,
                    child: Text(
                        'Welcome to Scrap.py, ${context.watch<UserProvider>().getUsername}!'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
