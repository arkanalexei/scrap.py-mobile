import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/drawer.dart';
import 'package:scrappy/pages/deposit/deposit.dart';
import '../../providers/constants.dart';

class DepositFormPage extends StatefulWidget {
  const DepositFormPage({super.key});

  @override
  State<DepositFormPage> createState() => _DepositFormState();
}

class _DepositFormState extends State<DepositFormPage> {
  final _formKey = GlobalKey<FormState>();

  /** Form Data (state) */
  double _mass = 0.0;
  String _description = "";
  String _type = "PLASTIK";
  // int user; // automatic
  // DateTime date_time; // automatic

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
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
                          onChanged: (String? value) {},
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Mass cannot be empty.';
                            } else {
                              try {
                                // equivalent to tryParse
                                double num = double.parse(value);
                                if (num <= 0) {
                                  return 'Mass cannot be zero or negative.';
                                }
                                // side effect (update state)
                                setState(() => _mass = num);
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
                        const Padding(padding: EdgeInsets.all(20.0)),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () async {
                            String msg = "";
                            if (_formKey.currentState!.validate()) {
                              // send data to server
                              final response = await request.post(
                                '$SITE_URL/deposit/submit/',
                                jsonEncode({
                                  'description': _description,
                                  'mass': _mass,
                                  'type': _type,
                                }),
                              );
                              // response SHOULD be in json form
                              msg = response['message'].toString();
                            } else {
                              msg = "Invalid form. Recheck your data.";
                            }
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(msg)));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Submit",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
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
