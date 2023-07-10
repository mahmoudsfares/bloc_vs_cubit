import 'package:bloc_vs_cubit/business_logic/bloc.dart';
import 'package:bloc_vs_cubit/business_logic/state.dart';
import 'package:bloc_vs_cubit/ui/fragments/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Search'),),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const MySearchBar(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<MyBloc, MySearchState>(
                  builder: (context, state) {
                    if(state is SearchStateLoading){
                      return const CircularProgressIndicator();
                    }
                    else if(state is SearchStateEmpty){
                      return const Text('OK');
                    }
                    else {
                      return Container();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
