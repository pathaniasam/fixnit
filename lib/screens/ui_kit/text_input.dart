import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    required TextController controller,
    required ValueChanged<String>? onChanged,
    required String? Function(String?)? validator,
    bool obsecureText = false,
    InputDecoration? inputDecoration,
    Key? key,
  })  : _onChanged = onChanged,
        _controller = controller,
        _validator = validator,
        _obscureText = obsecureText,
        _inputDecoration = inputDecoration,
        super(key: key);

  final ValueChanged<String>? _onChanged;
  final String? Function(String?)? _validator;
  final TextController _controller;
  final bool _obscureText;
  final InputDecoration? _inputDecoration;

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      onChanged: widget._onChanged,
      validator: widget._validator,
      decoration: widget._inputDecoration,
      obscureText: widget._obscureText,
    );
  }
}

class TextController extends TextEditingController {
  TextController({String? text}) {
    this.text = text;
  }

  @override
  set text(String? newText) {
    if (newText != null) {
      value = value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
        composing: TextRange.empty,
      );
    }
  }
}
