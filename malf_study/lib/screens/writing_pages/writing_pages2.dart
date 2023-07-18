// import 'package:flutter/cupertino.dart';
import 'package:cardview_example/screen/writing_pages/writing_pages1.dart';
import 'package:flutter/material.dart';
import '../../widgets/handle_picker_button.dart';
import '../../widgets/date_picker.dart';
import '../../widgets/toggle_date_picker_button.dart';
import '../../uitl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter/services.dart';

class WritingPages2 extends StatelessWidget {
  const WritingPages2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KO'),
        Locale('en', 'US'),
      ],
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      // Navigator.popUntil(context, ModalRoute.withName("/"));
                      closeWritingPages(context);
                    },
                  )
                ],
              ),
            ),
            const Row(
              // 일정과 시간을 입력해주세요.
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    '일정과 시간을 입력해주세요.',
                    style: TextStyle(
                      color: Color(0xFF292524),
                      fontSize: 24,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
            Row(
              // 날짜 입력
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Container(
                    width: 376,
                    height: 74,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0xFFD3D3D3)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month_outlined, size: 35),
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '모임 날짜',
                                  style: TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '2023.07.01 (월)',
                                  style: TextStyle(
                                    color: Color(0xFF1A1A1A),
                                    fontSize: 18,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: ToggleDatePicker(
                showPicker: showPicker,
              ),
            ),
          ],
        )),
      ),
    );
  }

  Future<void> showPicker(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: getHeightByPercentOfScreen(33.0, context),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: HandlePickerButton(
                  onPressDone: () => Navigator.pop(context),
                  onPressCancel: () => Navigator.pop(context),
                ),
              ),
              const Expanded(
                flex: 13,
                child: CuDatePicker(),
              )
            ],
          ),
        );
      },
    );
  }
}
