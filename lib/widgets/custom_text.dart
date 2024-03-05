import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String label;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final double? size;
  final String fonFamily;
  final TextDecoration? decoration;
  final double? height;
  final TextOverflow? overflow;

  const CustomText(
      {super.key,
      required this.label,
      this.decoration,
      this.height,
      this.textAlign,
      this.fonFamily = 'Inter',
      this.weight,
      this.color,
      this.size,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          height: height,
          color: color,
          fontWeight: weight,
          fontFamily: fonFamily,
          fontSize: size,
          overflow: overflow,
          decoration: decoration),
    );
  }
}
/**import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String label;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final double? size;
  final String fonFamily;
  final TextDecoration? decoration;
  final double? height;
  final TextOverflow? overflow;

  const CustomText({
    Key? key,
    required this.label,
    this.decoration,
    this.height,
    this.textAlign,
    this.weight,
    this.color,
    this.size,
    this.overflow,
  }) : super(key: key);

  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  bool showFullText = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showFullText = !showFullText;
        });
      },
      child: Text(
        showFullText ? widget.label : truncateText(widget.label),
        style: TextStyle(
          height: widget.height,
          color: widget.color,
          fontWeight: widget.weight,
          fontFamily: widget.fonFamily,
          fontSize: widget.size,
          decoration: widget.decoration,
        ),
        textAlign: widget.textAlign,
        textScaleFactor: 1.0,
        strutStyle: StrutStyle.fromTextStyle(
          style: TextStyle(
            fontSize: widget.size,
            fontWeight: widget.weight,
          ),
        ),
      ),
    );
  }

  String truncateText(String text) {
    const int maxLines = 3;
    List<String> lines = text.split('\n');
    if (lines.length > maxLines) {
      return lines.take(maxLines).join('\n') + ' ...read more';
    } else {
      return text;
    }
  }
}
 */