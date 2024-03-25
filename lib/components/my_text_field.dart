import 'dart:developer';

import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
	final TextEditingController controller;
  final String hintText;
  final bool obscureText;
	final TextInputType keyboardType;
	final Widget? suffixIcon;
	final VoidCallback? onTap;
	final Widget? prefixIcon;
	final String? Function(String?)? validator;
	final FocusNode? focusNode;
	final String? errorMsg;
	final String? Function(String?)? onChanged;

	const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
		required this.keyboardType,
		this.suffixIcon,
		this.onTap,
		this.prefixIcon,
		this.validator,
		this.focusNode,
		this.errorMsg,
		this.onChanged
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
	final FocusNode focusNode = FocusNode();

	bool _errorVisible = false;

	@override
	void initState() {
		super.initState();
		focusNode.addListener(_handleFocusChange);
	}

	@override
	void dispose() {
		focusNode.removeListener(_handleFocusChange);
		super.dispose();
	}

	void _handleFocusChange() {
		if (focusNode.hasFocus) {
			setState(() {
				_errorVisible = false;
			});
		} else {
			setState(() {
				_errorVisible = true;
			});
		}
	}

	void _onTap() {
		if(widget.onTap != null) {
			widget.onTap!();
		}
	}

	@override
	Widget build(BuildContext context) {
		return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.obscureText,
			keyboardType: widget.keyboardType,
			focusNode: widget.focusNode ?? focusNode,
			onTap: _onTap,
			autofocus: true,
			textInputAction: TextInputAction.next,
			onChanged: widget.onChanged,
      decoration: InputDecoration(
				suffixIcon: widget.suffixIcon,
				prefixIcon: widget.prefixIcon,
				enabledBorder: OutlineInputBorder(
					borderRadius: BorderRadius.circular(10),
					borderSide: const BorderSide(color: Colors.grey),
				),
				focusedBorder: OutlineInputBorder(
					borderRadius: BorderRadius.circular(20),
					borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
				),
				fillColor: Colors.grey.shade200,
				filled: true,
				hintText: widget.hintText,
				hintStyle: TextStyle(color: Colors.grey[500]),
				errorText: _errorVisible ? widget.errorMsg : null,
			),
    );
	}
}