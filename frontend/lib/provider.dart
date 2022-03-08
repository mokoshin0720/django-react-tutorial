import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) {
  return 'Riverpod';
});

final messageProvider = Provider<String>((ref) {
  return 'message from provider';
});

final countProvider = StateProvider<int>((ref) => 0);
