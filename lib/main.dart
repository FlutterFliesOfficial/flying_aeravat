import 'package:fake_fireman/bloc_state_observer.dart';
import 'package:fake_fireman/config/config.dart';
import 'package:fake_fireman/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion/motion.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocStateOberver();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  await Motion.instance.initialize();
  Motion.instance.setUpdateInterval(45.fps);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banking App',
      theme: themeData(context),
      home: const MainScreen(),
    );
  }
}
