import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_pro/prsentation/pages/auth/auth_gate.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
            navigationBarTheme: NavigationBarThemeData(
                backgroundColor: Colors.black,
                indicatorColor: Color.fromARGB(255, 189, 85, 59),
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                labelTextStyle: MaterialStateProperty.resolveWith((states) =>
                    states.contains(MaterialState.selected)
                        ? TextStyle(color: Colors.red)
                        : TextStyle()),
                iconTheme: MaterialStateProperty.resolveWith((states) =>
                    states.contains(MaterialState.selected)
                        ? IconThemeData(size: 40)
                        : IconThemeData()))),
        debugShowCheckedModeBanner: false,
        home: AuthGate());
  }
}
