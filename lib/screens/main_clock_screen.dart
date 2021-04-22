import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:onboarding_clock_challenge/components/digital_clock.dart';
import 'package:onboarding_clock_challenge/components/uniform/uniform_app_bar.dart';
import 'package:onboarding_clock_challenge/components/uniform/uniform_text.dart';
import 'package:onboarding_clock_challenge/constants/app_colors.dart';
import 'package:onboarding_clock_challenge/util/size_util.dart';

class MainClockScreen extends StatefulWidget {
  @override
  _MainClockScreenState createState() => _MainClockScreenState();
}

class _MainClockScreenState extends State<MainClockScreen> {
  bool isDigital = false;

  Widget _buildAnalogClock() {
    return FlutterAnalogClock(
      dateTime: DateTime.now(),
      isLive: true,
      width: SizeUtil.scaleWidth(200),
      height: SizeUtil.scaleHeight(200),
      hourNumbers: ['', '', 'III', '', '', 'VI', '', '', 'IX', '', '', 'XII'],
    );
  }

  Widget _buildDigitalClock() {
    return DigitalClock(
      color: AppColors.DARK_GREY,
      dateTime: DateTime.now(),
      isLive: true,
    );
  }

  Widget _buildChangeTriggerButton() {
    return RaisedButton(
      child: UniformText(
        text: 'Switch to ${this.isDigital ? 'Analog' : 'Digital'}',
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      onPressed: () {
        setState(() {
          this.isDigital = !this.isDigital;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniformAppBar(
        title: 'Main Clock Screen',
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UniformText(
              text: '${this.isDigital ? 'Digital' : 'Analog'} Clock',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: SizeUtil.scaleHeight(32),
            ),
            this.isDigital ? _buildDigitalClock() : _buildAnalogClock(),
            SizedBox(
              height: SizeUtil.scaleHeight(32),
            ),
            this._buildChangeTriggerButton(),
          ],
        )
      ),
    );
  }
}
