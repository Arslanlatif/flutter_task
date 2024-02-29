import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
          ),
        ),
        home: BlocProvider(
            create: (context) => PostBloc(client: http.Client()),
            child: const PostListScreen()));
  }
}
