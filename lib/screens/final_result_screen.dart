import 'package:flutter/material.dart';

class FinalResultScreen extends StatefulWidget {
  @override
  _FinalResultScreenState createState() => _FinalResultScreenState();
}

class _FinalResultScreenState extends State<FinalResultScreen> {
  String? result;

  @override
  Widget build(BuildContext context) {
    result = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
        appBar: AppBar(
          title: Text('요청 종료'),
          leading: Container(),
        ),
        body: Column(
          children: [
            Expanded(
                child: Center(
                    child:
                        result?[0] == 'Y' ? SuccessEndPage() : DenyEndPage())),
          ],
        ));
  }

  Widget SuccessEndPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.blue,
          size: 70,
        ),
        SizedBox(
          height: 20,
        ),
        Text('요청이 종료되었습니다!'),
        SizedBox(
          height: 20,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.white,
              shape: StadiumBorder(),
              side: BorderSide(color: Colors.blue, width: 3)),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('메인 화면으로 돌아가기'),
        ),
        SizedBox(
          height: 200,
        )
      ],
    );
  }

  Widget DenyEndPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.mood_bad,
          color: Colors.amber,
          size: 70,
        ),
        SizedBox(
          height: 20,
        ),
        Text('5개 병원에서 거절하였습니다!'),
        Text('다시 요청보내시겠습니까?'),
        SizedBox(
          height: 20,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              shape: StadiumBorder(),
              side: BorderSide(color: Colors.blue, width: 3)),
          onPressed: () {
            Navigator.pop(context,'RETRY');
          },
          child: Text('다시 요청보내기'),
        ),
        SizedBox(
          height: 10,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.white,
              shape: StadiumBorder(),
              side: BorderSide(color: Colors.blue, width: 2)),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('메인 화면으로 돌아가기'),
        ),
        SizedBox(
          height: 200,
        )
      ],
    );
  }
}
