import 'package:flutter/material.dart';
import 'package:project_expense/Services/user_services.dart';
import 'package:project_expense/Widgets/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserServices.checkUserName(),
        builder: (context, snapshot) {
          //if the snphot is still waitting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            //her the hasUserName will be set to true of the data is thir in the snapshot and otherwise false
            bool hasUserName = snapshot.data ?? false;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: "inter"),
              home: Wrapper(showMainScreen: hasUserName),
            );
          }
        });
  }
}
