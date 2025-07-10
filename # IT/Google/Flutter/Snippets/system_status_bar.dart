import 'package:flutter/services.dart';

void main() => runApp(const KokoApp());

class KokoApp extends ConsumerWidget {
  const KokoApp({super.key});
  @override Widget build(BuildContext context, WidgetRef ref) {

    // Removes transparent status bar (see https://stackoverflow.com/a/56199553/3559724).
    // AnnotatedRegion = annotates a layer tree region with a value
    // SystemUiOverlayStyle = system overlay preference
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.dark),
      child: MaterialApp(…),
    );
  }
}
