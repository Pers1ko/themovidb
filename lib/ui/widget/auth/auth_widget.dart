import 'package:flutter/material.dart';
import 'package:themoviedb/ui/Theme/button_style.dart';
import 'package:themoviedb/ui/widget/auth/auth_model.dart';


class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => __AuthWidgetState();
}

class __AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to your account",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          HeaderWidget(),
          ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25,),
          const FormWidget(),
          const SizedBox(height: 25,),
          const Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
            style: textStyle,),
            const SizedBox(height: 5,),
            TextButton(
              style: AppButtonStyle.linkButton,  
              onPressed: () {}, child: const Text('Register')),
          const SizedBox(height: 25,),
          const Text(
            "If you signed up but didn't get your verification email.",
            style: textStyle,),
            const SizedBox(height: 5,),
            TextButton(
            style: AppButtonStyle.linkButton,  
            onPressed: () {}, child: const Text('Verification email')),
        ],
      ),
    );
  }
}

class FormWidget extends StatelessWidget {

  
  const FormWidget({super.key});

    @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<AuthModel>(context);
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
      );
    const textFieldDocaration = InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10,
            vertical: 10),
            isCollapsed: true,
            fillColor: Colors.red,
            focusColor: Colors.red,
            hoverColor: Colors.red);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMessageWidget(),
        const Text(
        'Username',
        style: textStyle,),
        const SizedBox(height: 5,),
        TextField(
          controller: model?.loginTextController,
          decoration: textFieldDocaration,
          ),
        const SizedBox(height: 20,),
        const Text(
        'Password',
        style: textStyle,),
        const SizedBox(height: 5,),
        TextField(
          controller: model?.passwordTextController,
          decoration: textFieldDocaration,
          obscureText: true,
          ),
          const SizedBox(height: 25,),
          Row(
            children: [
              const _AuthButtonWidget(),
              const SizedBox(width: 15,),
              TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)
                ),
                overlayColor: MaterialStateProperty.all(const Color.fromARGB(76, 109, 216, 245)),
                shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                      )
                    ),
              ),
              child: const Text('Reset password')),
            ],
            )
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AuthModel>(context);
    final onPressed = model?.canStartAyth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true ? const SizedBox(width: 15, height: 15, child: CircularProgressIndicator(strokeWidth: 2,)): const Text('Login');
    return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor:MaterialStateProperty.all(const Color(0xFF01B4E4)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7)
            )
          )
          ),      
    child: child,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget();

  @override
  Widget build(BuildContext context) {
    final errorMessage = NotifierProvider.watch<AuthModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(errorMessage,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.red,
          )
          ),
    );
  }
}