import 'package:catbreeds/blocs/search/search_bloc.dart';
import 'package:catbreeds/ui/search/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<SearchBloc>(create: (_) => SearchBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Catbreeds',
        home: SearchPage(),
      ),
    );
  }
}
