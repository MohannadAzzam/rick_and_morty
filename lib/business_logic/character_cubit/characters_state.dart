part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoading extends CharactersState {}

final class CharactersSuccess extends CharactersState {
  final Character character;

  CharactersSuccess(this.character);
}
final class CharactersError extends CharactersState {
  final String errorMessage;

  CharactersError(this.errorMessage);
}
