import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlert(BuildContext context, {@required String title, @required String body, bool isDoubleButton = false, Function callback}) {
  Widget titleWidget = Text('$title');
  Widget bodyWidget = Text('$body');

  List<Widget> doubleButtonsWidgetAndroid(BuildContext context, callback) {
    return [
      FlatButton(
        child: Text(
          'Cancel',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      FlatButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
          if (callback != null) {
            callback();
          }
        },
      ),
    ];
  }
  List<Widget> singleButtonWidgetAndroid(BuildContext context, callback) {
    return [
      FlatButton(
        child: Text(
          'OK',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          if (callback != null) {
            callback();
          }
        },
      ),
    ];
  }
  AlertDialog buildAndroidAlert() {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      title: titleWidget,
      content: bodyWidget,
      actions: isDoubleButton ? doubleButtonsWidgetAndroid(context, callback) : singleButtonWidgetAndroid(context, callback),
    );
  }

  List<Widget> doubleButtonsWidgetIOS(context, callback) {
    return [
      CupertinoDialogAction(
        child: Text(
          'Cancel',
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      CupertinoDialogAction(
        isDefaultAction: true,
        child: Text(
          'OK',
        ),
        onPressed: () {
          Navigator.of(context).pop();
          if (callback != null) {
            callback();
          }
        },
      ),
    ];
  }
  List<Widget> singleButtonsWidgetIOS(context, callback) {
    return [
      CupertinoDialogAction(
        isDefaultAction: true,
        child: Text(
          'OK',
        ),
        onPressed: () {
          Navigator.of(context).pop();
          if (callback != null) {
            callback();
          }
        },
      ),
    ];
  }
  CupertinoAlertDialog buildIOSAlert() {
    return CupertinoAlertDialog(
      title: titleWidget,
      content: bodyWidget,
      actions: isDoubleButton ? doubleButtonsWidgetIOS(context, callback) : singleButtonsWidgetIOS(context, callback),
    );
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Platform.isIOS ? buildIOSAlert() : buildAndroidAlert(),
      );
    },
    barrierDismissible: false,
  );
}