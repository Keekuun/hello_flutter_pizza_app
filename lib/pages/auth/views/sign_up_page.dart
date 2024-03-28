import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter_pizza_app/components/my_text_field.dart';

import 'form_valid.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final pwdAgainController = TextEditingController();
  final nameController = TextEditingController();

  bool pwdVisible = false;
  bool pwdAgainVisible = false;
  IconData pwdIcon = CupertinoIcons.eye_fill;
  IconData pwdAgainIcon = CupertinoIcons.eye_fill;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  bool signUpRequired = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: MyTextField(
                  controller: nameController,
                  hintText: '用户名',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(CupertinoIcons.person_fill),
                  validator: checkNameValid
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: MyTextField(
                controller: emailController,
                hintText: '邮箱',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(CupertinoIcons.mail_solid),
                validator: checkEmailValid,
              ),
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
                  onChanged: _handlePwdChange,
                  suffixIcon: IconButton(
                    onPressed: _handlePwdVisible,
                    icon: Icon(
                      pwdIcon,
                      color: Colors.black38,
                    ),
                  ),
                  validator: checkPwdValid),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "⚈ 1 uppercase",
                      style: TextStyle(
                        color:
                            containsUpperCase ? Colors.green : Colors.black38,
                      ),
                    ),
                    Text(
                      "⚈  1 lowercase",
                      style: TextStyle(
                        color:
                            containsLowerCase ? Colors.green : Colors.black38,
                      ),
                    ),
                    Text(
                      "⚈  1 number",
                      style: TextStyle(
                        color: containsNumber ? Colors.green : Colors.black38,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "⚈  1 special character",
                      style: TextStyle(
                        color:
                            containsSpecialChar ? Colors.green : Colors.black38,
                      ),
                    ),
                    Text(
                      "⚈  8 minimum character",
                      style: TextStyle(
                        color: contains8Length ? Colors.green : Colors.black38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: MyTextField(
                  controller: pwdAgainController,
                  hintText: '再次输入密码',
                  obscureText: pwdAgainVisible,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(CupertinoIcons.lock_fill),
                  suffixIcon: IconButton(
                    onPressed: _handlePwdAgainVisible,
                    icon: Icon(
                      pwdAgainIcon,
                      color: Colors.black38,
                    ),
                  ),
                  validator: (val) => checkPwdAgainValid(val, pwdController.text)),
            ),
            const SizedBox(height: 10),
            !signUpRequired
                ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextButton(
                  onPressed: _handleSignUp,
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
                      '注册',
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
        ));
  }

  String? _handlePwdChange(String? val) {
    setState(() {
      containsUpperCase = val!.contains(RegExp(r'[A-Z]'));
      containsLowerCase = val.contains(RegExp(r'[a-z]'));
      containsNumber = val.contains(RegExp(r'[0-9]'));
      containsSpecialChar =
          val.contains(RegExp(r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])'));
      contains8Length = val.length >= 8;
    });
    return null;
  }

  void _handlePwdVisible() {
    setState(() {
      pwdVisible = !pwdVisible;
      pwdIcon =
      pwdVisible ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill;
    });
  }

  void _handlePwdAgainVisible() {
    setState(() {
      pwdAgainVisible = !pwdAgainVisible;
      pwdAgainIcon =
      pwdAgainVisible ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill;
    });
  }

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      log('emailController ${emailController.text}');
      log('pwdController ${pwdController.text}');
      setState(() {
        signUpRequired = false;
      });
    }
  }
}
