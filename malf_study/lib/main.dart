import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListExample(),
    );
  }
}

class ListExample extends StatefulWidget {
  const ListExample({super.key});

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  late List<String> _list;
  late List<Image> _images;
  late List<Container> _containers;
  late int _listLength = 4;

  void _resetlist() {
    _listLength = 4;
    _list = List<String>.generate(_listLength, (index) => 'Item $index');
    _images = List<Image>.generate(_listLength,
        (index) => Image.asset('assets/images/${Random().nextInt(4) + 1}.jpg'));
    _containers = List<Container>.generate(
        _listLength,
        (index) => Container(
              alignment: Alignment.topRight,
              height: 200,
              child: Row(children: [_images[index], Text(_list[index])]),
            ));
  }

  @override
  void initState() {
    super.initState();
    _resetlist();
  }

  void _addlist() {
    _listLength++;
    _list.add('Item ${_listLength - 1}');
    _images.add(Image.asset('assets/images/${Random().nextInt(4) + 1}.jpg'));
    _containers.add(Container(
      alignment: Alignment.topRight,
      height: 200,
      child: Row(
        children: [_images[_listLength - 1], Text(_list[_listLength - 1])],
      ),
    ));
  }

  void _removelist() {
    if (_listLength > 0) {
      _listLength--;
      _containers.removeLast();
      _list.removeLast();
      _images.removeLast();
    }
  }
  //Image.asset('assets/images/${Random().nextInt(4) + 1}.jpg')

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 700,
            width: double.infinity,
            child: Center(
              child: ListView(
                children: _containers,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _resetlist();
                      });
                    },
                    child: const Icon(
                      Icons.restart_alt,
                      color: Colors.red,
                      size: 30.0,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _addlist();
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 30.0,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _removelist();
                      });
                    },
                    child: const Icon(
                      Icons.remove,
                      color: Colors.yellow,
                      size: 30.0,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
