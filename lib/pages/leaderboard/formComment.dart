// ignore_for_file: file_names, use_build_context_synchronously, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/drawer.dart';
import 'package:scrappy/pages/leaderboard/leaderboard.dart';

class CommentFormPage extends StatefulWidget {
  const CommentFormPage({super.key});

  @override
  State<CommentFormPage> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentFormPage> {
  final _formKey = GlobalKey<FormState>();

  /// Form Data (state) */
  String _comment = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      drawer: const PublicDrawer(),
      appBar: AppBar(
        title: const Text("Comment Form"),
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
                            hintText: "Write your comment here...",
                            labelText: "Comment",
                            icon: const Icon(Icons.add_comment_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {},
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Comment cannot be empty.';
                            } else {
                              try {
                                // equivalent to tryParse
                                // side effect (update state)
                                setState(() => _comment = value);
                              } on FormatException {
                                return 'Comment must be a valid number.';
                              }
                              return null;
                            }
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
                                'https://scrappy.up.railway.app/leaderboard/submit/flutter/',
                                {
                                  'comment': _comment
                                }
                              );
                              // response SHOULD be in json form
                              msg = response['message'].toString();
                              
                              // empty form
                              _formKey.currentState!.reset();

                              // redirect to leaderboard page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Board()),
                              );

                            } else {
                              msg = "Invalid form. Recheck your data.";
                            }
                            
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(msg)));
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
