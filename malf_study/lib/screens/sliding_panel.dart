import '../data/json_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  List<MeetingData> meetingData;

  String removeExtension(String fileName) {
    int dotIndex = fileName.lastIndexOf('.');
    if (dotIndex != -1) {
      return fileName.substring(0, dotIndex);
    } else {
      return fileName;
    }
  }

  PanelWidget({Key? key, required this.controller, required this.meetingData})
      : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "투어",
                textAlign: TextAlign.left,
              ),
              Text(
                "${widget.meetingData[0].title}",
                textScaleFactor: 1.5,
              ),
              Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_searching_sharp),
                          Text('장소'),
                        ],
                      ),
                    ),
                    horizontalTitleGap: 20,
                    title: Text('"${widget.meetingData[0].meetingLocation}"'),
                  ),
                  ListTile(
                    leading: Container(
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_searching_sharp),
                          Text('날짜'),
                        ],
                      ),
                    ),
                    horizontalTitleGap: 20,
                    title: Text("${widget.meetingData[0].meetingStartTime}"),
                  ),
                  ListTile(
                    leading: Container(
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_searching_sharp),
                          Text('인원'),
                        ],
                      ),
                    ),
                    horizontalTitleGap: 20,
                    title: Text("${widget.meetingData[0].meetingCapacity}"),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://3.36.185.179:8000/${widget.meetingData[0].authorPicture}")),
              Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                        widget.meetingData[0].userType == 1 ? "현지인" : "여행객"),
                  ),
                  Row(
                    children: [
                      Text("${widget.meetingData[0].authorNickname}"),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("${widget.meetingData[0].authorNation}"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            "${widget.meetingData[0].content}",
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Image(image: AssetImage("assets/1689420712322-431438052.jpg")),
        ),
      ],
    );
  }
}
