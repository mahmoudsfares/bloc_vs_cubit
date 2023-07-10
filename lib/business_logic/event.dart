import 'package:equatable/equatable.dart';

sealed class MyEvent extends Equatable {
  const MyEvent();
}

final class TextChanged extends MyEvent {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}