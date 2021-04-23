import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_clock_challenge/components/uniform/uniform_app_bar.dart';
import 'package:onboarding_clock_challenge/components/uniform/uniform_text.dart';
import 'package:onboarding_clock_challenge/constants/app_colors.dart';
import 'package:onboarding_clock_challenge/models/alarm.dart';
import 'package:onboarding_clock_challenge/providers/alarm_provider.dart';
import 'package:onboarding_clock_challenge/screens/add_alarm/add_alarm_screen.dart';
import 'package:onboarding_clock_challenge/screens/all_alarm/all_alarm_viewmodel.dart';
import 'package:onboarding_clock_challenge/util/formatter_util.dart';
import 'package:onboarding_clock_challenge/util/size_util.dart';
import 'package:provider/provider.dart';

class AllAlarmScreen extends StatefulWidget {
  @override
  _AllAlarmScreenState createState() => _AllAlarmScreenState();
}

class _AllAlarmScreenState extends State<AllAlarmScreen> {
  // List<Alarm> _allAlarms;
  AllAlarmViewModel _viewModel = AllAlarmViewModel();

  @override
  void initState() {
    super.initState();

    // this.listenToViewModel();
    _viewModel.fetchAllAlarms(context);
  }

  void listenToViewModel() {
    // _viewModel.getAllAlarmsObservable.listen((alarms) {
    //   setState(() {
    //     this._allAlarms = alarms;
    //   });
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  Widget _buildSingleAlarm(Alarm alarm) {
    return Container(
      // color: AppColors.DARK_GREY,
      width: double.infinity,
      // height: SizeUtil.scaleHeight(100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeUtil.scaleHeight(32),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: SizeUtil.scaleWidth(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UniformText(
                  text: FormatterUtil.hourMinuteString(hour: alarm.hour, minute: alarm.minute),
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: alarm.isActive ? AppColors.BLACK : AppColors.LIGHT_GREY,
                ),
                Switch(
                  activeColor: AppColors.PURPLE,
                  value: alarm.isActive,
                  onChanged: (val) {

                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeUtil.scaleHeight(16),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: SizeUtil.scaleWidth(16)),
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

  Widget _buildAllAlarmList(List<Alarm> allAlarms) {
    List<Widget> children = [];

    for (int i=0; i<allAlarms.length; i++) {
      final Alarm alarm = allAlarms[i];
      children.add(_buildSingleAlarm(alarm));
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
    final allAlarms = Provider.of<AlarmProvider>(context).alarms ?? [];

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
              // SizedBox(
              //   height: SizeUtil.scaleHeight(24),
              // ),
              // UniformText(
              //   text: 'All Alarm Screen',
              //   fontSize: 20,
              //   fontWeight: FontWeight.w700,
              // ),
              this._buildAllAlarmList(allAlarms),
            ],
          ),
        ),
      ),
    );
  }
}
