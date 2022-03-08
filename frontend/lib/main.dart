import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/provider.dart';

import 'data/count_data.dart';

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

class MyHomePage extends ConsumerStatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            ref.watch(titleProvider),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(ref.watch(messageProvider)),
              Text(
                ref.watch(countDataProvider).count.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      CountData countData = ref.watch(countDataProvider);
                      countData = countData.copyWith(
                          count: countData.count + 1,
                          countUp: countData.countUp + 1);
                    },
                    child: Icon(CupertinoIcons.plus),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      CountData countData = ref.read(countDataProvider);
                      countData = countData.copyWith(
                          count: countData.count + 1,
                          countUp: countData.countDown + 1);
                    },
                    child: Icon(CupertinoIcons.minus),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(ref
                      .watch(countDataProvider.select((value) => value.countUp))
                      .toString()),
                  Text(ref
                      .watch(
                          countDataProvider.select((value) => value.countDown))
                      .toString()),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.watch(countProvider.state).state++,
          child: Icon(CupertinoIcons.refresh),
        ));
  }
}
