import 'dart:async';

import 'package:flutter/material.dart';
import 'package:themoviedb/domain/api%20client/api_client.dart';
import 'package:themoviedb/domain/api%20client/data_provider/session_data_provider.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAyth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
      final login = loginTextController.text;
      final password = passwordTextController.text;
      if (login.isEmpty || password.isEmpty) {
        _errorMessage = 'Заполните логин и пароль';
        notifyListeners();
        return;
      }
       _errorMessage = null;
       _isAuthProgress = true;
       notifyListeners();
       String? sessionId;
       try {
           sessionId = await _apiClient.auth(
            username: login,
            password: password);
       } catch (e) {
        _errorMessage = 'Неправильный логин или пароль';
       }
      _isAuthProgress = false;
      if (_errorMessage != null) {
          notifyListeners();
          return;
      }
      if (sessionId == null){
        _errorMessage = 'Неизвестная ошибка, повторите попытку';
        notifyListeners();
        return;
      }
      await _sessionDataProvider.setSessionId(sessionId);
      unawaited(Navigator.of(context).pushReplacementNamed(MainNavigationRoutesNames.mainScreen));
  }

}

class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
  final Model model;

  const NotifierProvider({
    super.key,
    required this.model,
    required this.child}) : 
      super(notifier: model, 
          child: child);

  final Widget child;

  static Model? watch<Model extends ChangeNotifier>(
    BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()?.model;
  }
  static Model? read<Model extends ChangeNotifier>(
    BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()?.widget;
    return widget is NotifierProvider<Model> ? widget.model : null;
  }

}

// class AuthProvider extends InheritedNotifier {
//   final AuthModel model;
//   const AuthProvider({
//     super.key,
//     required this.model,
//     required this.child}) : 
//       super(notifier: model, 
//           child: child);

//   final Widget child;

//   static AuthProvider? watch(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
//   }
//   static AuthProvider? read(BuildContext context) {
//     final widget = context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
//     return widget is AuthProvider ? widget : null;
//   }