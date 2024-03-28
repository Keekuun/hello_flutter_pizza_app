import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/my_text_field.dart';
import 'form_valid.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _errorMsg;
  IconData pwdIcon = CupertinoIcons.eye_fill;
  bool pwdVisible = true;

  bool signInRequired = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
                controller: emailController,
                hintText: '邮箱',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(CupertinoIcons.mail_solid),
                errorMsg: _errorMsg,
                validator: checkEmailValid),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
              controller: pwdController,
              hintText: '密码',
              obscureText: pwdVisible,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),
              errorMsg: _errorMsg,
              validator: checkPwdValid,
              suffixIcon: IconButton(
                onPressed: _handlePwdVisible,
                icon: Icon(
                  pwdIcon,
                  color: Colors.black38,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          !signInRequired
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextButton(
                      onPressed: _handleSignIn,
                      style: TextButton.styleFrom(
                          elevation: 3.0,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60))),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Text(
                          '登录',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                )
              : const CircularProgressIndicator()
        ],
      ),
    );
  }

  void _handlePwdVisible() {
    setState(() {
      pwdVisible = !pwdVisible;
      pwdIcon =
          pwdVisible ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill;
    });
  }

  void _handleSignIn() {
    Navigator.pushReplacementNamed(context, '/home');
    if (_formKey.currentState!.validate()) {
      log('emailController ${emailController.text}');
      log('pwdController ${pwdController.text}');
      setState(() {
        signInRequired = true;
      });
    }
  }
}
