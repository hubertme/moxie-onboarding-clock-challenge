import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_clock_challenge/components/uniform/uniform_app_bar.dart';
import 'package:onboarding_clock_challenge/components/uniform/uniform_text.dart';
import 'package:onboarding_clock_challenge/constants/app_colors.dart';
import 'package:onboarding_clock_challenge/screens/add_alarm/add_alarm_screen.dart';
import 'package:onboarding_clock_challenge/util/size_util.dart';

class AllAlarmScreen extends StatefulWidget {
  @override
  _AllAlarmScreenState createState() => _AllAlarmScreenState();
}

class _AllAlarmScreenState extends State<AllAlarmScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildSingleAlarm() {
    return Container(
      color: AppColors.DARK_GREY,
      width: double.infinity,
      height: SizeUtil.scaleHeight(200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeUtil.scaleHeight(190),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: SizeUtil.scaleWidth(8)),
            child: Container(
              color: AppColors.LIGHT_GREY,
              height: 1,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAllAlarmList() {
    List<Widget> children = [];

    for (int i=0; i<10; i++) {
      children.add(_buildSingleAlarm());
    }

    return Expanded(
      child: SingleChildScrollView(
        // physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniformAppBar(
        title: 'Alarm',
        actions: [
          InkWell(
            highlightColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Icon(
                Icons.add,
                color: AppColors.WHITE,
                size: 30,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                    builder: (context) => AddAlarmScreen(),
                    fullscreenDialog: true
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeUtil.scaleHeight(24),
              ),
              UniformText(
                text: 'All Alarm Screen',
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              this._buildAllAlarmList(),
            ],
          ),
        ),
      ),
    );
  }
}
