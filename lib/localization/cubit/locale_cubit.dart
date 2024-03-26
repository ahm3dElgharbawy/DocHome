import 'package:dochome/utils/helpers/locale_cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  void getSavedLocale() async{
    String langCode = await LocaleCacheHelper.getCachedLangCode();
    emit(ChangeLocaleState(locale: Locale(langCode)));
  }
  void changeLocale(String langCode) async {
    await LocaleCacheHelper.cacheLangCode(langCode);
    emit(ChangeLocaleState(locale: Locale(langCode)));
  }
}
