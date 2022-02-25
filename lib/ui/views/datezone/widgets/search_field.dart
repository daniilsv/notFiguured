import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key key,
    this.textEditingController,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      focusNode: focusNode,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        contentPadding: AppPaddings.v9h12,
        fillColor: AppColors.bg,
        hintText: Strings.current.search,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        prefixIcon: CupertinoButton(
          minSize: 10,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Icon(
            EvaIcons.search,
            size: 20,
            color: Colors.black.withOpacity(0.36),
          ),
        ),
        suffixIcon: CupertinoButton(
          minSize: 10,
          padding: EdgeInsets.zero,
          onPressed: textEditingController?.clear,
          child: Icon(
            EvaIcons.closeCircle,
            size: 20,
            color: Colors.black.withOpacity(0.36),
          ),
        ),
      ),
    );
  }
}
