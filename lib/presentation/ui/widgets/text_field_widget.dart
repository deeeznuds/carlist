import 'package:carlist/constants/ui_sizes.dart';
import 'package:carlist/presentation/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String? initialValue;
  final String? hintText;
  final int maxLines;
  final int? maxLenght;
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;

  const TextFieldWidget({
    super.key,
    this.initialValue,
    this.hintText,
    this.maxLines = 1,
    this.maxLenght,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final textController = TextEditingController();

  OutlineInputBorder get defaultBorderStyle => OutlineInputBorder(
        borderRadius: BorderRadius.circular(UiSizes.mediumBorderRadius),
        borderSide: BorderSide.none,
      );

  OutlineInputBorder get errorBorderStyle => defaultBorderStyle.copyWith(
        borderSide: const BorderSide(color: AppColors.error, width: 1),
      );

  @override
  void initState() {
    super.initState();
    textController.text = widget.initialValue ?? '';
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
        border: defaultBorderStyle,
        disabledBorder: defaultBorderStyle.copyWith(
          borderSide: BorderSide(color: AppColors.borderLight.withOpacity(0.5)),
        ),
        enabledBorder: defaultBorderStyle,
        focusedBorder: defaultBorderStyle,
        errorBorder: errorBorderStyle,
        focusedErrorBorder: errorBorderStyle,
        filled: true,
        fillColor: AppColors.borderLight,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: widget.maxLines,
      maxLength: widget.maxLenght,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
    );
  }
}
