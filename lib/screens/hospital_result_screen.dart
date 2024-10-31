import 'dart:async';

import 'package:emergencyorder/api/order_api.dart';
import 'package:emergencyorder/data/HospitalDto.dart';
import 'package:emergencyorder/screens/final_result_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HospitalResultScreen extends StatefulWidget {
  @override
  _HospitalResultScreenState createState() => _HospitalResultScreenState();
}

class _HospitalResultScreenState extends State<HospitalResultScreen> {
  final api = OrderApi();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<HospitalDto> hospitals = [];

  bool requestEndYn = false;

  static const CameraPosition _chungbukdochung = CameraPosition(
    target: LatLng(36.635795, 127.491329),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final orderNo = ModalRoute.of(context)!.settings.arguments as int?;
      if (orderNo != null) {
        getHospitalResponseFromApi(orderNo);
      } else {
        Navigator.popUntil(context, ModalRoute.withName('/'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 세로가 긴 경우
          if (constraints.maxHeight > constraints.maxWidth) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue[100], // 지도 자리
                    child: kIsWeb
                        ? GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: _chungbukdochung,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                            markers: Set.from(hospitals.map((e){return Marker(markerId:MarkerId(e.name),position: LatLng(double.parse(e.lat), double.parse(e.lng)));})),
                          )
                        : NaverMap(
                            options: const NaverMapViewOptions(),
                            onMapReady: (controller) {
                              print("네이버 맵 로딩됨!");
                            },
                          ),
                  ),
                ),
                Container(
                  height: 350, // 바텀 시트 높이
                  child: HospitalListView(),
                ),
              ],
            );
          }
          // 가로가 긴 경우
          else {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue[100], // 지도 자리
                    child: kIsWeb
                        ? GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: _chungbukdochung,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          )
                        : NaverMap(
                            options: const NaverMapViewOptions(),
                            onMapReady: (controller) {
                              print("네이버 맵 로딩됨!");
                            },
                          ),
                  ),
                ),
                Expanded(child: HospitalListView()),
              ],
            );
          }
        },
      ),
    );
  }

  Widget HospitalListView() {
    return ListView.builder(
      itemCount: hospitals.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _goToThePosition(hospitals[index].lat, hospitals[index].lng);
          },
          child: Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(hospitals[index].name),
              subtitle: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hospitals[index].address),
                      Text(hospitals[index].phone),
                      Text('거리: ${hospitals[index].distance}'),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  hospitals[index].isAvailable[0] == 'Y'
                      ? ElevatedButton(
                          onPressed: () async {
                            api.forceShutdown();
                            requestEndYn = true;
                            final result = await Navigator.push(
                                context, _createRouteToFinalResultScreen('Y'));
                            if (!context.mounted) return;
                            if (result == 'RETRY') {
                              Navigator.pop(context, 'requestNumber');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // 버튼 배경색
                          ),
                          child: Text(
                            '이송 확정',
                            style: TextStyle(color: Colors.white), // 텍스트 색상
                          ),
                        )
                      : Container(),
                ],
              ),
              leading: SizedBox(
                  width: 60,
                  child: AvailableConditionIndicator(
                      hospitals[index].isAvailable)),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {
                      // 전화 걸기 기능 추가
                    },
                  ),
                  // Icon(
                  //   hospitals[index].isAvailable ? Icons.check : Icons.close,
                  //   color: hospitals[index].isAvailable ? Colors.green : Colors.red,
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget AvailableConditionIndicator(String isAvailable) {
    if (isAvailable[0] == 'W') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text("응답대기중"),
        ],
      );
    } else if (isAvailable[0] == 'Y') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 20,
              child: Icon(
                Icons.check,
                color: Colors.blue,
              )),
          SizedBox(
            height: 12,
          ),
          Text("가능"),
        ],
      );
    } else if (isAvailable[0] == 'N') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 20,
              child: Icon(
                Icons.dangerous,
                color: Colors.red,
              )),
          SizedBox(
            height: 12,
          ),
          Text("거절"),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
            child: Icon(Icons.question_mark, color: Colors.amber),
          ),
          SizedBox(
            height: 12,
          ),
          Text("에러 발생"),
        ],
      );
    }
  }

  void getHospitalResponseFromApi(int orderNo) {
    if(requestEndYn) return;
    api.getHospitalResponse(orderNo).then((response) async {
      if (!context.mounted) return;
      setState(() {
        hospitals = response.hospitalResponseList;
      });
      if (hospitals.any((hospital) => hospital.isAvailable[0] == 'W') &&
          !requestEndYn) {
        //응답대기중이 하나라도 있으면 다시 요청
        await Future.delayed(Duration(seconds: 1));
        getHospitalResponseFromApi(orderNo);
      } else if (hospitals.every(
          (hospital) => hospital.isAvailable[0] == 'N')) {
        //모두 거절이면 거절페이지
        requestEndYn = true;
        final result =
            await Navigator.push(context, _createRouteToFinalResultScreen('N'));
        if (!context.mounted) return;
        if (result == 'RETRY') {
          Navigator.pop(context, '3');
        }
      }
    });
  }

  Future<void> _goToThePosition(String lat, String lng) async {
    final GoogleMapController controller = await _controller.future;
    final currentZoomLevel = await controller.getZoomLevel();
    CameraPosition position = CameraPosition(
        target: LatLng(double.parse(lat), double.parse(lng)),
        zoom: currentZoomLevel);
    await controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  Route _createRouteToFinalResultScreen(String result) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FinalResultScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        settings: RouteSettings(arguments: result));
  }
}
