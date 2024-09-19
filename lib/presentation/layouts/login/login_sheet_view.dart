import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_app/core/constants.dart';
import 'package:football_app/core/reusable_commponants/custom_textfiled.dart';
import 'package:football_app/core/utils/assets_manager.dart';

class LoginSheetView extends StatefulWidget {
  const LoginSheetView({super.key});

  @override
  State<LoginSheetView> createState() => _LoginSheetViewState();
}

class _LoginSheetViewState extends State<LoginSheetView> {
  bool obscurePass = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40))),
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: keyboardHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(AssetsManager.assetsIconsLine),
              ),
              InkWell(
                onTap: () {
                  log(keyboardHeight.toString());
                },
                child: Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomTextfiled(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this filed don`t must is empty";
                  }
                  if (!RegExp(Constants.regexEmail).hasMatch(value)) {
                    return "valid Email";
                  }
                  return null;
                },
                keyboard: TextInputType.emailAddress,
                controller: emailController,
                prefixIcon: SvgPicture.asset(
                  AssetsManager.assetsIconsMessage,
                  fit: BoxFit.contain,
                ),
                hintText: "Email",
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              CustomTextfiled(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this filed don`t must is empty";
                  }
                  if (value.length < 8) {
                    return "valid Email";
                  }
                  return null;
                },
                keyboard: TextInputType.visiblePassword,
                controller: passwordController,
                prefixIcon: SvgPicture.asset(
                  AssetsManager.assetsIconsPassword,
                  fit: BoxFit.contain,
                ),
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: obscurePass
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility_outlined),
                  onPressed: () {
                    setState(() {
                      obscurePass = !obscurePass;
                    });
                  },
                ),
                obscureText: obscurePass,
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(16),
                    right: Radius.circular(16),
                  )),
                  fixedSize: const Size(199, 63),
                ),
                child: Text(
                  "Sign in",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have account?",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign UP",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
