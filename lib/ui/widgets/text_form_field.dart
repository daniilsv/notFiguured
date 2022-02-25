import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/progress_underline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercharged/supercharged.dart';

import '../theme/theme.dart';

class AppTextFormField extends FormField<String> {
  @override
  FormFieldState<String> createState() {
    return _AppTextFormFieldState();
  }

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool showErrorText;

  /// если не [null], то выводит прогрессбар, длинна зависит от
  /// количества введенных символов и значения [progressCounter]
  final int progressCounter;

  AppTextFormField({
    Key key,
    this.controller,
    this.focusNode,
    this.showErrorText = true,
    this.progressCounter,
    String initialValue,
    TextInputType keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.sentences,
    TextInputAction textInputAction,
    TextStyle style,
    StrutStyle strutStyle,
    TextDirection textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions toolbarOptions,
    bool showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType smartDashesType,
    SmartQuotesType smartQuotesType,
    bool enableSuggestions = true,
    bool autovalidate = false,
    bool maxLengthEnforced = true,
    int maxLines = 1,
    int minLines,
    bool expands = false,
    int maxLength,
    ValueChanged<String> onChanged,
    GestureTapCallback onTap,
    VoidCallback onEditingComplete,
    ValueChanged<String> onFieldSubmitted,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    List<TextInputFormatter> inputFormatters,
    bool enabled = true,
    double cursorWidth = 2.0,
    Radius cursorRadius,
    Color cursorColor,
    Brightness keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder buildCounter,
    ScrollPhysics scrollPhysics,
    Iterable<String> autofillHints,
    EdgeInsets padding,
    IconData suffixIcon,
    Function suffixAction,
    String title,
    String hintText,
    bool suffixEnabled = true,
    VoidCallback onCleared,
  })  : assert(initialValue == null || controller == null),
        assert(textAlign != null),
        assert(autofocus != null),
        assert(readOnly != null),
        assert(obscuringCharacter != null && obscuringCharacter.length == 1),
        assert(obscureText != null),
        assert(autocorrect != null),
        assert(enableSuggestions != null),
        assert(autovalidate != null),
        assert(maxLengthEnforced != null),
        assert(scrollPadding != null),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(expands != null),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null || maxLength > 0),
        assert(enableInteractiveSelection != null),
        super(
          key: key,
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          enabled: enabled ?? true,
          builder: (FormFieldState<String> state) {
            void onChangedHandler(String value) {
              if (onChanged != null) {
                onChanged(value);
              }
              state.didChange(value);
            }

            final textField = state as _AppTextFormFieldState;

            final bool hasError = textField.errorText != null;

            InputBorder enabledBorder;
            InputBorder focusedBorder;

            if (progressCounter == null) {
              enabledBorder = UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: hasError ? AppColors.error : AppColors.greyDC));
              focusedBorder = UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: hasError ? AppColors.error : AppColors.primary));
            } else {
              enabledBorder = focusedBorder = ProgressUnderline(
                primary: BorderSide(
                    color: hasError ? AppColors.error : AppColors.primary),
                secondary: const BorderSide(color: AppColors.greyDC),
                ratio: textField._effectiveController.text.length /
                    progressCounter,
              );
            }

            return Padding(
              padding: padding ?? const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onTap,
                    child: IgnorePointer(
                      ignoring: onTap != null,
                      child: TextField(
                        controller: textField._effectiveController,
                        focusNode: textField._effectiveFocusNode,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical:
                                  suffixIcon != null || suffixEnabled ? 0 : 10),
                          labelText: title,
                          enabledBorder: enabledBorder,
                          focusedBorder: focusedBorder,
                          labelStyle: AppStylesSmall.inputs1Regular.copyWith(
                            color:
                                hasError ? AppColors.error : AppColors.greyB8,
                          ),
                          hintText: hintText,
                          hintStyle: AppStylesSmall.inputs1Regular
                              .copyWith(color: AppColors.greyDC),
                          suffix: Builder(
                            builder: (context) {
                              if ((textField._effectiveFocusNode.hasFocus) &&
                                  (textField._effectiveController?.text
                                          ?.isNotEmpty ??
                                      true) &&
                                  suffixIcon == null &&
                                  suffixEnabled) {
                                return CupertinoButton(
                                  minSize: 16,
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  onPressed: () {
                                    textField.reset();
                                    textField._effectiveController.clear();
                                    onCleared?.call();
                                  },
                                  child: const Icon(
                                    AppIcons.cancel,
                                    size: 16,
                                    color: AppColors.greyDC,
                                  ),
                                );
                              } else if (suffixAction != null) {
                                return CupertinoButton(
                                  onPressed: suffixAction,
                                  minSize: 16,
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: Icon(
                                    suffixIcon,
                                    size: 16,
                                    color: AppColors.greyDC,
                                  ),
                                );
                              } else if (validator != null &&
                                  !textField._effectiveFocusNode.hasFocus &&
                                  textField
                                      ._effectiveController.text.isNotEmpty) {
                                return Padding(
                                    padding: const EdgeInsets.only(
                                      right: 13,
                                      bottom: 8,
                                    ),
                                    child: textField.isValid
                                        ? const Icon(
                                            AppIcons.succes,
                                            size: 12,
                                            color: AppColors.success,
                                          )
                                        : const Icon(
                                            AppIcons.error,
                                            size: 12,
                                            color: AppColors.error,
                                          ));
                              }
                              return const SizedBox(width: 0, height: 0);
                            },
                          ),
                        ),
                        keyboardType: keyboardType,
                        textInputAction: textInputAction,
                        style: style,
                        strutStyle: strutStyle,
                        textAlign: textAlign,
                        textAlignVertical: textAlignVertical,
                        textDirection: textDirection,
                        textCapitalization: textCapitalization,
                        autofocus: autofocus,
                        toolbarOptions: toolbarOptions,
                        readOnly: readOnly,
                        showCursor: showCursor,
                        obscuringCharacter: obscuringCharacter,
                        obscureText: obscureText,
                        autocorrect: autocorrect,
                        smartDashesType: smartDashesType ??
                            (obscureText
                                ? SmartDashesType.disabled
                                : SmartDashesType.enabled),
                        smartQuotesType: smartQuotesType ??
                            (obscureText
                                ? SmartQuotesType.disabled
                                : SmartQuotesType.enabled),
                        enableSuggestions: enableSuggestions,
                        maxLengthEnforced: maxLengthEnforced,
                        maxLines: maxLines,
                        minLines: minLines,
                        expands: expands,
                        maxLength: maxLength,
                        onChanged: onChangedHandler,
                        onEditingComplete: onEditingComplete,
                        onSubmitted: onFieldSubmitted,
                        inputFormatters: inputFormatters,
                        enabled: enabled ?? true,
                        cursorWidth: cursorWidth,
                        cursorRadius: cursorRadius,
                        cursorColor: cursorColor,
                        scrollPadding: scrollPadding,
                        scrollPhysics: scrollPhysics,
                        keyboardAppearance: keyboardAppearance ??
                            WidgetsBinding.instance.window.platformBrightness,
                        enableInteractiveSelection: enableInteractiveSelection,
                        buildCounter: buildCounter,
                        autofillHints: autofillHints,
                      ),
                    ),
                  ),
                  if (showErrorText)
                    AnimatedCrossFade(
                      firstChild: Container(height: 0.0),
                      secondChild: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              state.errorText ?? '',
                              style: AppStylesSmall.inputs2TitleRegular
                                  .copyWith(color: AppColors.error),
                            ),
                          ],
                        ),
                      ),
                      crossFadeState: state.hasError
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: 300.milliseconds,
                    ),
                ],
              ),
            );
          },
        );
}

class _AppTextFormFieldState extends FormFieldState<String> {
  TextEditingController _controller;
  FocusNode _focusNode;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _focusNode;

  @override
  AppTextFormField get widget => super.widget as AppTextFormField;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller.addListener(_handleControllerChanged);
    }

    if (widget.focusNode == null) {
      _focusNode = FocusNode();
    }
    _effectiveFocusNode.addListener(_handleFocusNode);
  }

  void _handleFocusNode() => setState(validate);

  void _handleControllerChanged() {
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    _effectiveFocusNode?.removeListener(_handleFocusNode);
    super.dispose();
  }

  @override
  void didUpdateWidget(AppTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _controller =
            TextEditingController.fromValue(oldWidget.controller.value);
      }

      if (widget.controller != null) {
        setValue(widget.controller.text);
        if (oldWidget.controller == null) {
          _controller = null;
        }
      }
    }
  }

  @override
  void didChange(String value) {
    super.didChange(value);

    if (_effectiveController.text != value) {
      _effectiveController.text = value;
    }
  }

  @override
  void reset() {
    super.reset();
    setState(() {
      _effectiveController.text = widget.initialValue;
    });
  }
}
