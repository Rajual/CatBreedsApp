import 'package:catbreeds/blocs/search/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCatWidget extends StatelessWidget {
  const SearchCatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    textEditingController.addListener(() {
      BlocProvider.of<SearchBloc>(context, listen: false)
          .add(SetSearcEvent(textEditingController.text));
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textEditingController,
        decoration: _inputDecoration(),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return const InputDecoration(
        icon: Icon(Icons.search), hintText: 'Search a breed...');
  }
}
