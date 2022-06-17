import 'package:catbreeds/models/cat_data_model.dart';
import 'package:catbreeds/ui/search/widgets/key_value_data_widget.dart';
import 'package:flutter/material.dart';

//Card for show a resume of other cat.
class CardCat extends StatelessWidget {
  final CatData catData;
  const CardCat({Key? key, required this.catData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              catData.name,
              style: TextStyle(),
            ),
            Row(
              children: [
                //Maker that the with cat image 1/2 the withe card.
                Expanded(
                  flex: 1,
                  child: Image.network(
                    catData.image?.url ?? '',
                    errorBuilder: (context, object, stack) {
                      return Container();
                    },
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        KeyValueDataWidget(
                          name: 'Age (Years)',
                          value: catData.lifeSpan,
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
