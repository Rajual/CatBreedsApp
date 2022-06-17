import 'package:catbreeds/models/cat_data_model.dart';
import 'package:catbreeds/ui/search/widgets/key_value_data_widget.dart';
import 'package:flutter/material.dart';

class CatDetailPage extends StatelessWidget {
  final CatData catData;
  const CatDetailPage({Key? key, required this.catData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(catData.name.toUpperCase()),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              elevation: 12,
              color: Colors.grey.shade50,
              child: Image.network(
                catData.image?.url ?? '',
                errorBuilder: (context, object, stack) {
                  return Container();
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    catData.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 23),
                  ),
                ),
                KeyValueDataWidget(
                    name: 'Life expectancy (Years)', value: catData.lifeSpan),
                KeyValueDataWidget(
                  name: 'Origin',
                  value: catData.origin,
                ),
                KeyValueDataWidget(
                  name: 'Intelligence',
                  value: catData.intelligence.toString(),
                ),
                KeyValueDataWidget(
                  name: 'Alt. Names',
                  value: catData.altNames ?? 'N/A',
                ),
                KeyValueDataWidget(
                  name: 'Temperament',
                  value: catData.temperament,
                ),
                KeyValueDataWidget(
                  name: 'More data',
                  value: catData.wikipediaUrl,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
