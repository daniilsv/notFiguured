import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class ChangeNickName extends StatelessWidget {
  ChangeNickName({Key key, this.nickName}) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String nickName;
  @override
  Widget build(BuildContext context) {
    _textEditingController.text = nickName;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.black),
          elevation: 0.0,
          backgroundColor: AppColors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.current.yourNickname,
                          style: AppStylesBig.headline2Bold,
                        ),
                        const SizedBox(height: 30),
                        AppTextFormField(
                            progressCounter: 1,
                            validator: (val) {
                              if (val.trim().isEmpty) return "Пустое поле";
                              return null;
                            },
                            onChanged: (_) {
                              formKey.currentState.validate();
                            },
                            title: Strings.current.nickname,
                            controller: _textEditingController),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: AppButton(
                  onPressed: () {
                    if (formKey.currentState.validate())
                      Navigator.of(context).pop(
                        _textEditingController.text.trim(),
                      );
                  },
                  text: Strings.current.save,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
