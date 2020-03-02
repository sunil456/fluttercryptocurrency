import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'my_app.dart';

void main() async
{
  List currencies = await getCurrencies();
  print(currencies);

  runApp(new MyApp(currencies));
}

Future<List> getCurrencies() async
{
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(cryptoUrl);

  return json.decode(response.body);
}