import 'package:flutter/cupertino.dart';

class CuDatePicker extends StatelessWidget {
  const CuDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime oneMonthLater = now.add(const Duration(days: 30));
    return CupertinoDatePicker(
      initialDateTime: now,
      minimumDate: now, // 오늘부터
      maximumDate: oneMonthLater, // 한 달 까지 설정 가능
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (DateTime value) {},
    );
  }
}
