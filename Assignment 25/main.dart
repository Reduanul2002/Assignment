import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'sign_up_screen.dart';
import 'dart:ui';
import 'sign_in_screen.dart';
import 'fcm_service.dart';
import 'home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = (erroorDetails) {
    FirebaseCrashlytics.instance.recordFlutterError(erroorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  FirebaseCrashlytics.instance.setCustomKey('userId', 12);
  FirebaseCrashlytics.instance.setCustomKey('userRole', 'gest');

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
    return  MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, asyncSnapshot) {
          if(asyncSnapshot.data != null){
            return HomeScreen();
          }else {
            return signInScreen();
          }
        }
      ),
    );
  }
}
