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
    Future t =  r.get('https://gank.io/api/data/Android/27/2');
    t.then((val){
      setState(() {
        list.add((val.data)["results"]);
      });
    });
  }

  Future<dynamic> _Refresh(){
    req r = new req();
    Future t =  r.get('https://gank.io/api/data/Android/27/2');
    t.then((val){
      setState(() {
        list.add((val.data)["results"]);
      });
    });
    return t;
  }

  _assembleCard(l){
    var result = l;
    return new Card(
      child: Column(
        children: <Widget>[
        //  new Text(result['_id']),

          new Text(result['desc']),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RefreshIndicator(
      child:  ListView.builder(itemBuilder: (context,index){
        lastCount = index;
        return list.length==0 ? CircularProgressIndicator():_assembleCard(list[0][index]);

      }),
      onRefresh: _Refresh,
    );

  }
}