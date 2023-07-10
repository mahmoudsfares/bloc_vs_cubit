import 'package:bloc_vs_cubit/business_logic/bloc.dart';
import 'package:bloc_vs_cubit/business_logic/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  final _textController = TextEditingController();
  late MyBloc _myBloc;

  @override
  void initState() {
    super.initState();
    _myBloc = context.read<MyBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      autocorrect: false,
      onChanged: (text) {
        _myBloc.add(TextChanged(text: text));
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: GestureDetector(
          onTap: _onClearTapped,
          child: const Icon(Icons.clear),
        ),
        border: const OutlineInputBorder(),
        hintText: 'Search...',
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = '';
    _myBloc.add(const TextChanged(text: ''));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}