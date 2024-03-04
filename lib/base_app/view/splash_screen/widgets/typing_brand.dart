import 'package:smartpay/base_app/utils/colors.dart';
import 'package:smartpay/base_app/view/widgets/app_text.dart';
import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {
  const TypingText({super.key});

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _textAnimation;
  late String brandName;

  final smartBrandName = 'Smart';
  final payBrandName = 'pay.';

  @override
  void initState() {
    super.initState();
    brandName = '$smartBrandName$payBrandName';

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _textAnimation =
        IntTween(begin: 0, end: brandName.length).animate(_controller)
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = brandName.substring(0, _textAnimation.value);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text.length > smartBrandName.length
              ? text.substring(0, smartBrandName.length)
              : text,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (text.length > smartBrandName.length)
          AppText(
            text.substring(smartBrandName.length, _textAnimation.value),
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
      ],
    );
  }
}