import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isVisible = false;

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: !_isVisible,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 20, left: 10),
          child: IconButton(
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            icon: Icon(_isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined),
            color: const Color(0xff8D8D8D),
          ),
        ),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _sigupText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SigninPage(),
              ));
            },
            child: const Text(
              'Sign In',
              style: TextStyle(color: Color(0xff288CE9)),
            ),
          )
        ],
      ),
    );
  }

  Widget _supportText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'If you need any support',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: context.isDarkMode ? const Color(0xffE1E1E1) : const Color(0xff383838),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Click Here',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: AppColors.primary,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      bottomNavigationBar: _sigupText(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            _supportText(context),
            const SizedBox(height: 30),
            _fullNameField(context),
            const SizedBox(height: 16),
            _emailField(context),
            const SizedBox(height: 16),
            _passwordField(context),
            const SizedBox(height: 33),
            BasicAppButton(onPressed: () {}, title: 'Create Account'),
          ],
        ),
      ),
    );
  }
}
