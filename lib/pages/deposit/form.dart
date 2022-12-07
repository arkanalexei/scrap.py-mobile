import 'package:flutter/material.dart';
import 'package:scrappy/drawer.dart';

// void main() {
//   runApp(const FormApp());
// }

// class DepositFormPage extends StatelessWidget {
//   const DepositFormPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const BudgetForm(title: 'Form'),
//     );
//   }
// }

class DepositFormPage extends StatefulWidget {
  const DepositFormPage({super.key});

  @override
  State<DepositFormPage> createState() => _DepositFormState();
}

class _DepositFormState extends State<DepositFormPage> {
  final _formKey = GlobalKey<FormState>();
  // final List<String> typeChoices = <String>['Pemasukan', 'Pengeluaran'];

  // Form Data (state)
  String name = "";
  double amount = 0.0;
  String type = "Pilih salah satu...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PublicDrawer(),
      appBar: AppBar(
        title: const Text("Waste Deposit Form"),
        backgroundColor: const Color(0xFF003320),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("Your recent deposits"),
          ],
        ),
      ),
    );
  }
}
