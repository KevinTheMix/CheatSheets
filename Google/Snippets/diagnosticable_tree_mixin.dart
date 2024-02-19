// DiagnosticableTreeMixin:

/// [Source](https://pub.dev/packages/provider/example)
class Koko with DiagnosticableTreeMixin {
  @override debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));  /// Or other types of properties eg [IterableProperty](https://stackoverflow.com/a/63964326)
  }
}
