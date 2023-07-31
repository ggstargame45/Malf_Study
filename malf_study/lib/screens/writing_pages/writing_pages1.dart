import '/page_animation.dart';
import '/screens/writing_pages/writing_pages2.dart';
import 'package:flutter/material.dart';
import 'writing_pages_util.dart';

class WritingPages1 extends StatefulWidget {
  const WritingPages1({super.key});

  static String routeName = "/write";

  @override
  State<WritingPages1> createState() => _WritingPages1();
}

class _WritingPages1 extends State<WritingPages1> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  bool _isButtonEnabled = false;
  Color _titleOver40TextColor = Colors.white;
  @override
  Widget build(BuildContext context) {
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
                  WhiteBox(boxWidth: 100, boxHeight: 5), // 맨 위 상단 공백

                  Row(
                    // 글쓰기 화면 상단의 앱바
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_outlined),
                        onPressed: () {
                          closeWritingPages(context);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          closeWritingPages(context);
                        },
                      )
                    ],
                  ),
                  WhiteBox(boxHeight: 2, boxWidth: 2), // 앱바 <-> 모임을소개해주세요 공백
                  Row(
                    // 모임을 소개해주세요
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      WhiteBox(boxWidth: 5, boxHeight: 1),
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
                  WhiteBox(boxWidth: 3, boxHeight: 3), // 모임을 소개해주세요 <-> 사진 공백
                  Row(
                      // 사진
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        WhiteBox(boxWidth: 5, boxHeight: 1),
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
                  WhiteBox(boxHeight: 1, boxWidth: 1), // 사진 <-> 사진첨부 공백
                  Row(
                    // 사진 첨부
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      WhiteBox(
                        boxWidth: 5,
                        boxHeight: 5,
                      ),
                      SizedBox(
                        width: getHeightByPercentOfScreen(10, context),
                        height: getHeightByPercentOfScreen(10, context),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: getHeightByPercentOfScreen(10, context),
                                height: getHeightByPercentOfScreen(10, context),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF7F7F7),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.50, color: Color(0xFFD3D3D3)),
                                    borderRadius: BorderRadius.circular(14),
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
                                        padding: const EdgeInsets.only(
                                          top: 4.75,
                                          left: 3.56,
                                          right: 3.56,
                                          bottom: 5.94,
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFF61C3FF),
                                            shape: OvalBorder(
                                              side: BorderSide(
                                                  width: 0.50,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          child: const Icon(Icons.add),
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
                  WhiteBox(boxWidth: 3, boxHeight: 3), // 사진첨부 <-> 제목 공백
                  Row(
                      // 제목
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        WhiteBox(boxWidth: 5, boxHeight: 1),
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
                  WhiteBox(boxWidth: 1, boxHeight: 1), // 제목 <-> 제목을 입력해주세요 공백
                  Row(
                    // 제목을 입력해주세요.
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: getWidthByPercentOfScreen(90, context),
                        height: getHeightByPercentOfScreen(6.5, context),
                        padding: const EdgeInsets.only(left: 16),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFFD3D3D3)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: '제목을 입력해주세요.',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFBEBEBE),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: InputBorder.none,
                                ),
                                controller: titleController,
                                onChanged: _checkTitleCondition,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  WhiteBox(
                      boxWidth: 1, boxHeight: 1), // 제목을 입력해주세요 <-> 40자이하 공백
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      WhiteBox(boxWidth: 5, boxHeight: 1.5),
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
                  WhiteBox(boxWidth: 1, boxHeight: 1.5), // 40자이하 <-> 내용 공백
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
                  WhiteBox(boxWidth: 1, boxHeight: 1), // 내용 <-> 소개글을 입력해주세요 공백
                  Row(
                    // 소개글을 입력해주세요.(선택)
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      WhiteBox(boxWidth: 5, boxHeight: 1),
                      Container(
                        width: getWidthByPercentOfScreen(90, context),
                        height: getHeightByPercentOfScreen(20, context),
                        padding: const EdgeInsets.only(left: 16),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFFD3D3D3)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: TextField(
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
                  WhiteBox(boxWidth: 1, boxHeight: 3)
                ],
              ),
            )));
  }

  void _checkTitleCondition(String s) {
    setState(() {
      _isButtonEnabled = s.isNotEmpty && (s.length <= 40);
      if (s.length > 40) {
        _titleOver40TextColor = const Color(0xFFFF6060);
      } else {
        _titleOver40TextColor = Colors.white;
      }
    });
  }
}
