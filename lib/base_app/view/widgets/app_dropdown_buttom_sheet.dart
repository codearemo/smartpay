import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:smartpay/base_app/utils/colors.dart';
import 'package:smartpay/base_app/utils/constants.dart';
import 'package:smartpay/base_app/utils/loaders.dart';
import 'package:smartpay/base_app/utils/size.dart';
import 'package:smartpay/base_app/utils/utils.dart';
import 'package:smartpay/base_app/view/widgets/app_alert.dart';
import 'package:smartpay/base_app/view/widgets/app_input_field.dart';
import 'package:smartpay/base_app/view/widgets/app_text_button.dart';
import 'package:smartpay/modules/utils/models/country_model.dart';
import 'package:smartpay/modules/utils/presentation/state/utils_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDropdownBottomSheet extends StatefulWidget {
  const AppDropdownBottomSheet({
    super.key,
    this.countryNameTextCtrl,
    this.focusNode,
    this.validator,
  });

  final FocusNode? focusNode;
  final TextEditingController? countryNameTextCtrl;
  final String? Function(String? value)? validator;

  @override
  State<AppDropdownBottomSheet> createState() => _AppDropdownBottomSheetState();
}

class _AppDropdownBottomSheetState extends State<AppDropdownBottomSheet> {
  late FocusNode _focusNode;
  final _controller = TextEditingController();
  final _searchController = TextEditingController();

  Future<void> triggerFetchCountries() async {
    final UtilsCubit utilsCubit = context.read<UtilsCubit>();

    await utilsCubit.fetchCountries();

    if (mounted) {
      if (utilsCubit.state.error == null) {
      } else {
        AppAlerts.showAlert(
          utilsCubit.state.error.toString(),
          context,
          type: AnimatedSnackBarType.error,
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();

    final UtilsCubit utilsCubit = context.read<UtilsCubit>();
    _controller.text = utilsCubit.countries == null
        ? ''
        : utilsCubit.countries
                ?.firstWhere((element) =>
                    element.flag == widget.countryNameTextCtrl?.text)
                .name
                ?.common ??
            '';

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _searchController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UtilsCubit utilsCubit = context.watch<UtilsCubit>();

    return TextFormField(
      onTap: () async {
        setState(() {});
        if (utilsCubit.countries == null) {
          await triggerFetchCountries();
        }

        if (mounted) {
          showModalBottomSheet(
            context: context,
            backgroundColor: AppColors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            ),
            builder: (BuildContext context) {
              final UtilsCubit utilsCubit = context.watch<UtilsCubit>();

              final List<CountryModel> allCountries =
                  utilsCubit.countries ?? [];

              final filteredCountries = allCountries.where((element) {
                return (element.name?.common ?? '')
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase());
              });

              return Padding(
                padding: const EdgeInsets.all(AppConstants.generalPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppInputField(
                            hintText: 'Search',
                            controller: _searchController,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        AppTextButton(
                            onPressed: () {
                              _searchController.text = '';
                              context.pop();
                            },
                            text: 'Cancel'),
                      ],
                    ),
                    S.h(20),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: (filteredCountries).map((option) {
                          return ListTile(
                            leading: Image.network(
                              '${option.flags?.png}',
                              width: 40,
                              height: 20,
                            ),
                            title: Text('${option.name?.common}'),
                            trailing: widget.countryNameTextCtrl?.text ==
                                    '${option.flag}'
                                ? const Icon(
                                    Icons.check_rounded,
                                    color: AppColors.primary,
                                  )
                                : null,
                            onTap: () {
                              setState(() {
                                _controller.text = '${option.name?.common}';
                                widget.countryNameTextCtrl?.text =
                                    '${option.flag}';

                                _searchController.text = '';
                              });
                              context.pop();
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.grey900,
        fontSize: 16.sp,
      ),
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
        prefix: widget.countryNameTextCtrl?.text == ''
            ? null
            : Container(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.network(
                  '${(utilsCubit.countries ?? []).firstWhere((element) => element.flag == widget.countryNameTextCtrl?.text).flags?.png}',
                  width: 20,
                  height: 15,
                  fit: BoxFit.fitHeight,
                ),
              ),
        suffixIcon: SizedBox(
          height: 20,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: utilsCubit.state.loading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppLoaders.invertedCircularProgress,
                    ),
                  )
                : Image.asset(
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
    );
  }
}
