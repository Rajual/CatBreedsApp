import 'package:catbreeds/models/cat_data_model.dart';
import 'package:catbreeds/ui/details/pages/cat_details_page.dart';
import 'package:catbreeds/ui/search/widgets/key_value_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

//Card for show a resume of other cat.
class CardCat extends StatelessWidget {
  final CatData catData;
  const CardCat({Key? key, required this.catData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Card(
        color: Colors.grey.shade50,
        elevation: 20,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    catData.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    //Maker that the with cat image 1/2 the withe card.
                    Expanded(
                      flex: 1,
                      child: CachedNetworkImage(
                        imageUrl: catData.image?.url ?? '',
                        errorWidget: (context, string, dynamic) {
                          return Container();
                        },
                        progressIndicatorBuilder:
                            (context, string, downloadProgress) {
                          return Center(child: CircularProgressIndicator());
                        },
                      ) /*Image.network(
                        catData.image?.url ?? '',
                        errorBuilder: (context, object, stack) {
                          return Container();
                        },
                      )*/
                      ,
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              KeyValueDataWidget(
                                name: 'Life expectancy (Years)',
                                value: catData.lifeSpan,
                              ),
                              KeyValueDataWidget(
                                name: 'Origin',
                                value: catData.origin,
                              ),
                              KeyValueDataWidget(
                                name: 'Intelligence',
                                value: catData.intelligence.toString(),
                              ),
                            ],
                          ),
                        ))
                  ],
                )
              ],
            ),
            Positioned(
                top: 0,
                right: 2,
                child: Row(
                  children: [
                    // const Text('Ver mas...'),
                    IconButton(
                        tooltip: 'Aca para mas',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CatDetailPage(
                                        catData: catData,
                                      )));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_sharp)),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
