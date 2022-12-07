import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/drawer.dart';
import 'package:scrappy/model/depositItem.dart';

import 'api.dart';

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
  // int user;
  double _mass = 0.0;
  String _description = "";
  // DateTime date_time;
  String _type = "PLASTIK";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      drawer: const PublicDrawer(),
      appBar: AppBar(
        title: const Text("Waste Deposit Form"),
        backgroundColor: const Color(0xFF003320),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Text("Form Title"),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Mass (in kilograms)...",
                            labelText: "Mass",
                            icon: const Icon(Icons.scale_sharp),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            ;
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Mass cannot be empty.';
                            } else {
                              try {
                                // should use tryParse
                                double.parse(value);
                                setState(() {
                                  _mass = double.parse(value);
                                });
                              } on FormatException {
                                return 'Mass must be a valid number.';
                              }
                              return null;
                            }
                          },
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Plastic bottles...",
                            labelText: "Description",
                            icon: const Icon(Icons.textsms),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _description = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Description must not be empty.';
                            }
                            return null;
                          },
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        const ListTile(
                          leading: Icon(Icons.checklist_sharp),
                          title: Text("Type"),
                        ),
                        CheckboxListTile(
                          title: const Text('Plastics'),
                          value: _type == "PLASTIK",
                          onChanged: (bool? value) {
                            setState(() {
                              if (value!) _type = "PLASTIK";
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Glass'),
                          value: _type == "KACA",
                          onChanged: (bool? value) {
                            setState(() {
                              if (value!) _type = "KACA";
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Paper / Cardboard'),
                          value: _type == "KERTAS",
                          onChanged: (bool? value) {
                            setState(() {
                              if (value!) _type = "KERTAS";
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Organik & Lainnya'),
                          value: _type == "ETC",
                          onChanged: (bool? value) {
                            setState(() {
                              if (value!) _type = "ETC";
                            });
                          },
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // submitDeposit(request, _description, _mass);
                              debugPrint("MAKING POST REQUEST");
                              // i think response needs to be JSON and not the (redirect) full html page.
                              final response = await request.postJson(
                                'https://scrappy.up.railway.app/deposit/submit/',
                                jsonEncode({
                                  'description': _description,
                                  'mass': _mass,
                                  'type': _type,
                                }),
                              );
                              debugPrint("FINISHING POST REQUEST");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Your deposit has been saved!'),
                              ));
                            } else {
                              debugPrint("FORM NOT VALID");
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
