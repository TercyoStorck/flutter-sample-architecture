import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldStream<T> extends StreamBuilder {
  TextFieldStream({
    required Stream stream,
    required TextEditingController controller,
    required FocusNode focusNode,
    TextInputAction? textInputAction,
    String? labelText,
    String? hintText,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputType textInputType = TextInputType.text,
    bool autofocus = false,
    String Function(String error)? onError,
    bool showBorders = true,
    /* int minLines = 1,
    int maxLines = 1, */
    int numberOfLines = 1,
    void Function(String)? onSubmitted,
    bool readOnly = false,
    void Function()? onTap,
    int? maxLength,
    void Function(bool value)? onObscureTextStateChanged,
    bool obscureText = false,
    List<TextInputFormatter>? inputFormatters,
  }) : super(
          stream: stream,
          builder: (context, snapshot) => TextField(
            controller: controller,
            focusNode: focusNode,
            textInputAction: textInputAction,
            textCapitalization: textCapitalization,
            autofocus: autofocus,
            keyboardType: textInputType,
            maxLines: numberOfLines,
            minLines: numberOfLines,
            onSubmitted: onSubmitted,
            readOnly: readOnly,
            onTap: onTap,
            maxLength: maxLength,
            obscureText: obscureText,
            inputFormatters: inputFormatters,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).scaffoldBackgroundColor),
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              hintMaxLines: showBorders ? 1 : 5,
              errorText: snapshot.error != null ? onError?.call(snapshot.error?.toString() ?? '') ?? snapshot.error?.toString() : null,
              border: showBorders ? null : InputBorder.none,
              focusedBorder: showBorders ? null : InputBorder.none,
              enabledBorder: showBorders ? null : InputBorder.none,
              errorBorder: showBorders ? null : InputBorder.none,
              disabledBorder: showBorders ? null : InputBorder.none,
              counter: const Offstage(),
              suffixIcon: onObscureTextStateChanged != null
                  ? TextButton(
                      onPressed: () {
                        obscureText = !obscureText;
                        onObscureTextStateChanged(obscureText);
                      },
                      style: ButtonStyle(
                        splashFactory: InkSplash.splashFactory,
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                      child: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFF5E61AB),
                      ),
                    )
                  : null,
            ),
          ),
        );
}
