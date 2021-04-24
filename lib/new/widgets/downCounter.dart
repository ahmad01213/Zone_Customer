import 'dart:async';

import 'package:flutter/material.dart';

class DownCounter extends StatefulWidget {
  @override
  _DownCounterState createState() => _DownCounterState();
}

class _DownCounterState extends State<DownCounter> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: new TextSpan(text: 'Enter OTP code sent to your number,\n code will expired in ', children: [
        new TextSpan(
            text: '$_start sec',
            style: TextStyle(color: Colors.black,fontSize: 18)
        )
      ],            style: TextStyle(color: Colors.grey,fontSize: 16)
      ),
      textAlign: TextAlign.center,
    );
  }

  Timer _timer;
  int _start = 45;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }
}
