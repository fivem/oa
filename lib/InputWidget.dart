import 'package:flutter/material.dart';

void main() => runApp(UseInputWidget());

class UseInputWidget extends StatelessWidget {
  void _changeVal() {
    print("onPress");
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '练习组件',
      home: new Scaffold(
        appBar: AppBar(title: Text("忠旺集团OA办公")),
        body: Container(child: new InputWidget()),
        //floatingActionButton: FloatingActionButton(onPressed: _changeVal, tooltip: 'click', child: Icon(Icons.add)),
      ),
    );
  }
}

class InputWidget extends StatefulWidget {
  InputWidget();

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  String _username;
  String _password;
  TextEditingController _inputCtrl = new TextEditingController();

  void _changeUserName(newValue) {
    setState(() {
      this._username = newValue;
    });
  }

  void _changePassword(newValue) {
    setState() {
      this._password = newValue;
    }
  }

  void _submit() {
    print("submit");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Image.asset("assets/logo.jpg",
                  height: 200.0, width: 200.0),
              padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            ),
            new Container(
              child: new TextField(
                autocorrect: true,
                controller: _inputCtrl,
                cursorColor: Colors.blue,
                maxLength: 20,
                onChanged: _changeUserName,
                decoration: new InputDecoration(
                  icon: new Container(
                      padding: const EdgeInsets.fromLTRB(10.0, 18.0, 0.0, 0.0),
                      child: new Icon(
                        Icons.account_circle,
                        size: 40.0,
                      )),
                  //helperText: "请输入用户名",
                  hintText: '请输入用户名',
                  //errorText: "您输入的用户名有误",
                ),
              ),
              padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            ),
            new TextField(
              autocorrect: true,
              controller: _inputCtrl,
              cursorColor: Colors.blue,
              maxLength: 20,
              onChanged: _changeUserName,
              decoration: new InputDecoration(
                icon: new Container(
                    padding: const EdgeInsets.fromLTRB(10.0, 18.0, 0.0, 0.0),
                    child: new Icon(
                      Icons.lock_outline,
                      size: 40.0,
                    )),
                //helperText: "请输入用户名",
                hintText: '请输入密码',
                //errorText: "您输入的用户名有误",
              ),
            ),
            new Container(
              width: 350.0,
              padding:new EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child:new RaisedButton(
                onPressed: _submit,
                child: new Padding(
                    padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                    child: new Text("确认")),
                shape: new StadiumBorder(),
                color: Colors.blue,
              ),
            ),
          ],
        )
    );
  }
}
