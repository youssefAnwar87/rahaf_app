import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/theme/app_colors.dart';
import 'package:rahaf/core/customs/custom_button.dart';
import 'package:rahaf/core/customs/text_field_item.dart';
import 'package:rahaf/feature/auth/presentation/widgets/dialog_utils.dart';
import 'package:rahaf/feature/auth/presentation/widgets/header_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ForgetPasswordScreen extends StatefulWidget {

  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var forgetPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title:  Text(AppLocalizations.of(context)!.forget_password),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left, // Change this to the desired icon
            color: Theme.of(context).dividerColor, // Change this to the desired color
          ),
          onPressed: () {
            GoRouter.of(context).pop(); // Navigate back to the previous screen
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 HeaderWidget(
                    headerName: AppLocalizations.of(context)!.forget_password,
                    headerLine:
                    AppLocalizations.of(context)!.enter_your_phone_number_to_reset_your_password),
                TextFieldItem(
                  hintText: AppLocalizations.of(context)!.phone_or_email,
                  controller: forgetPasswordController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_your_mobile_number;
                    }
                    if (value.length != 11) {
                      return AppLocalizations.of(context)!.the_phone_number_should_be_at_least_11_number;
                    }
                    return null;
                  },
                ),
                CustomButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        DialogUtils.kShowDialog(context, AppLocalizations.of(context)!.check_your_messages);
                      }
                    },
                    textInButton: AppLocalizations.of(context)!.reset_password),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
