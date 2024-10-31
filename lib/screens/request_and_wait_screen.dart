import 'package:emergencyorder/api/order_api.dart';
import 'package:emergencyorder/screens/hospital_result_screen.dart';
import 'package:flutter/material.dart';

class RequestAndWaitScreen extends StatefulWidget{
  @override
  _RequestAndWaitScreenState createState() => _RequestAndWaitScreenState();

}

class _RequestAndWaitScreenState extends State<RequestAndWaitScreen> {

  OrderApi api = OrderApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () async {
            //     _gotoHospitalResultScreen(1);
            //   },
            //   child: Text('결과화면 이동 (테스트)'),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('initstate!!');
    _getOrderNoFromApi('');
  }

  void _getOrderNoFromApi(String beforeRequestNo){
    api.getOrderNo(beforeRequestNo).then((orderNo) async {
      _gotoHospitalResultScreen(orderNo);
    });
  }

  Future<void> _gotoHospitalResultScreen(int orderNo) async {
    print('gotoHospitalResultScreen');
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HospitalResultScreen(),settings: RouteSettings(arguments: orderNo)),
    );
    if (!context.mounted) return;
    if(result!=null){
      print('gotoHospitalResultScreen not null retry!');
      _getOrderNoFromApi(result);
    }
  }
}