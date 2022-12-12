

// import 'dart:ffi';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/main.dart';
import 'package:flutter/services.dart';
import 'package:scrappy/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:scrappy/pages/news/newsList.dart';
import 'package:scrappy/pages/tukarpoin/redeem.dart';


class CreatePerks extends StatefulWidget {
  const CreatePerks({super.key});
  @override
  State<CreatePerks> createState() => _CreatePerksState();
}

class _CreatePerksState extends State<CreatePerks> {
  final _formKey = GlobalKey<FormState>();
  String _nama = "";
  String _deskripsi = "";
  String _harga = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Perks'),
        backgroundColor: Color(0xFF003320),
      ),

      // Menambahkan drawer menu
      drawer: PublicDrawer(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Name",
                          labelText: "Name",
                          // Menambahkan icon agar lebih intuitif
                          icon: const Icon(Icons.title),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            _nama = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            _nama = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Name can not be empty!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Description",
                          labelText: "Description",
                          // Menambahkan icon agar lebih intuitif
                          icon: const Icon(Icons.description),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          // String _nominal = _nominalController.text;
                          // int.parse(_nominal);
                          setState(() {
                            _deskripsi = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          // String _nominal = _nominalController.text;
                          // int.parse(_nominal);
                          setState(() {
                            _deskripsi = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Description can not be empty!';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20.0),

                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText: "Price",
                          labelText: "Price",
                          // Menambahkan icon agar lebih intuitif
                          icon: const Icon(Icons.numbers),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          // String _nominal = _nominalController.text;
                          // int.parse(_nominal);
                          setState(() {
                            _harga = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          // String _nominal = _nominalController.text;
                          // int.parse(_nominal);
                          setState(() {
                            _harga = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),


                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xFF003320),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                              child: TextButton(
                            child: Text(
                              "Create Perk",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size.fromHeight(40)),
                            ),
                            onPressed: () async {
                              // int price = int.parse(_harga);
                              print(_nama);
                              print(_deskripsi);
                              print(_harga);
                              final response = await request.post(
                                "https://scrappy.up.railway.app/tukarpoin/tambah/",
                                {
                                  'nama': _nama,
                                  'deskripsi': _deskripsi,
                                  'harga': _harga,
                                  // 'submit': 'Submit'
                                },
                              );

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Redeem()));

                              // Code here will run if the login failed (wrong username/password).
                            },
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
