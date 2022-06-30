import 'package:fixnit/base/base_view.dart';
import 'package:fixnit/screens/login/login_screen_m.dart';
import 'package:fixnit/screens/login/login_screen_vm.dart';
import 'package:fixnit/screens/ui_kit/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginScreen extends BaseView<LoginScreenViewmodel> {
  LoginScreen({Key? key}) : super(key: key);

  static const _spacer = SizedBox(height: 20);
  static const _avatarSize = 100.0;
  static const _invalidMessage = 'please fill this field';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenViewmodel, LoginScreenState>(
        bloc: viewModel,
        builder: (context, state) {
          final _usernameController = TextController(text: state.username);
          final _passwordController = TextController(text: state.password);
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHeader(),
                    _spacer,
                    _buildForm(
                      usernameController: _usernameController,
                      passwordController: _passwordController,
                      state: state,
                      context: context,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue[300],
      ),
      child: const FittedBox(
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      height: _avatarSize,
      width: _avatarSize,
    );
  }

  Widget _buildForm({
    required TextController usernameController,
    required TextController passwordController,
    required LoginScreenState state,
    required BuildContext context,
  }) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextInput(
            controller: usernameController,
            inputDecoration: const InputDecoration(hintText: 'email'),
            validator: (value) =>
                _validateField(input: usernameController.text),
            onChanged: (value) => viewModel.updateForm(username: value),
          ),
          _spacer,
          TextInput(
            controller: passwordController,
            inputDecoration: const InputDecoration(hintText: 'password'),
            obsecureText: true,
            onChanged: (value) => viewModel.updateForm(password: value),
            validator: (value) =>
                _validateField(input: passwordController.text),
          ),
          _spacer,
          _buildLoginButton(
            usernameController: usernameController,
            passwordController: passwordController,
            state: state,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton({
    required TextController usernameController,
    required TextController passwordController,
    required LoginScreenState state,
    required BuildContext context,
  }) {
    return state.isBusy
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final isLoginSuccessful = await viewModel.login(
                  username: usernameController.text,
                  password: passwordController.text,
                );
                if (isLoginSuccessful) {
                  _showSnackBar(
                      context: context, message: 'successfully logged in');
                } else {
                  _showSnackBar(
                    context: context,
                    message: 'failed to login',
                  );
                }
              }
            },
            child: const Text('login'),
          );
  }

  String? _validateField({required String input}) {
    return viewModel.isValid(input: input) ? null : _invalidMessage;
  }

  void _showSnackBar({required BuildContext context, required String message}) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
