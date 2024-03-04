import 'package:assesment_test/utils/colors.dart';
import 'package:flutter/material.dart';

class AppDropdownBottomSheet extends StatefulWidget {
  const AppDropdownBottomSheet({
    super.key,
    this.controller,
    this.focusNode,
    this.validator,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  @override
  State<AppDropdownBottomSheet> createState() => _AppDropdownBottomSheetState();
}

class _AppDropdownBottomSheetState extends State<AppDropdownBottomSheet> {
  final List<Map<String, dynamic>> _options = [
    {'name': 'Option 1', 'value': 'value1'},
    {'name': 'Option 2', 'value': 'value2'},
    {'name': 'Option 3', 'value': 'value3'},
  ];
  late TextEditingController _controller;
  late FocusNode _focusNode;

  Future<void> _showOptionsBottomSheet(BuildContext context) async {
    _focusNode.requestFocus();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: _options.map((option) {
            return ListTile(
              title: Text(option['name']),
              onTap: () {
                setState(() {
                  _controller.text = option['name'];
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();

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
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _controller.text.isEmpty
                ? AppColors.transparent
                : AppColors.primary,
          )),
      child: TextFormField(
        onTap: () {
          _showOptionsBottomSheet(context).then((_) {
            _focusNode.requestFocus();
          });
        },
        readOnly: true,
        controller: _controller,
        validator: widget.validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.grey50,
          hintStyle: const TextStyle(
            color: AppColors.grey400,
          ),
          contentPadding: const EdgeInsets.all(16),
          hintText: 'Select Country',
          suffixIcon: SizedBox(
            height: 20,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/icons/chevron_bottom.png',
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
      ),
    );
  }
}
