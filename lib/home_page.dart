import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  List cryptoList;
  HomePage(this.cryptoList);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List cryptoList;
//  final List<MaterialColor> _colors = [Colors.teal, Colors.black, Colors.blue, Colors.orange];


//  @override
//  void initState(){
//    super.initState();
//
//    cryptoList =  getCurrencies() as List;
//  }

//  Future<List> getCurrencies() async
//  {
//    String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
//    http.Response response = await http.get(cryptoUrl);
//
//    return json.decode(response.body);
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Crypto Currency"),
      ),

      body: cryptoWidget(),
    );
  }


  Widget cryptoWidget()
  {
    return new Container(

      child: Column(
        children: <Widget>[
          new Flexible(

            child: new ListView.builder(

              itemCount: widget.cryptoList.length,

              itemBuilder: (BuildContext context, int index){

                final Map currency = widget.cryptoList[index];
//                final MaterialColor colour = _colors[index % _colors.length];

//                return _getListItemUI(currency, colour);
                return _getListItemUI(currency);

              },
            ),

          ),
        ],
      ),

    );
  }

//  ListTile _getListItemUI(Map currency, MaterialColor materialColors)
  ListTile _getListItemUI(Map currency)
  {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: Colors.blue,
        child: new Text(currency['name'][0]),
      ),

      title: new Text(
        currency['name'],
        style: new TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubTitleText(currency['price_usd'], currency['percent_change_1h']),

      isThreeLine: true,
    );
  }

  Widget _getSubTitleText(String priceUSD, String percentageChanged)
  {
    TextSpan priceTextWidget = new TextSpan(
      text: "\$$priceUSD\n",
      style: new TextStyle(
        color: Colors.black
      ),
    );
    String percentageChangedText = "1 hour: $percentageChanged%";

    TextSpan percentageChangedTextWidget;
    
    if (double.parse(percentageChanged)>0)
    {

      percentageChangedTextWidget = new TextSpan(
       text: percentageChangedText,

       style: new TextStyle(
         color: Colors.green
       )

      );

    }
    else
      {

        percentageChangedTextWidget = new TextSpan(
            text: percentageChangedText,

            style: new TextStyle(
                color: Colors.red
            )

        );

      }

    return new RichText(
      text: new TextSpan(
        children: [priceTextWidget, percentageChangedTextWidget]
      ),
    );
  }
}


