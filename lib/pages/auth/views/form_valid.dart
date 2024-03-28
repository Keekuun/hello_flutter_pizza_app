String? checkEmailValid(String? val) {
  if (val!.isEmpty) {
    return '请输入邮箱';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(val)) {
    return '您输入的邮箱不合法';
  }
  return null;
}

String? checkPwdValid(String? val) {
  if (val!.isEmpty) {
    return '请输入密码';
  } else if (!RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
      .hasMatch(val)) {
    return '您输入的密码不合法';
  }
  return null;
}

String? checkPwdAgainValid(String? val, String? pwd) {
  if (val!.isEmpty) {
    return '请再次输入密码';
  } else if (val != pwd) {
    return '两次密码不一致';
  }
  return null;
}

String? checkNameValid(String? val) {
  if (val!.isEmpty) {
    return '请输入用户名';
  } else if (val.length > 30) {
    return '您输入的用户名太长';
  }
  return null;
}
