import 'package:flutter/material.dart';
import 'package:fwc_album_app/src/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/src/core/ui/styles/text_styles.dart';

class Button extends StatelessWidget {
  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool outline;

  const Button({
    super.key,
    required this.style,
    required this.labelStyle,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
    this.outline = false,
  });

  Button.primary({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
  })  : style = ButtonStyles.instance.primaryButton,
        labelStyle = TextStyles.instance.textSecondaryFontExtraBold,
        outline = false;

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      label,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
    );

    return SizedBox(
      width: width,
      height: height,
      child: outline
          ? OutlinedButton(
              style: style,
              onPressed: onPressed,
              child: labelText,
            )
          : ElevatedButton(
              style: style,
              onPressed: onPressed,
              child: labelText,
            ),
    );
  }
}
