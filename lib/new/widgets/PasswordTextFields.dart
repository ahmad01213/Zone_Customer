import 'package:flutter/material.dart';

import 'helpers.dart';

class PasswordTextFields extends StatefulWidget {
  final lable;
  final keyboard;
  final icon;
  Function onChange;
  final bool isHidden;
  PasswordTextFields({this.lable,this.keyboard,this.onChange,this.isHidden=false,this.icon});
  @override
  _PasswordTextFieldsState createState() => _PasswordTextFieldsState();
}
class _PasswordTextFieldsState extends State<PasswordTextFields> {
  bool _passwordVisible=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 35),

      child: TextFormField(
        keyboardType: widget.keyboard,
          onChanged: widget.onChange,
          validator: (v){
            if(v.toString().isEmpty){
              return "";
            }
            return null;
          },
        style: TextStyle(color: Colors.black),
        obscureText:_passwordVisible?false:true ,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
              borderSide: BorderSide(color: Colors.grey,width: 0.2)
          ),
          enabledBorder: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
              borderSide: BorderSide(color: Color(0xFF8A8D90),width: 0.2)
          ),
          focusedBorder: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),

              borderSide: BorderSide(color: mainColor,width: 0.8)
          ),
            errorBorder: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(5.0),
                ),

                borderSide: BorderSide(color: Colors.red,width: 0.8)
            ),
            focusedErrorBorder:  OutlineInputBorder(
                borderRadius:  BorderRadius.all(
                    Radius.circular(5.0)
                ),
                borderSide: BorderSide(color: Colors.red, width: 0.8)),
            hintStyle: new TextStyle(color: Color(0xFF8A8D90),fontSize: 14),
          errorStyle: TextStyle(fontSize: 1),
          hintText:widget.lable,
          prefixIcon:widget.icon!=null? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(widget.icon,size: 16,),
          ):null,
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                size: 20,
                color: _passwordVisible?mainColor:Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            )
        ),
            ),
      );
  }
}
