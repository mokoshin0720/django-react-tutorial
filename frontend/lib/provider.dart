import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/data/count_data.dart';

final titleProvider = Provider<String>((ref) {
  return 'Riverpod';
});

final messageProvider = Provider<String>((ref) {
  return 'message from provider';
});

final countProvider = StateProvider<int>((ref) => 0);
final countDataProvider = StateProvider<CountData>(
    (ref) => CountData(count: 0, countUp: 0, countDown: 0));
