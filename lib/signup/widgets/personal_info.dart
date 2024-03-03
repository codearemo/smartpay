import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/utils/constants.dart';
import 'package:assesment_test/widgets/alternative_auth.dart';
import 'package:assesment_test/widgets/app_dropdown_buttom_sheet.dart';
import 'package:assesment_test/widgets/app_elevated_button.dart';
import 'package:assesment_test/widgets/app_input_field.dart';
import 'package:assesment_test/widgets/app_text.dart';
import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(AppConstants.generalPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Hey there! tell us a bit \nabout ",
                    style: TextStyle(
                      color: AppColors.grey900,
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                    ),
                    children: [
                      TextSpan(
                        text: "yourself",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const AppInputField(
                  hintText: 'Full name',
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(
                  height: 15,
                ),
                const AppInputField(
                  hintText: 'Username',
                ),
                const SizedBox(
                  height: 15,
                ),
                const AppDropdownBottomSheet(),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                const AppInputField(
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 35,
                ),
                AppElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Center(
                      child: AppText(
                        'Continue',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        );
  }
}