import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:offline_service/View/Screen/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 await Hive.openBox('cachedData');
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Homescreen(),
      ),
    );
  }
}

