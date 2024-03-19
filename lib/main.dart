import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travellereminder/features/app/splash_screen/splash_screen.dart';
import 'package:travellereminder/features/user_auth/presentation/pages/login_page.dart';
import 'package:travellereminder/features/user_auth/presentation/pages/sign_up_page.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyCwZHk9OrYRpqICXAlIQgYTaP14NsxxbUc", appId: "1:1032128007431:web:d6ba63043c573d597ac9a2", messagingSenderId: "1032128007431", projectId: "travellereminder"));
  }
  else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travellereminder App',
      routes: {
        '/': (context) => SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => Home(),
      },
    );
  }
}