import 'package:bloc_vs_cubit/business_logic/bloc.dart';
import 'package:bloc_vs_cubit/business_logic/repo.dart';
import 'package:bloc_vs_cubit/ui/my_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

//TODO: uncomment this to use bloc

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => MyBloc(repo: MyRepo()),
//         child: const MaterialApp(
//           home: MyScreen(),
//         ),
//       ),
//     );
//   }
// }


//TODO: uncomment this to use cubit

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => MyCubit(repo: MyRepo()),
        child: const MaterialApp(
          home: MyScreen(),
        ),
      ),
    );
  }
}
