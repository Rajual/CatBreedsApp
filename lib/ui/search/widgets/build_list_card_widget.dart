import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/search/search_bloc.dart';
import '../../../models/cat_data_model.dart';
import 'card_cat.dart';

class BuilderListCardWidget extends StatefulWidget {
  final List<CatData>? listCatData;
  const BuilderListCardWidget({
    Key? key,
    required this.listCatData,
  }) : super(key: key);

  @override
  State<BuilderListCardWidget> createState() => _BuilderListCardWidgetState();
}

class _BuilderListCardWidgetState extends State<BuilderListCardWidget> {
  List<CardCat> lisCardCat = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.listCatData?.forEach((element) {
      lisCardCat.add(CardCat(catData: element));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.listCatData == null) {
      return Container();
    }
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Expanded(
          child: ListView(
            children: lisCardCat
                .where((element) => element.catData.name
                    .toLowerCase()
                    .contains(state.name.toLowerCase()))
                .toList(),
          ),
        );
      },
    );
  }
}
