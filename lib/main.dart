import 'package:flight_booking_app/ui/start_page.dart';
import 'package:flight_booking_app/ui/ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/ticket': (context) => TicketPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Quang Tran',
    );
  }
}

