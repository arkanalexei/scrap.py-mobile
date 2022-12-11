// ignore_for_file: file_names
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scrappy/model/achiever.dart';


Future<List<Achiever>> fetchLeaderboard() async {
  var url =
      Uri.parse('https://scrappy.up.railway.app/leaderboard/json/');
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
  List<Achiever> listAchiever = [];
  for (var d in data) {
    if (d != null) {
      listAchiever.add(Achiever.fromJson(d));
    }
  }

  return listAchiever;
}