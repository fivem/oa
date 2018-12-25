import 'package:flutter/material.dart';
import 'req.dart';

void main()=>runApp(Document());
class Document extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:"公文",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: DocumentList(title:"公文列表")
    );
  }


}

class DocumentList extends StatefulWidget{
  final String title;
  DocumentList({Key key, this.title}):super(key:key);
  @override
  _DocumentListState createState() => _DocumentListState();
}

class _DocumentListState extends State<DocumentList>{
  final list = [];
  var lastCount = 0;
  _getList(i){
    req r = new req();
    Future t =  r.get('https://gank.io/api/data/Android/5/2');
    t.then((val){
      setState(() {
        list.add(val);
      });
    });
  }

  _assembleCard(l,i){
    var result = l[i];
    return new Card(
      child: Column(
        children: <Widget>[
          new Text(result['title']),
          new Text(result['content']),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(itemBuilder: (context,index){
      lastCount = index;
      if(index > list.length){
        list.addAll(_getList(list.length + 10));
      }
      return _assembleCard(list,index);
    });
  }
}