// Simplest possible running apps:

import 'package:flutter/material.dart'; // First statement of course.

void main() => runApp(const MaterialApp());
void main() => runApp(const MaterialApp(home: Text('Koko')));
void main() => runApp(const Text('Koko', textDirection: TextDirection.ltr));  // Text direction is required (either locally or in an ancestor).

// Does not work with SafeArea or Scaffold, which require MediaQuery, which is initialized by an enclosing MaterialApp;
// (by WidgetsApp to be precise, see https://api.flutter.dev/flutter/widgets/WidgetsApp-class.html)
// That is checked beforehand via debugCheckHasMediaQuery(), which raises an error since the MediaQuery wasn't initialized in an ancestor.
