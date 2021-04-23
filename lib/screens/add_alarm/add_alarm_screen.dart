import 'package:flutter/material.dart';
import 'package:onboarding_clock_challenge/components/uniform/uniform_app_bar.dart';
import 'package:onboarding_clock_challenge/components/uniform/uniform_text.dart';
import 'package:onboarding_clock_challenge/constants/app_colors.dart';
import 'package:onboarding_clock_challenge/screens/add_alarm/add_alarm_viewmodel.dart';
import 'package:onboarding_clock_challenge/util/formatter_util.dart';
import 'package:onboarding_clock_challenge/util/size_util.dart';
import 'package:onboarding_clock_challenge/util/ui_helper.dart';

class AddAlarmScreen extends StatefulWidget {
  @override
  _AddAlarmScreenState createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  TimeOfDay _timePicked;
  AddAlarmViewModel _viewModel = AddAlarmViewModel();

  @override
  void initState() {
    super.initState();
    this.listenToViewModel();
  }

  void listenToViewModel() {
    _viewModel.addToDBProcessObservable.listen((isSuccess) {
      if (isSuccess) {
        Navigator.of(context).pop();
      } else {
        showAlert(
          context,
          title: 'An error occurred',
          body: 'Error happened when saving this alarm to DB, please try again',
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  void _handlePickTime() async {
    final TimeOfDay timePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );

    if (timePicked != null) {
      setState(() {
        this._timePicked = timePicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniformAppBar(
        title: 'Add New Alarm',
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: UniformText(
                text: this._timePicked != null ? FormatterUtil.timeOfDayToString(this._timePicked) : 'Select time',
                color: AppColors.PURPLE,
                fontSize: 30,
                fontWeight: this._timePicked != null ? FontWeight.w700 : FontWeight.normal,
              ),
              onTap: () {
                this._handlePickTime();
              },
            ),
            SizedBox(
              height: SizeUtil.scaleHeight(32),
            ),
            RaisedButton(
              child: UniformText(
                text: 'Save',
                fontSize: 15,
              ),
              onPressed: this._timePicked != null ? () {
                _viewModel.saveAlarmToDB(context, this._timePicked);
              } : null,
            ),
          ],
        ),
      ),
    );
  }
}
