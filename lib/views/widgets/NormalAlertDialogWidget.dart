import 'package:flutter/cupertino.dart';

class NormalAlertDialogWidget {
  final String title;
  final String message;
  final VoidCallback onClose;

  NormalAlertDialogWidget({
    required this.title,
    required this.message,
    required this.onClose,
  });

  void show(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('확인'),
              onPressed: () {
                onClose();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
