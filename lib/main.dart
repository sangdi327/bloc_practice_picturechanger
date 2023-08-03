import 'package:cubitbloc_practice_picturechanger/bloc/picture_bloc.dart';
import 'package:cubitbloc_practice_picturechanger/repository/picture_repository.dart';
import 'package:cubitbloc_practice_picturechanger/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
        ),
        useMaterial3: true,
      ),
      home: RepositoryProvider(
        create: (context) => PictureRepository(),
        child: BlocProvider(
          create: (context) => PictureBloc(context.read<PictureRepository>()),
          child: const App(),
        ),
      ),
    );
  }
}
