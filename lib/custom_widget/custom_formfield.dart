import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/themes.dart';
import 'package:todo_app/constants/utilities.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    Key? key,
    this.autoFocused,
    this.isSecret,
    this.readOnly,
    required this.hintText,
    this.maxLength,
    this.maxLines,
    this.validation,
    this.inputType,
    this.inputAction,
    this.myFocus,
    this.nextFocus,
    this.onTapped,
    this.onChanged,
    this.onSubmitted,
    this.onSave,
    this.fieldControl,
    this.autoValidateMode,
  }) : super(key: key);

  final bool? autoFocused;
  final bool? isSecret;
  final bool? readOnly;
  final String hintText;
  final int? maxLength;
  final int? maxLines;
  final ValidationType? validation;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FocusNode? myFocus;
  final FocusNode? nextFocus;
  final Function? onTapped;
  final Function? onChanged;
  final Function? onSave;
  final Function? onSubmitted;
  final TextEditingController? fieldControl;
  final AutovalidateMode? autoValidateMode;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool obscureNow = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kFormFieldPadding,
      child: TextFormField(
          autofocus: widget.autoFocused ?? false,
          focusNode: widget.myFocus,
          controller: widget.fieldControl,
          cursorHeight: 25.0,
          cursorColor: kprimaryColor,
          obscureText:
              widget.isSecret != null && widget.isSecret == true && obscureNow,
          obscuringCharacter: '*',
          textCapitalization: TextCapitalization.sentences,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines ?? 1,
          keyboardType: widget.inputType,
          textInputAction: widget.inputAction,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: kFieldHintStyle,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            border: kInputBorder,
            focusedBorder: kFocusedInputBorder,
            suffixIcon: widget.isSecret != null && widget.isSecret == true
                ? IconButton(
                    icon: Icon(obscureNow ? Icons.lock : Icons.lock_open),
                    color: kEnabledColor,
                    onPressed: () {
                      setState(() {
                        obscureNow = !obscureNow;
                      });
                    },
                  )
                : const SizedBox(),
          ),
          textAlignVertical: TextAlignVertical.center,
          readOnly: widget.readOnly ?? false,
          style: kFieldTextStyle,
          autovalidateMode:
              widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
          validator: (value) {
            switch (widget.validation) {
              case ValidationType.emptiness:
                {
                  if (value == null || value.isEmpty) {
                    return '* Required';
                  }
                  return null;
                }

              case ValidationType.dateTime:
                {
                  if (value == null || value.isEmpty) {
                    return '* Required';
                  }
                  return null;
                }

              default:
                {
                  return null;
                }
            }
          },
          onTap: () => widget.onTapped == null ? {} : widget.onTapped!(),
          onSaved: (value) =>
              widget.onSave == null ? {} : widget.onSave!(value),
          onChanged: (data) =>
              widget.onChanged == null ? {} : widget.onChanged!(data),
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(widget.nextFocus);
            widget.onSubmitted == null ? {} : widget.onSubmitted!(value);
          }),
    );
  }
}
