import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/drawer.dart';
import 'package:scrappy/pages/about/feedback.dart';
import '../../providers/constants.dart';

class FeedbackFormPage extends StatefulWidget {
  const FeedbackFormPage({super.key});

  @override
  State<FeedbackFormPage> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackFormPage> {
  final _feedbackFormKey = GlobalKey<FormState>();

  String _name = "";
  String _message = "";
  double _star = 1;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      drawer: const PublicDrawer(),
      appBar: AppBar(
        title: const Text("Feedback Form"),
        backgroundColor: const Color(0xFF003320),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Form(
                key: _feedbackFormKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Your Name",
                            labelText: "Name",
                            icon: const Icon(Icons.badge),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _name = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Name cannot be empty.';
                            }
                            return null;
                          },
                        ),

                        const Padding(padding: EdgeInsets.all(10)),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Your message...",
                            labelText: "message",
                            icon: const Icon(Icons.textsms),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _message = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Message cannot be empty.';
                            }
                            return null;
                          },
                        ),

                        const Padding(padding: EdgeInsets.all(10)),
                        ListTile(
                          leading: const Icon(Icons.star),
                          title: Row(
                            children: [
                              Text('${_star.round()} star(s)'),
                            ],
                          ),
                          subtitle: Slider(
                            value: _star,
                            min: 1,
                            max: 5,
                            divisions: 4,
                            label: _star.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _star = value;
                              });
                            },
                          ),
                        ),

                        const Padding(padding: EdgeInsets.all(20.0)),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () async {
                            String notes = "";
                            if (_feedbackFormKey.currentState!.validate()) {
                              final response = await request.post(
                                '$SITE_URL/about/json/',
                                jsonEncode({
                                  'name': _name,
                                  'message': _message,
                                  'star': _star,
                                }),
                              );
                              notes = response['message'].toString();
                            } else {
                              notes = "Invalid form. Recheck your data.";
                            }
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(notes)));
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
