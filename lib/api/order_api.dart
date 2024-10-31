import 'package:dio/dio.dart';
import 'package:emergencyorder/data/HospitalDto.dart';

import '../data/hospital_response.dart';

class OrderApi {
  final dio = Dio();
  int test = 0;

  OrderApi() {
    dio.options.baseUrl = 'https://api.pub.dev';
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);
    dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options,handler) async {
      if(options.path=='/order'){
        await Future.delayed(Duration(seconds: 1));
        if(options.queryParameters['beforeRequestNo']==''){
          handler.resolve(Response(data:12345,requestOptions: RequestOptions()));
        } else {
          handler.resolve(Response(data:67890,requestOptions: RequestOptions()));
        }
      }else if(options.path=='/hospitalResponse'){
        await Future.delayed(Duration(milliseconds: 300));
        if(options.queryParameters['orderNo']==12345){
          handler.resolve(Response(data:HospitalResponse([HospitalDto('충북대학교병원', '충청북도 청주시 서원구 1순환로 776', '043-269-6992', '10km', test>0?'No':'W', '36.624139', '127.462816'),
            HospitalDto('베스티안병원', '충청북도 청주시 흥덕구 오송읍 오송생명1로 191-0', '043-910-7575', '1km', test>3?'No':'W','36.635795', '127.491329'),
            HospitalDto('청주성모병원', '충청북도 청주시 청원구 주성로 173-19 (주중동)', '043-219-8000', '2km', test>1?'No':'W','36.635795', '127.491327'),
            HospitalDto('청주의료원', '충청북도 청주시 서원구 흥덕로 48-0 (사직동,청주의료원)', '043-279-2300', '3km', test>2?'No':'W','36.635795', '127.591326'),
            HospitalDto('하나병원', '충청북도 청주시 흥덕구 2순환로 1262 (가경동)', '043-230-6114', '3km', test>3?'No':'W','36.635795', '127.691325'),
            HospitalDto('효성병원', '충청북도 청주시 상당구 쇠내로 16 (금천동)', '043-221-5000', '3km', test>4?'No':'W','36.635795', '127.991324')]),requestOptions: RequestOptions()));
        }else{
          handler.resolve(Response(data:HospitalResponse([HospitalDto('건국대학교충주병원', '충청북도 충주시 국원대로 82 (교현동)', '043-840-8593', '10km', test>0?'Yes':'W', '36.979082', '127.928645'),
            HospitalDto('제일조은병원', '충청북도 음성군 금왕읍 음성로1230번길 10', '043-883-8800', '1km', test>3?'Yes':'W','36.997507', '127.598414'),
            HospitalDto('옥천성모병원', '충청북도 옥천군 옥천읍 성왕로 1195', '043-730-7000', '2km', test>1?'No':'W','36.635795', '127.491327'),
            HospitalDto('한국병원', '충청북도 청주시 상당구 단재로 106 (영운동)', '043-222-7000', '3km', test>2?'Yes':'W','36.635795', '127.591326'),
            HospitalDto('영동병원', '충청북도 영동군 영동읍 대학로 106', '043-740-9000', '3km', test>3?'No':'W','36.635795', '127.691325'),
            HospitalDto('명지병원', '충청북도 제천시 내토로 991-0 (고암동,의료법인명지의료재단명지병원)', '043-640-8114', '3km', test>4?'Yes':'W','36.635795', '127.991324')]),requestOptions: RequestOptions()));
        }

        test++;
      }
    }));
  }

  Future<int> getOrderNo(String beforeRequestNo) async {
    try {
      final response = await dio.get('/order',queryParameters: {"beforeRequestNo":beforeRequestNo});
      return response.data as int;
    } catch (e) {
      return -1;
    }
  }

  Future<HospitalResponse> getHospitalResponse(int orderNo) async {
    final response = await dio
        .get('/hospitalResponse', queryParameters: {'orderNo': orderNo});
    return response.data as HospitalResponse;
  }

  void forceShutdown(){
    dio.close(force:true);
  }
}
