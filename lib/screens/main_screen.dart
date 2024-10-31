import 'package:emergencyorder/screens/drawing_screen.dart';
import 'package:flutter/material.dart';

import 'inquiry_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text('응급환자 구조 요청', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('전체 메뉴'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('요청 시작하기'),
              onTap: () {
                // 항목 클릭 시 동작을 여기에 추가
                Navigator.pop(context); // 드로어 닫기
              },
            ),
            ListTile(
              title: Text('병원 응급실 현황'),
              onTap: () {
                // 항목 클릭 시 동작을 여기에 추가
                Navigator.pop(context); // 드로어 닫기
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DrawingScreen()),
            );
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '요청 시작',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}