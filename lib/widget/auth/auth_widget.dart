import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/Button_style.dart';


class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => __AuthWidgetState();
}

class __AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login to your account",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          HeaderWidget(),
          ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25,),
          FormWidget(),
          SizedBox(height: 25,),
          Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
            style: textStyle,),
            SizedBox(height: 5,),
            TextButton(
              style: AppButtonStyle.linkButton,  
              onPressed: () {}, child: Text('Register')),
          SizedBox(height: 25,),
          Text(
            "If you signed up but didn't get your verification email.",
            style: textStyle,),
            SizedBox(height: 5,),
            TextButton(
            style: AppButtonStyle.linkButton,  
            onPressed: () {}, child: Text('Verification email')),
        ],
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _loginTextController = TextEditingController(text: 'f');
  final _passwordTextController = TextEditingController(text: 'f');
  String? errorText = null;
  void _auth(){
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'f' && password == 'f') {
      errorText = null;

      //Navigator.of(context).pushReplacementNamed('/main_screen');
      Navigator.of(context).pushNamed('/main_screen');
    }


    else {
      errorText = 'Не верный логин или пароль';
      print('show error');
    }
    setState(() {});
  }

  void _resetPassword(){
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),);
    final textFieldDocaration = const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10,
            vertical: 10),
            isCollapsed: true);
  final color = const Color(0xFF01B4E4);
  final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
        Text(errorText,
        style: TextStyle(
          fontSize: 17,
          color: Colors.red,
        )
        ),
        SizedBox(height: 20,),
      ],
        Text(
        'Username',
        style: textStyle,),
        SizedBox(height: 5,),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDocaration,
          ),
        SizedBox(height: 20,),
        Text(
        'Password',
        style: textStyle,),
        SizedBox(height: 5,),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDocaration,
          obscureText: true,
          ),
          SizedBox(height: 25,),
          Row(
            children: [
              TextButton(
              onPressed: _auth, 
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all(const Color(0xFF01B4E4)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w700)
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                      )
                    )
                    ),
                    
              child: Text('Login')),
              SizedBox(width: 15,),
              TextButton(
              onPressed: _resetPassword,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(color),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400)
                ),
                overlayColor: MaterialStateProperty.all(Color.fromARGB(76, 109, 216, 245)),
                shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                      )
                    ),
              ),
              child: Text('Reset password')),
            ],
            )
      ],
    );
  }
}