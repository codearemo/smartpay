import 'package:assesment_test/utils/colors.dart';
import 'package:flutter/material.dart';

class AppInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final FocusNode? focusNode;
  final String? Function(String? value)? validator;

  const AppInputField({
    Key? key,
    this.controller,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.focusNode,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  bool obscure = false;
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
    obscure = widget.obscureText;

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      validator: widget.validator,
      obscureText: obscure,
      obscuringCharacter: '\u{25CF}',
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey50,
        hintStyle: const TextStyle(
          color: AppColors.grey400,
        ),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.grey900,
        ),
        contentPadding: const EdgeInsets.all(16),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: !widget.obscureText
            ? Icon(widget.suffixIcon)
            : obscure
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        obscure = !obscure;
                        setState(() {});
                      },
                      child: Image.asset(
                        'assets/icons/eye_opened.png',
                        height: 10,
                        width: 10,
                        color: AppColors.grey500,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        obscure = !obscure;
                        setState(() {});
                      },
                      child: Image.asset(
                        'assets/icons/eye_closed.png',
                        height: 10,
                        width: 10,
                        color: AppColors.grey500,
                      ),
                    ),
                  ),
        border: OutlineInputBorder(
          borderSide: _controller.text.isEmpty
              ? BorderSide.none
              : const BorderSide(
                  color: AppColors.primary,
                  width: 1,
                ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: _controller.text.isEmpty
              ? BorderSide.none
              : const BorderSide(
                  color: AppColors.primary,
                  width: 1,
                ),
        ),
        focusedBorder: _focusNode.hasFocus
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: AppColors.primary, width: 1),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
      ),
    );
  }
}
