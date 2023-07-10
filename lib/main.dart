import 'package:bloc_vs_cubit/business_logic/bloc.dart';
import 'package:bloc_vs_cubit/business_logic/repo.dart';
import 'package:bloc_vs_cubit/ui/my_screen.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => MyBloc(repo: MyRepo()),
        child: const MaterialApp(
          home: MyScreen(),
        ),
      ),
    );
  }
}
