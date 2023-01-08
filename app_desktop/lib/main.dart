import 'package:app_desktop/presenter/pages/home_page.dart';
import 'package:app_desktop/presenter/utils/app_desktop_colors.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
  await windowManager.setAsFrameless();
  await windowManager.setFullScreen(true);

  });
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      title: 'App Desktop',
      debugShowCheckedModeBanner: false,
      theme: AppDesktopColorsUtil().themeData()
    );
  }
}

class TesteClass extends StatefulWidget {
  const TesteClass({super.key});

  @override
  State<TesteClass> createState() => _TesteClassState();
}

class _TesteClassState extends State<TesteClass> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ElevatedButton(
            onPressed: () {
              scrollController.animateTo(scrollController.position.maxScrollExtent / 2,
                  duration: Duration(seconds: 1), curve: Curves.easeIn
              );
            },
            child: Text("go down"),
          ),
          ElevatedButton(
            onPressed: () {
              scrollController.animateTo(scrollController.position.maxScrollExtent / 4,
                  duration: Duration(seconds: 1), curve: Curves.easeIn
              );
            },
            child: Text("go top"),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              controller: scrollController,
              itemCount: 100,
              itemBuilder: (context, index) {
                return Text('This is it. $index');
              },
            ),
          ),
        ],
      );
  }
    
}