import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../data/json_data.dart';

class Network {
  static const String url = 'http://3.36.185.179:8000/bulletin-board/post/0';

  static Future<JsonData> getInfo() async {
    try {
      final response = await http
          .get(Uri.parse('http://3.36.185.179:8000/bulletin-board/post/0'));
      if (response.statusCode == 200) {
        final JsonData meetingData = jsonDataFromJson(response.body);
        return meetingData;
      } else {
        Fluttertoast.showToast(msg: 'Error');
        return JsonData(status: "404", data: []);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return JsonData(status: "404", data: []);
    }
  }

  static void postinfo(Map<String, dynamic> data) async {
    try {
      await http.post(
        Uri.parse('http://3.36.185.179:8000/bulletin-board/post/0'),
        headers: <String, String>{
          'Content-Type': 'meeting_page/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      Fluttertoast.showToast(msg: "good");
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}


// final dio = Dio();

// Future<void> request() async {
//   try {
//     final response =
//         await dio.get('http://3.36.185.179:8000/bulletin-board/post/0');
//     return response.data["data"][0];
//   } catch (error) {
//     print('오류: $error');
//   }
// }

// Future<void> post(int user_id, int like, int participantion_status) async {
//   if (like == 0) {
//     like = 1;
//   } else if (like == 1) {
//     like = 0;
//   }

//   try {
//     final response = await dio
//         .post('http://3.36.185.179:8000/bulletin-board/post/$user_id', data: [
//       {
//         'id': user_id,
//         'like_check': like,
//         'participantion_status': participantion_status
//       }
//     ]);
//     return response.data["data"][0];
//   } catch (error) {
//     print('오류: $error');
//   }
// }
