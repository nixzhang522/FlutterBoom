import 'package:flutter/material.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:boomenglish/utilite/ZNRequestManager.dart';
import 'package:boomenglish/utilite/ZNResultModel.dart';
import 'package:boomenglish/model/user.dart';

import 'package:boomenglish/help/user_manager.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isInAsyncCall = false;

  @override
  void initState() {
    super.initState();
  }

  void _login() async {
    setState(() {
      _isInAsyncCall = true;
    });
    if (_phoneController.text.length != 11) {
      Fluttertoast.showToast(msg: "请输入正确手机号码！");
      return;
    }
    if (_passwordController.text.length == 0) {
      Fluttertoast.showToast(msg: "请输入密码");
      return;
    }
    var param = {
      "phone": _phoneController.text,
      "password": _passwordController.text,
      "country_code": "86",
      "device": {"brand": "apple", "model": "iPhone 6s Plus"}
    };
    ZNResultModel resultModel =
        await ZNRequestManager.post("/v1/account/login/", param);
    setState(() {
      _isInAsyncCall = false;
    });
    if (resultModel.success) {
      var data = resultModel.data['data'];
      String token = resultModel.data["access_token"].toString();
      User user = User.fromJson(data["user"]);
      UserManager userManager = UserManager();
      userManager.token = token;
      userManager.user = user;
      Navigator.pop(context);
    }
    else {
      Fluttertoast.showToast(msg: "登录失败", gravity: ToastGravity.CENTER);
    }
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
        body: ModalProgressHUD(
          child: Column(
            children: <Widget>[
              _accountBuilder(),
              _passwordBuilder(),
              _loginButtonBuilder(),
            ],
          ),
          inAsyncCall: _isInAsyncCall,
          opacity: 0,
          progressIndicator: CircularProgressIndicator(),
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
              controller: _phoneController,
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
              controller: _passwordController,
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
          onPressed: () {
            _login();
          },
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
