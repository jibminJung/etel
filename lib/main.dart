import 'package:emergencyorder/screens/main_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

void main() async {
  if(!kIsWeb){
    WidgetsFlutterBinding.ensureInitialized();
    await NaverMapSdk.instance.initialize(clientId: 'mvyexdnc50');
  }else{
    GoogleMapsFlutterPlatform mapsImplementation =
    GoogleMapsFlutterPlatform.instance = GoogleMapsPlugin();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Siren Order App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
