import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scrappy/model/news.dart';


Future<List<News>> fetchNews() async {
  var url =
      Uri.parse('https://scrappy.up.railway.app/news/json/');
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
  List<News> listNews = [];
  for (var d in data) {
    if (d != null) {
      listNews.add(News.fromJson(d));
    }
  }

  return listNews;
}