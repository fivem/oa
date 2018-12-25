import "package:flutter/material.dart";
import "package:flutter_webview_plugin/flutter_webview_plugin.dart";

void main()=>runApp(Form());

class Form extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "审批",
       // theme: new ThemeData(primarySwatch: Colors.blue),
      home:Approval()
    );
  }
}

class Approval extends StatefulWidget{
  @override
  _ApprovalState createState() => _ApprovalState();
}

class _ApprovalState extends State<Approval>{
  _agree(){

  }
  _reject(){

  }
  @override
  Widget build(BuildContext context){
    return
      Scaffold(
        appBar: AppBar(title: new Text("审批")),
        body: Card(
          child:Column(
            children: <Widget>[
              WebviewScaffold(
                  url: "http://192.168.12.37"
              )
            ],
          )

        )
      );
  }
}