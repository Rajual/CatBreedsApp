import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KeyValueDataWidget extends StatelessWidget {
  final String name;
  final String? value;
  final bool isLink;
  final double? size;
  const KeyValueDataWidget({
    Key? key,
    required this.name,
    required this.value,
    this.isLink = false,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: size ?? 15),
          child: SelectableText.rich(TextSpan(
              style: TextStyle(
                overflow: TextOverflow.clip,
                color: Theme.of(context).textTheme.subtitle1!.color,
              ),
              children: [
                TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  text: '$name: ',
                ),
                TextSpan(
                  text: '$value',
                  style: TextStyle(color: isLink ? Colors.blue : null),
                  recognizer: isLink
                      ? (TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(value.toString()));
                        })
                      : null,
                )
              ]))),
    );
  }
}
