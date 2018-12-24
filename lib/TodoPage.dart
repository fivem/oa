import "package:flutter/material.dart";
import "req.dart";

void main() => runApp(TodoPage());

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '待办事项',
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var subject = List<dynamic>();
  var pageNo = 1;

  getItem(var sub) {
    print(sub);
    var row = new Container(child: new Text(sub['desc']));
    return new Card(child: row);
  }

  _loadData(pageNo) {
    req r = new req();
    var result =
        r.get("http://gank.io/api/data/Android/10/" + pageNo.toString());
    result.then((response) {
      setState(() {
        subject = response.data["results"];
      });
    });
  }

  @override
  void initState() {
    _loadData(pageNo);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: new Text('待办事项')),
        body: new Center(
            child: new RefreshIndicator(
                child: new ListView.builder(
                    itemCount: subject.length,
                    itemBuilder: (BuildContext context, int index) {
                      return getItem(subject[index]);
                    }
                    ),
              onRefresh: _loadData(1)
            )
        )
    );
  }
}
