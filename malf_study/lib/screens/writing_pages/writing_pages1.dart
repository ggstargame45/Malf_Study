// import 'package:cardview_example/myhomepage.dart';
import '/page_animation.dart';
import '/screens/writing_pages/writing_pages2.dart';
// import 'package:cardview_example/screen/writing_pages/writing_pages_nextbutton.dart';
import 'package:flutter/material.dart';
import '../../uitl.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

class WritingPages1 extends StatefulWidget {
  const WritingPages1({super.key});
  @override
  State<WritingPages1> createState() => _WritingPages1();
}

class _WritingPages1 extends State<WritingPages1> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  bool _isButtonEnabled = false;
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
                  const WritingPagesAppbar(),
                  const Row(
                    // 모임을 소개해주세요
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          '모임을 소개해주세요.',
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
                  const Row(
                      // 사진
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 10.0),
                            child: Text(
                              '사진',
                              style: TextStyle(
                                color: Color(0xFF808080),
                                fontSize: 18,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                              ),
                            ))
                      ]),
                  Row(
                    // 사진 첨부
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFF7F7F7),
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 0.50,
                                            color: Color(0xFFD3D3D3)),
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
                          ))
                    ],
                  ),
                  const Row(
                      // 제목
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 10.0),
                            child: Text(
                              '제목',
                              style: TextStyle(
                                color: Color(0xFF808080),
                                fontSize: 18,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                              ),
                            ))
                      ]),
                  Row(
                    // 제목을 입력해주세요.
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Container(
                          width: 376,
                          height: 56,
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
                                    hintText: '제목을 입력해 주세요.',
                                    hintStyle: TextStyle(
                                      color: Color(0xFFBEBEBE),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  controller: titleController,
                                  onChanged: _isTitleNotNull,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Row(
                      // 내용
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 10.0),
                            child: Text(
                              '내용',
                              style: TextStyle(
                                color: Color(0xFF808080),
                                fontSize: 18,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                              ),
                            ))
                      ]),
                  Row(
                    // 소개글을 입력해주세요.(선택)
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Container(
                          width: 376,
                          height: 168,
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
                              Expanded(
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
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: WritingPagesNextbutton(
                        pressNextButton: _isButtonEnabled
                            ? () {
                                PageRouteWithAnimation pageRouteWithAnimation =
                                    PageRouteWithAnimation(WritingPages2());
                                Navigator.push(context,
                                    pageRouteWithAnimation.slideRitghtToLeft());
                              }
                            : null,
                      ))
                ],
              ),
            )));
  }

  void _isTitleNotNull(String s) {
    setState(() {
      _isButtonEnabled = s.isNotEmpty;
    });
  }
}
