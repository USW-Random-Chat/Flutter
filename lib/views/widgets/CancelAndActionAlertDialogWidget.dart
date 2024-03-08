import 'package:flutter/cupertino.dart';

class CancelAndActionAlertDialogWidget {
  final String title;
  final String action;
  final VoidCallback onCancel;
  final VoidCallback onAction;

  CancelAndActionAlertDialogWidget({
    required this.title,
    required this.action,
    required this.onCancel,
    required this.onAction,
  });

  void show(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('취소'),
              onPressed: () {
                onCancel();
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text(action),
              onPressed: () {
                onAction();
              },
            ),
          ],
        );
      },
    );
  }
}
