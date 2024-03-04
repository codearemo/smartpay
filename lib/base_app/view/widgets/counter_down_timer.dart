import 'dart:async';

import 'package:smartpay/base_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int seconds;

  CountdownTimer({required this.seconds});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _remainingTime = Duration(seconds: widget.seconds);
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime -= Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String hours = duration.inHours.remainder(24).toString().padLeft(2, '0');
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Resend Code in ${_formatDuration(_remainingTime)}',
      style: const TextStyle(
        color: AppColors.lightGrey,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      textAlign: TextAlign.center,
    );
  }
}
