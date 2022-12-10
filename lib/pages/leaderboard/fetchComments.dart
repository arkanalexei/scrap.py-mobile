// TODO Implement this library.
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scrappy/model/comment.dart';


Future<List<Comment>> fetchComment() async {
  var url =
      Uri.parse('https://scrappy.up.railway.app/leaderboard/json/comments/');
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
  List<Comment> listComment = [];
  for (var d in data) {
    if (d != null) {
      listComment.add(Comment.fromJson(d));
    }
  }

  return listComment;
}