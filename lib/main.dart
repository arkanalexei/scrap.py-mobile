import 'package:flutter/material.dart';
import 'package:scrappy/pages/user/login.dart';
import 'package:scrappy/pages/user/register.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:scrappy/drawer.dart';
import 'package:scrappy/providers/userProvider.dart';
import 'package:pie_chart/pie_chart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),
    ],
    child: const MyApp(),
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
        drawer: const PublicDrawer(),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Home"),
          backgroundColor: const Color(0xFF003320),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.recycling,
                    size: 100,
                    color: Color(0xFF003320),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Scrap.py',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: !context.watch<UserProvider>().getLogin,
                    child: const Text("Login to see full features!"),
                  ),
                  Visibility(
                    visible: context.watch<UserProvider>().getLogin,
                    child: Text(
                        'Welcome to Scrap.py, ${context.watch<UserProvider>().getUsername}!'),
                  ),
                  Visibility(
                    visible: context.watch<UserProvider>().getLogin,
                    child: Text(
                        'So far, you have donated ${context.watch<UserProvider>().getTotalMass} kgs worth of trash! With net GHG emissions from recycling of ${context.watch<UserProvider>().getNetEmission} Kgs of CO2-eq/kg of mixed recyclables. Here\'s the breakdown:'),
                  ),
                  Visibility(
                    visible: context.watch<UserProvider>().getLogin,
                    child: PieChart(
                      dataMap: context.watch<UserProvider>().getDataMap,
                      chartRadius: MediaQuery.of(context).size.width / 2.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
