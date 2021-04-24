import 'package:flutter/material.dart';
import 'package:markets/new/widgets/Texts.dart';
import 'package:markets/new/widgets/helpers.dart';
import 'package:markets/src/pages/signup.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../helpers/helper.dart';
import '../repository/user_repository.dart' as userRepo;

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends StateMVC<LoginWidget> {
  UserController _con;

  _LoginWidgetState() : super(UserController()) {
    _con = controller;
  }
  @override
  void initState() {
    super.initState();
    if (userRepo.currentUser.value.apiToken != null) {
      Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper.of(context).onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("تسجيل الدخول"),elevation: 0,),
        key: _con.scaffoldKey,
        resizeToAvoidBottomInset: false,
        body:Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: EdgeInsets.only(top: 10, right: 27, left: 27, bottom: 20),
          width: config.App(context).appWidth(95),
//              height: config.App(context).appHeight(55),
          child: Form(
            key: _con.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 35,
                ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset(
                    "assets/imgs/logo.jpeg",fit: BoxFit.fill,
                  height: 100,

                  width: 100,
                ),
              ),
            ),

                SizedBox(
                  height: 55,
                ),
                // Image.asset(
                //   "assets/imgs/arkan.png",
                //   height: 15,
                // ),
                // SizedBox(
                //   height: 90,
                // ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (input) => _con.user.email = input,
                  validator: (input) => !input.contains('@') ? S.of(context).should_be_a_valid_email : null,
                  decoration: InputDecoration(
                    labelText: S.of(context).email,
                    labelStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                    hintText: 'johndoe@gmail.com',
                    hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5)),borderRadius: BorderRadius.circular(50)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2)),borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (input) => _con.user.password = input,
                  validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
                  obscureText: _con.hidePassword,
                  decoration: InputDecoration(
                    labelText: S.of(context).password,
                    labelStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                    hintText: '••••••••••••',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _con.hidePassword = !_con.hidePassword;
                        });
                      },
                      // color: Theme.of(context).focusColor,
                      icon: Icon(_con.hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5)),borderRadius: BorderRadius.circular(50)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2)),borderRadius: BorderRadius.circular(50)),),
                ),
                SizedBox(height: 20),

                InkWell(
                    onTap: () {
                      pushPage(context: context, page: SignUpWidget());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Texts(
                              title: "إنشاء حساب", fSize: 12, color: mainColor)),
                    )),
                SizedBox(height: 30),
                BlockButtonWidget(
                  text: Text(
                    S.of(context).login,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    _con.login();
                  },
                ),
                SizedBox(height: 15),
                // MaterialButton(
                //   elevation: 0,
                //   onPressed: () {
                //     Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
                //   },
                //   shape: StadiumBorder(),
                //   textColor: Theme.of(context).hintColor,
                //   child: Text(S.of(context).skip),
                //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                // ),
//                      SizedBox(height: 10),
              ],
            ),
          ),
        )
      ),
    );
  }
}
