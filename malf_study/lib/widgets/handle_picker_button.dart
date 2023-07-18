import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HandlePickerButton extends StatelessWidget {
  const HandlePickerButton({
    Key? key,
    required this.onPressCancel,
    required this.onPressDone,
  }) : super(key: key);

  final VoidCallback? onPressCancel;
  final VoidCallback? onPressDone;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoButton(
          onPressed: onPressCancel,
          child: const Text(
            '취소',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        CupertinoButton(
          onPressed: onPressDone,
          child: const Text(
            '완료',
          ),
        ),
      ],
    );
  }
}
