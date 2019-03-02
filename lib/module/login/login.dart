import 'package:flutter/material.dart';

import 'package:progress_hud/progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:boomenglish/utilite/ZNRequestManager.dart';
import 'package:boomenglish/utilite/ZNResultModel.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  ProgressHUD _progressHUD;
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    _progressHUD = ProgressHUD(
      backgroundColor: Colors.transparent,
      color: Colors.grey,
      containerColor: Colors.transparent,
    );
  }

  Future _requestData() async {
    ZNResultModel resultModel = await ZNRequestManager.get("/v1/home/v5/", {});
    var data = resultModel.data['data'];
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Color(0xffffffff)),
      home: new Scaffold(
        appBar: new AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              IconData(0xe5e0,
                  fontFamily: 'MaterialIcons', matchTextDirection: true),
              color: Color(0xff222626),
            ),
          ),
          title: Text('登录'),
        ),
        backgroundColor: Color(0xFFFCD433),
        body: Column(
          children: <Widget>[
            _accountBuilder(),
            _passwordBuilder(),
            _loginButtonBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _accountBuilder() {
    double _width = MediaQuery.of(context).size.width;
    double _height = 50;
    return Container(
      margin: EdgeInsets.fromLTRB(15, 30, 15, 0),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: _width,
      height: _height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: <Widget>[
          Icon(
            IconData(59473, fontFamily: 'MaterialIcons'),
            color: Color(0xFFFCD433),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                hintText: "请输入账号",
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              maxLines: 1,
              keyboardType: TextInputType.phone,
            ),
          )
        ],
      ),
    );
  }

  Widget _passwordBuilder() {
    double _width = MediaQuery.of(context).size.width;
    double _height = 50;
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: _width,
      height: _height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: <Widget>[
          Icon(
            IconData(59545, fontFamily: 'MaterialIcons'),
            color: Color(0xFFFCD433),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                hintText: "请输入密码",
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              maxLines: 1,
              keyboardType: TextInputType.text,
            ),
          )
        ],
      ),
    );
  }

  Align _loginButtonBuilder() {
    double _width = MediaQuery.of(context).size.width;
    double _height = 50;
    return Align(
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 30, 15, 0),
        height: _height,
        width: _width,
        child: FlatButton(
          child: Text(
            "登  录",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          onPressed: () {},
          textTheme: ButtonTextTheme.normal,
          textColor: Colors.yellow,
          disabledTextColor: Colors.red,
          color: Color(0xFF7CD58A),
          disabledColor: Colors.grey,
          // highlightColor: Colors.grey,
          splashColor: Colors.transparent,
          colorBrightness: Brightness.light,
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          clipBehavior: Clip.antiAlias,
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}
