import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../elements/MobileVerificationBottomSheetWidget.dart';
import '../helpers/app_config.dart' as config;
import '../helpers/helper.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}
class _SignUpWidgetState extends StateMVC<SignUpWidget> {
  UserController _con;

  _SignUpWidgetState() : super(UserController()) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper.of(context).onWillPop,
      child: Scaffold(
        key: _con.scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("إنشاء حساب جديد"),elevation: 0,),
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: [
            Container(

              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 18),
              width: config.App(context).appWidth(88),
//              height: config.App(context).appHeight(55),
              child: Form(
                key: _con.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
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
                    ),                    SizedBox(
                      height: 25,
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) => _con.user.name = input,
                      validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_letters : null,
                      decoration: InputDecoration(
                        labelText: S.of(context).full_name,
                        labelStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                        hintText: S.of(context).john_doe,
                        hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5)),borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2)),borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    SizedBox(height: 30),
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
                      keyboardType: TextInputType.phone,
                      onSaved: (input) => _con.user.phone = input,
                      validator: (input) {
                        print(input.startsWith('\+'));
                        return !input.startsWith('\+') && !input.startsWith('00') ? "Should be valid mobile number with country code" : null;
                      },
                      decoration: InputDecoration(
                        labelText: S.of(context).phoneNumber,
                        labelStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                        hintText: '+965 23546512',
                        hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5)),borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2)),borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      obscureText: _con.hidePassword,
                      onSaved: (input) => _con.user.password = input,
                      validator: (input) => input.length < 6 ? S.of(context).should_be_more_than_6_letters : null,
                      decoration: InputDecoration(
                        labelText: S.of(context).password,
                        labelStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                        hintText: '••••••••••••',
                        hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _con.hidePassword = !_con.hidePassword;
                            });
                          },
                          color: Theme.of(context).focusColor,
                          icon: Icon(_con.hidePassword ? Icons.visibility : Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5)),borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2)),borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    SizedBox(height: 30),
                    BlockButtonWidget(
                      text: Text(
                        S.of(context).register,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        if (_con.loginFormKey.currentState.validate()) {
                          _con.loginFormKey.currentState.save();
                          // var bottomSheetController = _con.scaffoldKey.currentState.showBottomSheet(
                          //   (context) => MobileVerificationBottomSheetWidget(scaffoldKey: _con.scaffoldKey, user: _con.user),
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          //   ),
                          // );
                          // bottomSheetController.closed.then((value) {
                          // });

                          _con.register();

                        }
                      },
                    ),
//                      MaterialButton(elevation:0,
//                        onPressed: () {
//                          Navigator.of(context).pushNamed('/MobileVerification');
//                        },
//                        padding: EdgeInsets.symmetric(vertical: 14),
//                        color: Theme.of(context).accentColor.withOpacity(0.1),
//                        shape: StadiumBorder(),
//                        child: Text(
//                          'Register with Google',
//                          textAlign: TextAlign.start,
//                          style: TextStyle(
//                            color: Theme.of(context).accentColor,
//                          ),
//                        ),
//                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            MaterialButton(
              elevation: 0,
              onPressed: () {
                Navigator.of(context).pushNamed('/Login');
              },
              textColor: Theme.of(context).hintColor,
              child: Text(S.of(context).i_have_account_back_to_login),
            ),
          ],
        ),
      ),
    );
  }
}
