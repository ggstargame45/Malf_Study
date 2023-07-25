import 'dart:convert';
import 'dart:math';
import 'package:malf_study/list_page.dart';
import 'package:malf_study/screens/loading.dart';
import '../data/json_data.dart';
import '../network/network.dart';
import '../screens/sliding_panel.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class MeetingPage extends StatefulWidget {
  MeetingPage({super.key});

  static String routeName = "/detail";

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  List<MeetingData> _jsonData = List.empty();
  bool loading = false;
  int picked_id = 0;
  // List<String> parseMeetingPicList(String meetingPic) {
  //   final List<String> _meetingPicList;
  //   _meetingPicList = meetingPic.substring(0, meetingPic.length + 1).split(",");
  //   return _meetingPicList;
  // }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final arguments = ModalRoute.of(context)!.settings.arguments;
      picked_id = arguments as int;

      Network.getInfo(picked_id).then((value) {
        setState(() {
          _jsonData = value.data;

          loading = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading == false) {
      return const Loading();
    } else if (loading == true) {
      List _meetingPicList = jsonDecode(_jsonData[0].meetingPic);
      logger.d(_meetingPicList[0]);

      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  // 더보기 버튼 기능 구현
                },
              ),
            ],
          ),
          body: SlidingUpPanel(
            body: Container(
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: _meetingPicList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "http://3.36.185.179:8000/${_meetingPicList[itemIndex]}")),
                    options: CarouselOptions(
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      height: 300,
                      aspectRatio: 0.22,
                      viewportFraction: 1.0,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      enlargeCenterPage: true,
                      enlargeFactor: 0.8,
                      onPageChanged: (index, reason) {},
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 400,
                  )
                ],
              ),
            ),
            parallaxEnabled: true,
            parallaxOffset: 0.3,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            minHeight: MediaQuery.of(context).size.height / 1.8,
            maxHeight: MediaQuery.of(context).size.height,
            panelBuilder: (sc) => PanelWidget(
              controller: sc,
              meetingData: _jsonData,
            ),
            collapsed: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            footer: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_jsonData[0].likeCheck == 0) {
                          setState(() {
                            _jsonData[0].likeCheck = 1;
                          });
                        } else if (_jsonData[0].likeCheck == 1) {
                          setState(() {
                            _jsonData[0].likeCheck = 0;
                          });
                        }
                        Network.postinfo({
                          "like_check": _jsonData[0].likeCheck,
                          "participation_status":
                              _jsonData[0].participantionStatus
                        }, picked_id);
                      },
                      icon: Icon(Icons.thumb_up),
                      style: ButtonStyle(),
                      label:
                          Column(children: [Text("${_jsonData[0].likeCount}")]),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_jsonData[0].participantionStatus == 0) {
                      setState(() {
                        _jsonData[0].participantionStatus = 1;
                      });
                    } else if (_jsonData[0].participantionStatus == 1) {
                      setState(() {
                        _jsonData[0].participantionStatus = 0;
                      });
                    }
                    Network.postinfo({
                      "like_check": _jsonData[0].likeCheck,
                      "participation_status": _jsonData[0].participantionStatus
                    }, picked_id);
                  },
                  child: Text('참여하기'),
                ),
              ],
            ),
          ));
    } else {
      return Placeholder();
    }
  }
}
