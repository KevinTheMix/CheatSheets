
// Passing data **from child to parent**:

// - via a callback method passed from parent through the child's constructor
// - via `of()` parent _static_ state (using `findAncestorStateOfType()`), which has a public setter method accessing a private state variable, ie:

// Simplified from https://flutteragency.com/send-data-from-child-widget-to-its-parent
// ParentStateful widget:
static ParentState of(BuildContext context) => context.findAncestorStateOfType<ParentState>();
// ParentState state:
set koko(String value) => setState(() => _koko = value);
// Child's build() method:
ParentStateful.of(context).koko = "koko";
