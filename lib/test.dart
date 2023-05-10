import 'package:flutter/cupertino.dart';
import 'package:tweelve/screens/LoginPage.dart';
import 'package:tweelve/screens/creat_account.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginPage(onClickedSignUp: toggle)
          : CreatAccount(onClickedSignIn: toggle);
  void toggle() => setState(() => isLogin = !isLogin);
}
