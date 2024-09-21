import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_app/core/constants.dart';
import 'package:football_app/core/reusable_commponants/custom_snack_bar.dart';
import 'package:football_app/core/reusable_commponants/custom_textfiled.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/presentation/layouts/home/home_view.dart';
import 'package:football_app/presentation/layouts/login/view_model/cubit/login_cubit.dart';
import 'package:football_app/presentation/layouts/register/register_view.dart';

class LoginSheetView extends StatefulWidget {
  final GlobalKey<ScaffoldState> mainContext;
  const LoginSheetView({super.key, required this.mainContext});

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

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushNamed(context, HomeView.routeName);
          CustomSnackBar.showOverlaySnackBar(
              context: context, message: "Login Success", positive: true);
        }
        if (state is LoginFailedState) {
          CustomSnackBar.showOverlaySnackBar(
              context: context, message: state.error, positive: false);
        }
      },
      builder: (context, state) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
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
                      if (formKey.currentState?.validate() ?? false) {
                        BlocProvider.of<LoginCubit>(context).login(
                            emailController.text, passwordController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(16),
                        right: Radius.circular(16),
                      )),
                      fixedSize: const Size(199, 63),
                    ),
                    child: state is LoginLoadingState
                        ? const CircularProgressIndicator.adaptive()
                        : Text(
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
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterView.routeName);
                        },
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
        ),
      ),
    );
  }
}
