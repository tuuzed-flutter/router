import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

void main() {
  initRouter();
  runApp(MyApp());
}

FluroRouter _router;

FluroRouter get router => _router;

initRouter() {
  _router = FluroRouter();
  _router.notFoundHandler = Handler(handlerFunc: (_, params) {
    debugPrint("NotFoundPage");
    return null;
  });
  _router.define(
    "/",
    handler: Handler(handlerFunc: (context, params) => MyHomePage()),
  );
  _router.define(
    "/second",
    handler: Handler(handlerFunc: (context, params) => SecondPage()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: router.generator,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => router.navigateTo(context, "/second"),
        tooltip: 'Next',
        child: Icon(
          Icons.navigate_next,
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SecondPage"),
      ),
    );
  }
}
