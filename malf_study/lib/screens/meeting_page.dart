import 'dart:convert';
import 'dart:math';

import 'package:malf_study/screens/loading.dart';

import '../data/json_data.dart';
import '../network/network.dart';
import '../screens/sliding_panel.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class MeetingPage extends StatefulWidget {
  MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  List<MeetingData> _jsonData = List.empty();
  bool loading = false;
  int picked_id = 0;

  @override
  void initState() {
    // TODO: implement initState
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

    //print(_jsonData);
  }

  @override
  Widget build(BuildContext context) {
    if (loading == false) {
      return const Loading();
    } else if (loading == true) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  // 더보기 버튼 기능 구현
                },
              ),
            ],
          ),
          body: SlidingUpPanel(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topLeft,
                  image: NetworkImage(
                      "http://3.36.185.179:8000/${jsonDecode(_jsonData[0].meetingPic)[0]}"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            parallaxEnabled: true,
            parallaxOffset: 0.3,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
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
            footer: Container(
              child: Row(
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
                        label: Column(
                            children: [Text("${_jsonData[0].likeCount}")]),
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
                        "participation_status":
                            _jsonData[0].participantionStatus
                      }, picked_id);
                    },
                    child: Text('참여하기'),
                  ),
                ],
              ),
            ),
          ));
    } else {
      return Placeholder();
    }
  }
}

// // ignore: must_be_immutable
// class PanelWidget extends StatefulWidget {
//   final ScrollController controller;
//   List<MeetingData> meetingData;

//   String removeExtension(String fileName) {
//     int dotIndex = fileName.lastIndexOf('.');
//     if (dotIndex != -1) {
//       return fileName.substring(0, dotIndex);
//     } else {
//       return fileName;
//     }
//   }

//   PanelWidget({Key? key, required this.controller, required this.meetingData})
//       : super(key: key);

//   @override
//   State<PanelWidget> createState() => _PanelWidgetState();
// }

// class _PanelWidgetState extends State<PanelWidget> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "투어",
//                 textAlign: TextAlign.left,
//               ),
//               Text(
//                 "${widget.meetingData[0].title}",
//                 textScaleFactor: 1.5,
//               ),
//               Column(
//                 children: [
//                   ListTile(
//                     leading: Container(
//                       width: 60,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Icon(Icons.location_searching_sharp),
//                           Text('장소'),
//                         ],
//                       ),
//                     ),
//                     horizontalTitleGap: 20,
//                     title: Text('"${widget.meetingData[0].meetingLocation}"'),
//                   ),
//                   ListTile(
//                     leading: Container(
//                       width: 60,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Icon(Icons.location_searching_sharp),
//                           Text('날짜'),
//                         ],
//                       ),
//                     ),
//                     horizontalTitleGap: 20,
//                     title: Text("${widget.meetingData[0].meetingStartTime}"),
//                   ),
//                   ListTile(
//                     leading: Container(
//                       width: 60,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Icon(Icons.location_searching_sharp),
//                           Text('인원'),
//                         ],
//                       ),
//                     ),
//                     horizontalTitleGap: 20,
//                     title: Text("${widget.meetingData[0].meetingCapacity}"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(8),
//           child: Row(
//             children: [
//               CircleAvatar(
//                   backgroundImage: NetworkImage(
//                       "http://3.36.185.179:8000/${widget.meetingData[0].authorPicture}")),
//               Column(
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                         widget.meetingData[0].userType == 1 ? "현지인" : "여행객"),
//                   ),
//                   Row(
//                     children: [
//                       Text("${widget.meetingData[0].authorNickname}"),
//                       SizedBox(
//                         width: 10.0,
//                       ),
//                       Text("${widget.meetingData[0].authorNation}"),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(8),
//           child: Text(
//             "${widget.meetingData[0].content}",
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(8),
//           child: Image(image: AssetImage("assets/1689420712322-431438052.jpg")),
//         ),
//       ],
//     );
//   }
// }
