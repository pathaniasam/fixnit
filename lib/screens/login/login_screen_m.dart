import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fixnit/base/base_state.dart';
part 'login_screen_m.freezed.dart';

@freezed
class LoginScreenState extends BaseState with _$LoginScreenState {
  const factory LoginScreenState.initialize({
    required String username,
    required String password,
    required bool isBusy,
  }) = Initialize;
}
