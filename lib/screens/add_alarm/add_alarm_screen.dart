import 'package:flutter/material.dart';
import 'package:onboarding_clock_challenge/components/uniform/uniform_app_bar.dart';

class AddAlarmScreen extends StatefulWidget {
  @override
  _AddAlarmScreenState createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniformAppBar(
        title: 'Add New Alarm',
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
