import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/logic.dart';
import 'package:frontend/provider.dart';

class ViewModel {
  Logic _logic = Logic();
  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    this._ref = ref;
  }

  get count => _ref.watch(countDataProvider).count.toString();
  get countUp =>
      _ref.watch(countDataProvider.select((value) => value.countUp)).toString();
  get countDown => _ref
      .watch(countDataProvider.select((value) => value.countDown))
      .toString();

  void onIncrease() {
    _logic.increase();

    _ref.read(countDataProvider.state).update((state) => _logic.countData);
  }

  void onDecrease() {
    _logic.decrease();

    _ref.read(countDataProvider.state).update((state) => _logic.countData);
  }

  void onReset() {
    _logic.reset();

    _ref.read(countDataProvider.state).update((state) => _logic.countData);
  }
}
