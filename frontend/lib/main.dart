import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/provider.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                Text(ref.watch(titleProvider)),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) =>
                          Text(ref.watch(messageProvider))),
              Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) =>
                          Text(
                            ref.watch(countProvider).toString(),
                            style: Theme.of(context).textTheme.headline4,
                          ))
            ],
          ),
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) => FloatingActionButton(
            onPressed: () => ref.watch(countProvider.state).state++,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ));
  }
}
