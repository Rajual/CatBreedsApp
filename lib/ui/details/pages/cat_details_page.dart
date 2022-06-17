import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds/models/cat_data_model.dart';
import 'package:catbreeds/ui/search/widgets/key_value_data_widget.dart';
import 'package:flutter/material.dart';

class CatDetailPage extends StatelessWidget {
  final CatData catData;
  const CatDetailPage({Key? key, required this.catData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeText = 23.0;
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
              child: CachedNetworkImage(
                imageUrl: catData.image?.url ?? '',
                errorWidget: (context, string, dynamic) {
                  return Container();
                },
                progressIndicatorBuilder: (context, string, downloadProgress) {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Scrollbar(
              thickness: 10,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      catData.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 23),
                    ),
                  ),
                  KeyValueDataWidget(
                      size: sizeText,
                      name: 'Life expectancy (Years)',
                      value: catData.lifeSpan),
                  KeyValueDataWidget(
                    size: sizeText,
                    name: 'Origin',
                    value: catData.origin,
                  ),
                  KeyValueDataWidget(
                    size: sizeText,
                    name: 'Intelligence',
                    value: catData.intelligence.toString(),
                  ),
                  KeyValueDataWidget(
                    size: sizeText,
                    name: 'Alt. Names',
                    value: (catData.altNames == null)
                        ? 'N/A'
                        : (catData.altNames!.isEmpty
                            ? 'N/A'
                            : catData.altNames),
                  ),
                  KeyValueDataWidget(
                    size: sizeText,
                    name: 'Temperament',
                    value: catData.temperament,
                  ),
                  KeyValueDataWidget(
                    size: sizeText,
                    name: 'Adaptability',
                    value: catData.adaptability.toString(),
                  ),
                  KeyValueDataWidget(
                    size: sizeText,
                    name: 'More datas',
                    value: catData.wikipediaUrl,
                    isLink: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
