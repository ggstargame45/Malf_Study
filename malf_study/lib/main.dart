import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:malf_study/screens/meeting_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:convert';
import './detail_page.dart';
import './list_page.dart';
import 'screens/writing_pages/writing_pages1.dart';

var namedRoutes = <String, WidgetBuilder>{
  '/': (context) => const HttpWithHttpScreen(),
  '/write': (context) => const WritingPages1(),
  '/detail': (context) => MeetingPage(),
};

void main() {
  //Provider.debugCheckInvalidValueType = null;
  //TODO:hi junsoo_
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HttpWithHttpScreen.routeName,
      //앞으로 전환되는 모든 화면
      routes: {
        HttpWithHttpScreen.routeName: (context) => const HttpWithHttpScreen(),
        WritingPages1.routeName: (context) => const WritingPages1(),
        MeetingPage.routeName: (context) => MeetingPage(),
      },
    );
  }
}
