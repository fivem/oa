import "package:flutter/material.dart";
void main()=>runApp( MainPage());
class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title:"首页",
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage()
    );
  }
}
class HomePage extends StatefulWidget{
  HomePage({Key key}):super(key: key);
  @override
  _HomePageState createState()=> _HomePageState();
}
class _HomePageState extends State<HomePage>{
  int _tabIndex = 0;
  void _switchTap(int index){
    setState((){
      _tabIndex = index;
    });
    /*switch(_tabIndex){
      case 0: Navigator.push(new TodoPage()); break;
      case 1: Navigator.push(new DonePage()); break;
      case 2: Navigator.push(new DocumentPage()); break;
      case 3: Navigator.push(new MyPage()); break;
    }*/
    print(_tabIndex);
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: new Text('首页')
      ),
      body: new Center(),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: new Icon(
              Icons.access_time
            ),
          title: new Text("待办"),
        ),
        new BottomNavigationBarItem(icon: new Icon(Icons.alarm_off),title: new Text("已办")),
        new BottomNavigationBarItem(icon: new Icon(Icons.attach_file),title: new Text("公文")),
        new BottomNavigationBarItem(icon: new Icon(Icons.settings),title: new Text("我的")),
      ],
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        onTap: _switchTap,
      ),
    );
  }
}