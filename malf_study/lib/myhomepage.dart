import 'package:cardview_example/screen/writing_pages/writing_pages1.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import './page_animation.dart';
// import './uitl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<String> places = [];
  final List<File> images = [];
  final myController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  // 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

  void refresh() {
    setState(() {});
  }

  // + 버튼을 누를 경우 다이얼로그를 띄워 글과 사진을 입력받음
  void _incrementCounter() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: const Column(
              children: <Widget>[
                Text("Dialog Title"),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Dialog Content"),
                TextField(
                  controller: myController,
                ),
                const Text("image"),
                showImage(),
                FloatingActionButton(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                    setState(() {});
                  },
                  child: Icon(Icons.file_open),
                )
              ],
            ),
            actions: [
              TextButton(
                child: const Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text('확인'),
                onPressed: () {
                  _counter++;
                  places.add(myController.text);
                  // images.add(File(_image!.path));
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
        places.removeLast();
      }
    });
  }

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: places.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 50,
                color: const Color.fromARGB(255, 255, 228, 147),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(places[index]),
                    (Image.file(File(_image!.path))),
                  ],
                ));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        PageRouteWithAnimation pageRouteWithAnimation =
            PageRouteWithAnimation(WritingPages1());
        Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
      }),
    );
  }
}
