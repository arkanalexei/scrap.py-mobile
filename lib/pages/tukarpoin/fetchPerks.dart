import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scrappy/model/perks.dart';


Future<List<Perks>> fetchPerks() async {
  var url =
      Uri.parse('https://scrappy.up.railway.app/tukarpoin/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchlist
  List<Perks> listPerks = [];
  for (var d in data) {
    if (d != null) {
      listPerks.add(Perks.fromJson(d));
    }
  }

  return listPerks;
}