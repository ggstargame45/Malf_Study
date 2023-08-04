// import 'package:flutter/cupertino.dart';
// import '/screens/writing_pages/writing_pages1.dart';
import 'package:flutter/material.dart';
import 'package:malf_study/screens/writing_pages/writing_pages1.dart';
import 'writing_pages_util.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/page_animation.dart';
import 'writing_pages4.dart';

class WritingPages3 extends ConsumerWidget {
  const WritingPages3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WhiteBox(boxWidth: 0, boxHeight: 5), // 맨 위 상단 공백

            Row(
              // 글쓰기 화면 상단의 앱바
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                  iconSize: getWidthByPercentOfScreen(6, context),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  iconSize: getWidthByPercentOfScreen(8, context),
                  onPressed: () {
                    closeWritingPages(context);
                  },
                )
              ],
            ),

            WhiteBox(boxWidth: 0, boxHeight: 2), // 앱바 <-> 모임장소와 인원을 입력해주세요 공백

            const Row(
              // 모임장소와 인원을 입력해주세요.
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    '모임장소와 인원을 입력해주세요.',
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
                    child: Row(
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
                                  'Test: ${ref.watch(writingPagesTitleProvider)}',
                                  style: const TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Text(
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
            const Spacer(),
            WritingPagesNextbutton(
              pressNextButton: true
                  ? () {
                      PageRouteWithAnimation pageRouteWithAnimation =
                          PageRouteWithAnimation(WritingPages4());
                      Navigator.push(
                          context, pageRouteWithAnimation.slideRitghtToLeft());
                    }
                  : null,
            ),
            WhiteBox(boxWidth: 0, boxHeight: 3)
          ],
        )),
      ),
    );
  }
}
