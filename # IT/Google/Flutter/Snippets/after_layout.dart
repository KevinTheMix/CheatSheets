import 'package:flutter/widgets.dart';

/// Utility widget that triggers a callback after the first layout of its child.
/// This is useful for scenarios where you need to perform an action after the widget tree has been built and laid out.
class AfterLayout extends StatefulWidget {
  final void Function() onLayout;
  final Widget child;
  const AfterLayout({super.key, required this.onLayout, required this.child});
  @override State<AfterLayout> createState() => _AfterLayoutState();
}
class _AfterLayoutState extends State<AfterLayout> {
  @override void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint('${DateTime.now()}: AfterLayout callback triggered');
      widget.onLayout(); });
  }
  @override Widget build(BuildContext context) => widget.child;
}

// Usage example in a ListView:
// children: [
//   for (int i = 0; i < notes.length; i++)
//     if (i == notes.length - 1)
//       AfterLayout(
//         onLayout: _scrollToBottom,
//         child: NoteField(key: ValueKey(notes[i].id), note: notes[i]),
//       )
//     else
//       NoteField(key: ValueKey(notes[i].id), note: notes[i]),
// ]