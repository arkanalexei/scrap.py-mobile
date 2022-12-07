import 'package:http/http.dart' as http;
import 'package:scrappy/model/depositItem.dart';
import 'dart:convert';

Future<List<WasteDeposit>> fetchRecentDeposits() async {
  var url = Uri.parse('https://scrappy.up.railway.app/deposit/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

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

  return listDeposits;
}
