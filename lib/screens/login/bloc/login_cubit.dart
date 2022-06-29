import 'package:bloc/bloc.dart';
import 'package:fixnit/screens/login/bloc/login_state.dart';
import 'package:fixnit/validations/email.dart';
import 'package:fixnit/validations/password.dart';
import 'package:formz/formz.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit(LoginState initialState) : super(const LoginState());



  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));




  }

}
