import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:convert';

Logger logger = Logger();

class UrlItem {
  final int post_id;
  final String title;
  final String author_nickname;
  final int author_nation;
  final int user_type;
  final int meeting_capacity;
  final String meeting_pic;
  final String meething_location;
  final DateTime meeting_start_time;

  UrlItem({
    required this.post_id,
    required this.title,
    required this.author_nickname,
    required this.author_nation,
    required this.user_type,
    required this.meeting_capacity,
    required this.meeting_pic,
    required this.meething_location,
    required this.meeting_start_time,
  });

  factory UrlItem.fromJson(Map<String, dynamic> json) {
    return UrlItem(
      post_id: json['post_id'],
      title: json['title'],
      author_nickname: json['author_nickname'],
      author_nation: json['author_nation'],
      user_type: json['user_type'],
      meeting_capacity: json['meeting_capacity'],
      meeting_pic: "http://3.36.185.179:8000/${json['meeting_pic']}",
      meething_location: json['meeting_location'],
      meeting_start_time: DateTime.parse(json['meeting_start_time']),
    );
  }
}

class HttpProvider extends ChangeNotifier {
  //List<PiscumPhotoModel> photos = [];
  List<UrlItem> photos = [];

  int currentPageNo = 1;
  bool isAdd = false;

  Future<void> started() async {
    await _getPhotos();
  }

  void scrollListerner(ScrollUpdateNotification notification) {
    if (notification.metrics.maxScrollExtent * 0.85 <
        notification.metrics.pixels) {
      _morePhotos();
    }
  }

  Future<void> _morePhotos() async {
    if (!isAdd) {
      isAdd = true;
      notifyListeners();
      List<UrlItem>? _data = await _fetchPost();
      Future.delayed(const Duration(milliseconds: 1000), () {
        photos.addAll(_data);
        currentPageNo = currentPageNo + 1;
        isAdd = false;
        notifyListeners();
      });
    }
  }

  Future<void> _getPhotos() async {
    List<UrlItem>? _data = await _fetchPost();
    photos = _data;
    currentPageNo = 2;
    logger.e(currentPageNo);
    notifyListeners();
  }

  Future<List<UrlItem>> _fetchPost() async {
    try {
      http.Response _response = await http
          .get(Uri.parse("http://3.36.185.179:8000/bulletin-board/posts"));
      if (_response.statusCode == 200) {
        List<dynamic> _data = json.decode(_response.body)['data'];
        List<UrlItem> _result = _data.map((e) => UrlItem.fromJson(e)).toList();
        return _result;
      } else {
        return [];
      }
    } catch (error) {
      logger.e(error);
      return [];
    }
  }
}

AppBar appBar({
  required String title,
}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
  );
}

class HttpWithHttpScreen extends StatelessWidget {
  const HttpWithHttpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider<HttpProvider>(
            create: (_) => HttpProvider()..started(),
            child: Consumer<HttpProvider>(builder: (context, state, child) {
              return Scaffold(
                  appBar: appBar(title: "Http"),
                  body: NotificationListener<ScrollUpdateNotification>(
                    onNotification: (ScrollUpdateNotification notification) {
                      state.scrollListerner(notification);
                      return false;
                    },
                    child: ListView.builder(
                        itemCount: state.photos.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            state.photos[index].meeting_pic,
                                            fit: BoxFit.cover,
                                            frameBuilder: (BuildContext context,
                                                Widget child,
                                                int? frame,
                                                bool wasSynchronouslyLoaded) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: const Color.fromRGBO(
                                                      91, 91, 91, 1),
                                                ),
                                                child: child,
                                              );
                                            },
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: const Color.fromRGBO(
                                                      91, 91, 91, 1),
                                                ),
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _content(
                                              url: state
                                                  .photos[index].meeting_pic,
                                              title: "ID : ",
                                              content: state
                                                  .photos[index].post_id
                                                  .toString()),
                                          _content(
                                              url: state
                                                  .photos[index].meeting_pic,
                                              title: "Author : ",
                                              content: state.photos[index]
                                                  .author_nickname),
                                          _content(
                                              url: state
                                                  .photos[index].meeting_pic,
                                              title: "장소 : ",
                                              content: "${20}"),
                                          _content(
                                              url: state
                                                  .photos[index].meeting_pic,
                                              title: " : ",
                                              content: "${20}"),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                if (state.photos.length - 1 == index &&
                                    state.isAdd) ...[
                                  const SizedBox(
                                    height: 100,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: Colors.deepOrange,
                                    )),
                                  ),
                                ],
                              ],
                            ),
                          );
                        })),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  ));
            })));
  }

  GestureDetector _content({
    required String title,
    required String content,
    required String url,
  }) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrlString(url)) {
          await launchUrlString(url, mode: LaunchMode.externalApplication);
        }
      },
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            content,
            style: const TextStyle(
                fontSize: 14, color: Color.fromRGBO(215, 215, 215, 1)),
          ),
        ],
      ),
    );
  }
}

void main() {
  //Provider.debugCheckInvalidValueType = null;
  runApp(const HttpWithHttpScreen());
}
