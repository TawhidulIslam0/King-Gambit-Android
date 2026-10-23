import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/chess_web_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(const [
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MedievalChessMobileApp());
}

class MedievalChessMobileApp extends StatelessWidget {
  const MedievalChessMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "King's Gambit — Medieval 3D Chess",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090B10),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD9B878),
          surface: Color(0xFF11151D),
        ),
        useMaterial3: true,
      ),
      home: const ChessWebScreen(),
    );
  }
}
