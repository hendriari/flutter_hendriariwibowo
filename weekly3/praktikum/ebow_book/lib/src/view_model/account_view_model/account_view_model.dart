import 'package:ebow_book/src/model/model/user_model.dart';
import 'package:flutter/material.dart';

class AccountViewModel with ChangeNotifier {
  final List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

  void createNotification(NotificationModel notif){
    _notifications.add(notif);
    notifyListeners();
  }
}
