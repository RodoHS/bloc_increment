import 'package:flutter/material.dart';
import 'blocs/home_bloc.dart';
import 'blocs/home_bloc_provider.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeBlocProvider(
      homeBloc: HomeBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TrailerShare',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Home(),
      ),
    );
  }
}