import '/page_animation.dart';
import '/screens/writing_pages/writing_pages2.dart';
import 'package:flutter/material.dart';
import 'writing_pages_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

String writingPagesTitle = "";

final writingPagesTitleProvider =
    StateNotifierProvider<TitleNotifier, String>((ref) {
  return TitleNotifier();
});

class TitleNotifier extends StateNotifier<String> {
  TitleNotifier() : super('');

  void setText(String text) {
    state = text;
  }
}

class WritingPages1 extends ConsumerWidget {
  WritingPages1({super.key});
  static String routeName = "/write";

  bool _isButtonEnabled = false;
  Color _titleOver40TextColor = Colors.white;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double isKeyboardDetected() {
      if (MediaQuery.of(context).viewInsets.bottom != 0) {
        return 22;
      } else {
        return 0;
      }
    }

    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: <Widget>[
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
                  WhiteBox(
                    boxWidth: 0,
                    boxHeight: 2,
                  ), // 앱바 <-> 모임을소개해주세요 공백

                  SizedBox(
                    height: getHeightByPercentOfScreen(
                        70 - isKeyboardDetected(), context),
                    child: Form(
                      child: Expanded(
                        child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Row(
                                  // 모임을 소개해주세요
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    WhiteBox(boxWidth: 5, boxHeight: 0),
                                    const Text(
                                      '모임을 소개해주세요.',
                                      style: TextStyle(
                                        color: Color(0xFF292524),
                                        fontSize: 24,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                WhiteBox(
                                    boxWidth: 0,
                                    boxHeight: 3), // 모임을 소개해주세요 <-> 사진 공백
                                Row(
                                    // 사진
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      WhiteBox(boxWidth: 5, boxHeight: 0),
                                      const Text(
                                        '사진',
                                        style: TextStyle(
                                          color: Color(0xFF808080),
                                          fontSize: 18,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ]),
                                WhiteBox(
                                    boxWidth: 0,
                                    boxHeight: 1), // 사진 <-> 사진첨부 공백
                                Row(
                                  // 사진 첨부
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    WhiteBox(boxWidth: 5, boxHeight: 0),
                                    SizedBox(
                                      width: getHeightByPercentOfScreen(
                                          10, context),
                                      height: getHeightByPercentOfScreen(
                                          10, context),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              width: getHeightByPercentOfScreen(
                                                  10, context),
                                              height:
                                                  getHeightByPercentOfScreen(
                                                      10, context),
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFFF7F7F7),
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 0.50,
                                                      color: Color(0xFFD3D3D3)),
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 21,
                                            top: 13,
                                            child: SizedBox(
                                              width: 43,
                                              height: 38,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Container(
                                                      width: 38,
                                                      height: 38,
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 4.75,
                                                        left: 3.56,
                                                        right: 3.56,
                                                        bottom: 5.94,
                                                      ),
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: const Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [],
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      left: 25,
                                                      top: 19,
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            const ShapeDecoration(
                                                          color:
                                                              Color(0xFF61C3FF),
                                                          shape: OvalBorder(
                                                            side: BorderSide(
                                                                width: 0.50,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        child: const Icon(
                                                            Icons.add),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Positioned(
                                            left: 25,
                                            top: 56,
                                            child: Text(
                                              '0 / 10',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                WhiteBox(
                                    boxWidth: 0,
                                    boxHeight: 4.5), // 사진첨부 <-> 제목 공백
                                Row(
                                    // 제목
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      WhiteBox(boxWidth: 5, boxHeight: 0),
                                      const Text(
                                        '제목',
                                        style: TextStyle(
                                          color: Color(0xFF808080),
                                          fontSize: 18,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ]),
                                WhiteBox(
                                    boxWidth: 0,
                                    boxHeight: 1), // 제목 <-> 제목을 입력해주세요 공백
                                Row(
                                  // 제목을 입력해주세요.
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: getWidthByPercentOfScreen(
                                          90, context),
                                      height: getHeightByPercentOfScreen(
                                          6.5, context),
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 0.50,
                                              color: Color(0xFFD3D3D3)),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: TextField(
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: '제목을 입력해주세요.',
                                                  hintStyle: TextStyle(
                                                    color: Color(0xFFBEBEBE),
                                                    fontSize: 16,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                                onChanged: (text) {
                                                  ref
                                                      .read(
                                                          writingPagesTitleProvider
                                                              .notifier)
                                                      .setText(text);
                                                  _checkTitleCondition(text);
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                WhiteBox(
                                    boxWidth: 0,
                                    boxHeight: 1.5), // 제목을 입력해주세요 <-> 40자이하 공백
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    WhiteBox(boxWidth: 5, boxHeight: 0),
                                    Text(
                                      '40자 이하로 입력해주세요.',
                                      style: TextStyle(
                                        color: _titleOver40TextColor,
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                WhiteBox(
                                    boxWidth: 0,
                                    boxHeight: 1.5), // 40자이하 <-> 내용 공백
                                Row(
                                    // 내용
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      WhiteBox(boxWidth: 5, boxHeight: 1),
                                      const Text(
                                        '내용',
                                        style: TextStyle(
                                          color: Color(0xFF808080),
                                          fontSize: 18,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ]),
                                WhiteBox(
                                    boxWidth: 0,
                                    boxHeight: 1.5), // 내용 <-> 소개글을 입력해주세요 공백
                                Row(
                                  // 소개글을 입력해주세요.(선택)
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    WhiteBox(boxWidth: 5, boxHeight: 0),
                                    Container(
                                      width: getWidthByPercentOfScreen(
                                          90, context),
                                      height: getHeightByPercentOfScreen(
                                          20, context),
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 0.50,
                                              color: Color(0xFFD3D3D3)),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: TextField(
                                              maxLines: null,
                                              decoration: InputDecoration(
                                                  hintText: '소개글을 입력해주세요.(선택)',
                                                  hintStyle: TextStyle(
                                                    color: Color(0xFFBEBEBE),
                                                    fontSize: 16,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                            )),
                      ),
                    ),
                  ),

                  const Spacer(),
                  WritingPagesNextbutton(
                    pressNextButton: _isButtonEnabled
                        ? () {
                            PageRouteWithAnimation pageRouteWithAnimation =
                                PageRouteWithAnimation(WritingPages2());
                            Navigator.push(context,
                                pageRouteWithAnimation.slideRitghtToLeft());
                          }
                        : null,
                  ),
                  WhiteBox(boxWidth: 0, boxHeight: 3)
                ],
              ),
            )));
  }

  void _checkTitleCondition(String s) {
    _isButtonEnabled = s.isNotEmpty && (s.length <= 40);
    if (s.length > 40) {
      _titleOver40TextColor = const Color(0xFFFF6060);
    } else {
      _titleOver40TextColor = Colors.white;
    }
    ;
  }
}
