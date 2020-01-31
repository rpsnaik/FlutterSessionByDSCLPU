import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflixclone/main.dart';

class HomeContentPage extends StatefulWidget {
  @override
  _HomeContentPageState createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage> {
  var data;
  void loadData()async{
    var res = await http.get(globalAPIUrl);
    data = json.decode(res.body);
    setState(() {
      
    });
  }
  @override
  void initState() {
    loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(data == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      child: ListView.builder(
        itemCount: data['showsDetails'].length,
        itemBuilder: (context, i){
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data['showsDetails'][i]['showThumbnail'].toString()),
            ),
            title: Text(data['showsDetails'][i]['showTitle'].toString()),
            subtitle: Text(data['showsDetails'][i]['showDetails'].toString()),
          );
        },
      )
    );
  }
}