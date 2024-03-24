import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/my_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();

  String? _errorMsg;
  IconData pwdIcon = CupertinoIcons.eye_fill;
  bool pwdVisible = true;

  bool signInRequired = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            child: MyTextField(
                controller: emailController,
                hintText: '邮箱',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(CupertinoIcons.mail_solid),
                errorMsg: _errorMsg,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please fill in this field';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                      .hasMatch(val)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }),
          ),
          SizedBox(
            child: MyTextField(
              controller: pwdController,
              hintText: '密码',
              obscureText: pwdVisible,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),
              errorMsg: _errorMsg,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill in this field';
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                    .hasMatch(val)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    pwdVisible = !pwdVisible;

                    pwdIcon = pwdVisible
                        ? CupertinoIcons.eye_fill
                        : CupertinoIcons.eye_slash_fill;
                  });
                },
                icon: Icon(pwdIcon),
              ),
            ),
          ),
          !signInRequired
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextButton(
                      onPressed: () {},
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
}
