import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleDatePicker extends StatelessWidget {
  const ToggleDatePicker({
    Key? key,
    required this.showPicker,
  }) : super(key: key);

  final Function(BuildContext context) showPicker;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const Text(
        'OPEN DATE PICKER',
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        showPicker(context);
      },
    );
  }
}
