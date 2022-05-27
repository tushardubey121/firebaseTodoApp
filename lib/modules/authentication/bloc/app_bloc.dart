import 'dart:async';
import 'dart:convert';

import 'package:firebase_todo_app/modules/authentication/models/user_model.dart';
import 'package:firebase_todo_app/services/authentication_service.dart';
import 'package:firebase_todo_app/utils/preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final Preference _pref = Preference();
  final AuthenticationService _service = AuthenticationService();

  AppBloc() : super(AppState.empty()) {
    on<UserStatus>(_onUserLoginStatus);
    on<LoginUser>(_onLoginUser);
  }

  FutureOr<void> _onUserLoginStatus(UserStatus event, Emitter<AppState> emit) async {
    await Future.delayed(const Duration(seconds: 2));


    bool status = _pref.getBool(_pref.isUserLogin,def: false);
    String userDetail = _pref.getString(_pref.userDetail,def: '');
    UserModel? _user;
    if(userDetail.isNotEmpty){
      _user = UserModel.fromJson(json.decode(userDetail));
    }
    emit(state.copyWith(isLogin: status,userDetail: _user,showButton: true));
  }

  FutureOr<void> _onLoginUser(LoginUser event, Emitter<AppState> emit) async {
    var response = await _service.loginUser();
    if(response.success){
      _pref.setString(_pref.userDetail, json.encode((response.data as UserModel).toJson()));
      _pref.setBool(_pref.isUserLogin, true);
      emit(state.copyWith(isLogin: true,userDetail: response.data,showButton: state.showButton));
    } else {
      emit(state.copyWith(isLogin: false,userDetail: null,error: response.error,showButton: state.showButton));
    }
  }
}
