import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_app/core/constants.dart';
import 'package:football_app/core/reusable_commponants/custom_snack_bar.dart';
import 'package:football_app/core/reusable_commponants/custom_textfiled.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/presentation/layouts/home/home_view.dart';
import 'package:football_app/presentation/layouts/onboarding/onboarding_view.dart';
import 'package:football_app/presentation/layouts/register/view_model/cubit/register_cubit.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = "/RegisterView";
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool obscurePass = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushNamed(context, HomeView.routeName);
          CustomSnackBar.showOverlaySnackBar(
              context: context, message: "Register Success", positive: true);
        }
        if (state is RegisterFailedState) {
          CustomSnackBar.showOverlaySnackBar(
              context: context, message: state.error, positive: false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Welcome",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    CustomTextfiled(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "this filed don`t must is empty";
                        }
                        if (value.length > 30) {
                          return "bigger name!";
                        }
                        return null;
                      },
                      keyboard: TextInputType.emailAddress,
                      controller: nameController,
                      prefixIcon: SvgPicture.asset(
                        AssetsManager.assetsIconsProfile,
                        color: Colors.grey,
                        fit: BoxFit.contain,
                      ),
                      hintText: "Name",
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
                          return "must be 8 char or more";
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
                      height: screenHeight * 0.04,
                    ),
                    CustomTextfiled(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "this filed don`t must is empty";
                        }
                        if (value.length < 8) {
                          return "must be 8 char or more";
                        }
                        if (value != passwordController.text) {
                          return "don`t equal password";
                        }
                        return null;
                      },
                      keyboard: TextInputType.visiblePassword,
                      controller: confirmPasswordController,
                      prefixIcon: SvgPicture.asset(
                        AssetsManager.assetsIconsPassword,
                        fit: BoxFit.contain,
                      ),
                      hintText: "Confirm Password",
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
                          BlocProvider.of<RegisterCubit>(context).register(
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
                      child: state is RegisterLoadingState
                          ? const CircularProgressIndicator.adaptive()
                          : Text(
                              "register",
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
                          "you have account?",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, OnboardingView.routeName);
                          },
                          child: Text(
                            "Sign In",
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
        );
      },
    );
  }
}
