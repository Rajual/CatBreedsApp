import 'package:catbreeds/models/cat_data_model.dart';
import 'package:flutter/material.dart';

class CardCat extends StatelessWidget {
  final CatData catData;
  const CardCat({Key? key, required this.catData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [Text(catData.name)],
      ),
    );
  }
}
