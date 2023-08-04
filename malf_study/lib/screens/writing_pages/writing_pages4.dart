// import 'package:flutter/cupertino.dart';
// import '/screens/writing_pages/writing_pages1.dart';
import 'package:flutter/material.dart';
import 'package:malf_study/screens/writing_pages/writing_pages1.dart';
import 'writing_pages_util.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/page_animation.dart';

class WritingPages4 extends ConsumerWidget {
  const WritingPages4({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Test: ${ref.watch(writingPagesTitleProvider)}',
                    style: const TextStyle(
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Content: ${ref.watch(writingPagesContentProvider)}',
                    style: const TextStyle(
                      color: Color(0xFF292524),
                      fontSize: 24,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),

            const Spacer(),
            WritingPagesNextbutton(
              pressNextButton: false
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
