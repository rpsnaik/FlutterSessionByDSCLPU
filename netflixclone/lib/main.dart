import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//shortto.com/justforfun
String apiUrl = "https://raw.githubusercontent.com/rpsnaik/FlutterSessionByDSCLPU/master/netflixAPIData.json";

void main(){
  runApp(
    MaterialApp(
      title: "Netflix Clone",
      home: SplashScreen(),
      theme: ThemeData.dark(),
    )
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var apiData;
  void loadData()async{
    var res = await http.get(apiUrl);
    var data = json.decode(res.body);
    setState(() {
      apiData = data;
    });
  }
  @override
  void initState() {
    loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(apiData == null){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("Netflix Clone"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Popular on Netflix", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                ),),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: apiData['showsDetails'].length,
                    itemBuilder: (context, i){
                      return InkWell(
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPage(index: i, showModel: ,));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPage(index: i, showModel: ShowModel(showtitle: apiData['showsDetails'][i]["showTitle"], showDes: apiData['showsDetails'][i]["showDetails"], showThumbnail: apiData['showsDetails'][i]["showThumbnail"], showCreators: apiData['showsDetails'][i]["creators"]),)));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          height: 200.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(apiData['showsDetails'][i]["showThumbnail"]),
                              fit: BoxFit.cover,
                            )
                          ),
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(apiData['showsDetails'][i]["showTitle"], style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                                ),),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(apiData['showsDetails'][i]['showDetails'])
                              ],
                            ),
                          )
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}


class ShowModel{
  String showtitle;
  String showDes;
  String showThumbnail;
  String showCreators;

  ShowModel({this.showtitle, this.showThumbnail, this.showCreators, this.showDes});
}

class NewPage extends StatefulWidget {
  final int index;
  final ShowModel showModel;
  NewPage({this.index, this.showModel});
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.showModel.showtitle.toString())
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.showModel.showThumbnail),
                  fit: BoxFit.cover
                )
              ),
              
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.showModel.showtitle, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(widget.showModel.showDes),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Creators : "+widget.showModel.showCreators),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    color: Colors.black,
                    onPressed: (){
                      
                    },
                    child: Text("Watch Now", style: TextStyle(
                      fontSize: 15.0
                    ),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
