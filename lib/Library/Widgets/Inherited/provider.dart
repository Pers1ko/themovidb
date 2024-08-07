import 'package:flutter/material.dart';

class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
  final Model model;

  const NotifierProvider({super.key, required this.model, required this.child})
      : super(notifier: model, child: child);

  final Widget child;

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()
        ?.widget;
    return widget is NotifierProvider<Model> ? widget.model : null;
  }
}

class Provider<Model> extends InheritedWidget {
  final Model model;
  const Provider(this.model, {super.key, required this.child})
      : super(child: child);

  final Widget child;

  static Model? watch<Model>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<Model>>()?.model;
  }

  static Model? read<Model>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()
        ?.widget;
    return widget is Provider<Model> ? widget.model : null;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return model != oldWidget.model;
  }
}
