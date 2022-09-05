import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskSatu extends StatefulWidget {
  const TaskSatu({Key? key}) : super(key: key);

  @override
  State<TaskSatu> createState() => _TaskSatuState();
}

class _TaskSatuState extends State<TaskSatu> {
  late String _now;
  late String _time;

  @override
  void initState() {
    super.initState();
    _now = DateFormat('EEEE, d MMMM y').format(DateTime.now());
    _time = _formatTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _times());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Date Time'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// widget date
            _date(),
            const SizedBox(
              height: 10,
            ),
            /// widget time
            _getTime(),
          ],
        ),
      ),
    );
  }
  /// date
  Widget _date() {
    return Text(
      _now,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
  ///time
  Widget _getTime() {
    return Text(
      _time,
      style: const TextStyle(fontSize: 18),
    );
  }

  void _times() {
    final DateTime now = DateTime.now();
    final String formatTime = _formatTime(now);
    setState(() {
      _time = formatTime;
    });
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }
}
