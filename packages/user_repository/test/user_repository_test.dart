import 'package:flutter_test/flutter_test.dart';

import 'package:user_repository/user_repository.dart';

void main() {
  test('adds one to input values', () {
    var userId = '123';
    var email = '123@qq.com';
    var name = 'Jeek';
    var hasActiveCart = false;
    final myUser = MyUser(
        userId: userId, email: email, name: name, hasActiveCart: hasActiveCart);
    expect(myUser.toString(), 'MyUser: 123, 123@qq.com, Jeek, false');
    expect(
        MyUser.empty,
        MyUser(
          userId: '',
          email: '',
          name: '',
          hasActiveCart: false,
        ));
  });
}
