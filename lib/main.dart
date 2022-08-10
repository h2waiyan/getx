import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'count_contoller.dart';
import 'screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  CounterController c = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello World")),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => Get.to(const Screen2()),
              child: const Text("Go to Screen 2")),
          Obx(() {
            return Text("Clicks: ${c.count}");
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.snackbar("SnackBar", "This is a snackbar of GetX");
          c.increment();
        },
      ),
    );
  }
}
