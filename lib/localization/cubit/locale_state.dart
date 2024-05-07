part of 'locale_cubit.dart';

@immutable
sealed class LocaleState {}

final class LocaleInitial extends LocaleState {}

final class ChangeLocaleState extends LocaleState {
  final Locale locale;
  ChangeLocaleState({required this.locale});
}
