import 'sign_up_screen.dart';
import 'fcm_service.dart';
import 'home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);

  await FcmService.initialize();
  print(await FcmService.getToken());
  FcmService.listenTokenOnChange();

  runApp(const LiveSprots());
}

class LiveSprots extends StatefulWidget {
  const LiveSprots({super.key});

  @override
  State<LiveSprots> createState() => _LiveSprotsState();
}

class _LiveSprotsState extends State<LiveSprots> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpScreen(),
    );
  }
}
