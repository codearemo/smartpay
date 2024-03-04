import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/base_app/utils/utils.dart';
import 'package:assesment_test/base_app/view/widgets/app_text.dart';
import 'package:assesment_test/modules/account/models/signin_model.dart';
import 'package:flutter/material.dart';

class UserDropDown extends StatelessWidget {
  final List<SigninModel> items;
  final Function(SigninModel?) onChanged;

  const UserDropDown({
    Key? key,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<SigninModel>(
      value: null,
      hint: AppText(
        'Change user',
        style: TextStyle(
          color: AppColors.grey500,
          fontSize: 16.sp,
        ),
      ),
      onChanged: onChanged,
      underline: Container(),
      items: items.map((SigninModel item) {
        return DropdownMenuItem<SigninModel>(
          value: item,
          child: Text(item.data?.user?.username ?? ''),
        );
      }).toList(),
    );
  }
}
