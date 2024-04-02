# hello_flutter_pizza_app

learn flutter demo project，a full-stack flutter project with firebase .

# use package
> [Developing packages & plugins](https://docs.flutter.dev/packages-and-plugins/developing-packages)
```bash
flutter create --template=package pizza_repository
```

# use firebase
+ 1. set Authentication: 选择email/password
+ 2.add Firestore Database: 选择test mode 测试用

+ 3.Add Ios app
  在firebase项目`overview`点击`Add app`选择Ios:

需要`bundle id`, 查找`Bundler Identifier`：

在`ios\Runner.xcodeproj\project.pbxproj`文件中可以找到：`PRODUCT_BUNDLE_IDENTIFIER = com.example.pizzaApp;`

即 `bundle id` ——> `com.example.pizzaApp`

然后生成`GoogleService-Info.plist`下载放到`pizza_app\ios\Runner`目录即可。

> [将 Firebase 添加到您的 Apple 项目中 ](https://firebase.google.com/docs/ios/setup?hl=zh-cn)
>
>
+ 4.Add Android app

在firebase项目`overview`点击`Add app`选择Android:

需要`Android package name`:

在`android\app\build.gradle`文件中可以找到`applicationId "com.example.pizza_app"`，
即 `Android package name` ——> `com.example.pizza_app`

然后生成`google-services.json`下载放到`pizza_app\android\app`目录即可。

> [将 Firebase 添加到您的 Android 项目](https://firebase.google.com/docs/android/setup?hl=zh-cn)
>

调试发现在web中登录firebase正常运行，但是在 Android 调试登录会超时并失败，其实还需要【[对客户端进行身份验证](（https://developers.google.com/android/guides/client-auth?hl=zh-cn）)】（注意：国内登录firebase需要vpn）,
解决方案可以看这个[firebase login not working in flutter android app](https://stackoverflow.com/questions/55255516/firebase-login-not-working-in-flutter-android-app?rq=4)。

```bash
# windows查看 SHA certificate fingerprints 添加到 firebase Android settings 中。
keytool -v -list -keystore keystore
```

> 当然上述 package name 都是可以修改的，只供调试使用。


> 参考资料
> 
> 1.[将 Firebase 添加到您的 Flutter 应用](https://firebase.google.com/docs/flutter/setup?hl=zh-cn&platform=ios)
>
> 2.[Setting up Firebase for Flutter (Connecting Android, iOS, and Web) Flutter Firebase 2023](https://www.youtube.com/watch?v=YVB94s21jD8)
>
> 3.[firestore](https://console.firebase.google.com/project/pizza-app-91583/firestore)
>

# app 应用名和图标设置

> [Flutter修改应用名称及应用图标](https://juejin.cn/post/7220688635142455356)
