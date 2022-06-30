import 'package:fixnit/base/base_viewmodel.dart';
import 'package:fixnit/screens/login/login_screen_m.dart';
import 'package:fixnit/services/navigation/navigation_service.dart';
import 'package:fixnit/services/network/network_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';



@injectable
class LoginScreenViewmodel extends BaseViewmodel<LoginScreenState> {
  LoginScreenViewmodel({
    required INavigationService navigationService,
    required INetworkService networkService,
  })  : _navigationService = navigationService,
        _networkService = networkService,
        super(
          const Initialize(
            username: '',
            password: '',
            isBusy: false,
          ),
        );

  final INavigationService _navigationService;
  final INetworkService _networkService;

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      emit(state.copyWith(isBusy: true));
      await _networkService
          .post(path: 'https://rest.inteldev.exto360.com/auth/login', data: {
        'username': username,
        'password': password,
      });
      emit(state.copyWith(isBusy: false));
      return true;
    } catch (error) {
      emit(state.copyWith(isBusy: false));
      debugPrint('failed: $error');
      return false;
    }
  }

  bool isValid({required String input}) => input.isNotEmpty;

  void updateForm({String? username, String? password}) => emit(state.copyWith(
        username: username ?? state.username,
        password: password ?? state.password,
      ));

  void navigateToHome() {
    // _navigationService.replaceNamed(path: path);
  }
}
