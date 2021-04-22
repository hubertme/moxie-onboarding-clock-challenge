import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_clock_challenge/util/size_util.dart';

class DigitalClock extends StatefulWidget {
  final bool isLive;
  final Color color;
  final DateTime dateTime;

  DigitalClock({
    this.isLive = false,
    @required this.color,
    @required this.dateTime,
    Key key,
  }) : super(key: key);

  @override
  _DigitalClockState createState() => _DigitalClockState(this.dateTime);
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime;
  Timer _timer;

  _DigitalClockState(
    this._dateTime,
  );

  @override
  void initState() {
    super.initState();
    if (this._dateTime == null) {
      this._dateTime = DateTime.now();
    }

    _timer = widget.isLive
        ? Timer.periodic(Duration(seconds: 1), (Timer timer) {
            _dateTime = _dateTime?.add(Duration(seconds: 1));
            if (mounted) {
              setState(() {});
            }
          })
        : null;
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final String hourToDisplay = '${this._dateTime.hour}'.padLeft(2, '0');
    final String minuteToDisplay = '${this._dateTime.minute}'.padLeft(2, '0');
    final String secondToDisplay = '${this._dateTime.second}'.padLeft(2, '0');
    final String displayTime =
        '$hourToDisplay : $minuteToDisplay : $secondToDisplay';

    return Container(
        child: Center(
      child: Text(
        '$displayTime',
        style: GoogleFonts.fredokaOne(
          fontSize: SizeUtil.scaleFontSize(60),
          textStyle: TextStyle(
            color: widget.color,
          ),
          fontWeight: FontWeight.w600,
        ),
      ),
    ));
  }
}
