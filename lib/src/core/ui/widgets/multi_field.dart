import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';
import 'package:validatorless/validatorless.dart';

class MultiField extends StatefulWidget {
  final Icon? preffixIcon;
  final String label;
  final bool? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatter;

  MultiField({
    super.key,
    this.preffixIcon,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.inputFormatter,
  })  : assert(
          obscureText == true ? suffixIconButton == null : true,
          'obscureText não pode ser enviado em conjunto com o suffixIconButton',
        ),
        obscureTextVN = ValueNotifier(obscureText);

  @override
  State<MultiField> createState() => _MultiFieldState();
}

class _MultiFieldState extends State<MultiField> {
  final defaultInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide(color: ColorsConstants.grey),
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                prefixIcon: widget.preffixIcon,
                hintText: widget.label,
                filled: true,
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: ColorsConstants.greyDark,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                prefixIconColor: ColorsConstants.grey,
                suffixIcon:
                    widget.suffixIconButton ?? (widget.obscureText == true)
                        ? IconButton(
                            onPressed: () {
                              widget.obscureTextVN.value = !obscureTextValue;
                            },
                            icon: Icon(!obscureTextValue
                                ? Icons.visibility_off
                                : Icons.visibility),
                          )
                        : null,
                suffixIconColor: ColorsConstants.grey,
                border: defaultInputBorder,
                enabledBorder: defaultInputBorder,
                focusedBorder: defaultInputBorder.copyWith(
                  borderSide: const BorderSide(
                    color: ColorsConstants.primaryColor,
                  ),
                ),
                errorBorder: defaultInputBorder.copyWith(
                  borderSide: const BorderSide(
                    color: ColorsConstants.primaryColor,
                  ),
                ),
                isDense: true,
              ),
              obscureText: obscureTextValue,
              style: const TextStyle(color: ColorsConstants.grey),
              controller: widget.controller,
              validator: widget.validator ??
                  Validatorless.required('Campo obrigatório'),
              inputFormatters: widget.inputFormatter ?? [],
            ),
          ],
        );
      },
    );
  }
}
