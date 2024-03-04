import 'package:flutter/material.dart';

class AppKey extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const AppKey({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: child,
      ),
    );
  }
}