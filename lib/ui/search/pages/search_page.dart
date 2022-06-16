import 'package:catbreeds/models/cat_data_model.dart';
import 'package:catbreeds/services/repositoris/cat_data_repository.dart';
import 'package:catbreeds/ui/search/widgets/card_cat.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<CatData>>(
          future: CatDataRepository().getCatData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return CardCat(catData: snapshot.data![index]);
                },
              );
            }
            return Center(
                child: Column(
              children: [
                const CircularProgressIndicator(),
                Image.asset("assets/black_cat.png")
              ],
            ));
          },
        ),
      ),
    );
  }
}
