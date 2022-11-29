import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:night_canteen_user/screens/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:night_canteen_user/screens/UserHomeScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      GetMaterialApp(
        home: Scaffold(
          body : StreamBuilder<User?>(
              stream: FirebaseAuth. instance.authStateChanges(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return UserHomeScreen();
                }
                else
                  return SignUpScreen();
              }
          )
    ),
      );

  }

  doYourStuffWithFirebase() {

  }
}
