import 'package:flutter/material.dart';

class KeyValueDataWidget extends StatelessWidget {
  final String name;
  final String? value;
  const KeyValueDataWidget({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(fontSize: 15),
        child: SelectableText.rich(TextSpan(
            style: TextStyle(
              color: Theme.of(context).textTheme.subtitle1!.color,
            ),
            children: [
              TextSpan(
                style: const TextStyle(fontWeight: FontWeight.bold),
                text: '$name: ',
              ),
              TextSpan(
                style: const TextStyle(),
                text: '$value',
              )
            ])));
  }
}
