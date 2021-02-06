import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main()=>runApp(MiApp());
class MiApp extends StatelessWidget {
  const MiApp
    ({Key key}) : super(key: key);

 
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App image ",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget 
{
  Inicio
  ({Key key}) : super(key: key);

  @override
  _InicioState createState() => 
  _InicioState();
}

class _InicioState extends State<Inicio> 
{
  var data;
  Future<String> getData () async
  {
    var response= await http.get(
      Uri.encodeFull("https://webexamenfinalpacc.azurewebsites.net/api/Letra?num1=5"),
      headers: {
        'Content-Type':'application/json',
        "Accept":"application/json",
        }
    );
    data=json.decode(response.body);

    print(data["BallMessage"]);
    myController.text = data["BallMessage"]; 
    return "Satisfactorio";
  }
   final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("La bola Mágica"),
        ),
         body: ListView( 
           children:<Widget>[
           Container( 
             child:Image.network("https://i.pinimg.com/736x/1e/3f/20/1e3f20a022ffb4c228fd134447ca67e9.jpg"),
           padding: EdgeInsets.all(20.0),

       ),
       Center(
         child: new RaisedButton(
           child: Text ("Presione para tener suerte"),
           onPressed: getData)
         ),

         Container(
           padding: EdgeInsets.all(20.0),
           child: TextField(controller: myController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
           ),
          ),
          ]
         ),

    );
  }
}