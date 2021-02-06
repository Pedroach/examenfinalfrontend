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
      Uri.encodeFull("https://webexamenfinalpacc.azurewebsites.net/api/Letra"),
      headers: {
        'Content-Type':'application/json',
        "Accept":"application/json",
        }
    );
    data=json.decode(response.body);

    print(data["num1"]);
    myController.text = data["num1"]; 
    return "Satisfactorio";
  }
   final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor"),
        ),
         body: ListView( 
           children:<Widget>[
           Container( 
             child:Image.network("https://scera.org/wp-content/uploads/2018/10/magicians-hat_with_gloved_hands_wand_purple_background_small-3.jpg"),
           padding: EdgeInsets.all(20.0),

       ),
       Container(
           padding: EdgeInsets.all(20.0),
           child: TextField(controller: myController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
           ),
          ),
       Center(
         child: new RaisedButton(
           child: Text ("Presione para convertir su numero en letra"),
           onPressed: getData)
         ),

         
          ]
         ),

    );
  }
}