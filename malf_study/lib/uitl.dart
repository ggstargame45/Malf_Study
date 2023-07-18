import 'screens/writing_pages/writing_pages1.dart';
import 'package:flutter/material.dart';

double getHeightByPercentOfScreen(double percent, BuildContext context) {
  return MediaQuery.of(context).size.height * percent / 100;
}

class WritingPagesAppbar extends StatelessWidget {
  // 글쓰기의 최상단 앱바
  const WritingPagesAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              if (context == WritingPages1()) {
                // 첫 번째 페이지의 경우 뒤로가기를 누르면 창이 띄워지게 하고 싶은데... 모르겠음
                closeWritingPages(context);
              } else {
                Navigator.pop(context);
              }
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
    );
  }
}

void closeWritingPages(BuildContext context) {
  // 닫기 버튼 누를 때 띄우는 창
  showDialog(
    context: context,
    barrierDismissible: false, //바깥 영역 터치시 닫을지 여부 결정
    builder: ((context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          '모임을 나중에 여시겠습니까?',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFF1A1A1A),
              fontSize: 21,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 2),
        ),
        content: const Text(
          '나중에 다시 한번 좋은\n모임을 열어주세요',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF808080),
            fontSize: 15,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    minimumSize:
                        MaterialStateProperty.all(const Size(120, 40))),
                onPressed: () {
                  Navigator.of(context).pop(); //창 닫기
                },
                child: const Text(
                  '취소',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF61C3FF)),
                    minimumSize:
                        MaterialStateProperty.all(const Size(120, 40))),
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName("/")); //초기 화면으로 이동
                },
                child: const Text(
                  '나가기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          )
        ],
      );
    }),
  );
}

class WritingPagesNextbutton extends StatelessWidget {
  // 글쓰기 화면의 '다음' 버튼
  const WritingPagesNextbutton({
    Key? key,
    required this.pressNextButton,
  }) : super(key: key);

  final VoidCallback? pressNextButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Color(0xFF61C3FF),
                  minimumSize: const Size(380, 56)),
              onPressed: pressNextButton,
              child: const Text(
                '다음',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ))
      ],
    );
  }
}
