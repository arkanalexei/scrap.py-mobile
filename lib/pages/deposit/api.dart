import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:scrappy/model/depositItem.dart';
import 'dart:convert';

Future<List<WasteDeposit>> fetchRecentDeposits(CookieRequest request) async {
  debugPrint("Making request...");
  var response = await request.get(
    'https://scrappy.up.railway.app/deposit/json/',
  );

  // melakukan decode response menjadi bentuk json
  debugPrint(response.body);
  debugPrint("Response received. Decoding to json...");
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  debugPrint(data.toString());
  debugPrint("JSON present. Converting...");

  // melakukan konversi data json menjadi object WasteDeposit
  List<WasteDeposit> listDeposits = [];
  int i = 0;
  for (var d in data) {
    if (d != null) {
      listDeposits.add(WasteDeposit.fromJson(d));
      i++;
    }
    if (i > 5) {
      return listDeposits;
    }
  }
  debugPrint(listDeposits.toString());
  debugPrint("Data conversion complete. Returning...");

  return listDeposits;
}

void submitDeposit(
  CookieRequest request,
  String description,
  double mass,
) async {
  debugPrint(mass.toString());
  var url = Uri.parse('https://scrappy.up.railway.app/deposit/submit/');
  final response = await request.post(
    'https://scrappy.up.railway.app/deposit/submit/',
    {
      'description': description,
      'mass': mass,
    },
    // headers: {
    //   "Access-Control-Allow-Origin": "*",
    //   "Content-Type": "application/json",
    // },
  );
  // melakukan decode response menjadi bentuk json
  // var data = jsonDecode(utf8.decode(response.bodyBytes));
  debugPrint("POST request sent.");
}
