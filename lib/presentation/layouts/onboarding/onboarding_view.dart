import 'package:flutter/material.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/presentation/layouts/login/login_sheet_view.dart';
import 'package:football_app/presentation/layouts/register/register_view.dart';

class OnboardingView extends StatelessWidget {
  static const String routeName = "/OnboardingView";
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    GlobalKey<ScaffoldState> scafoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scafoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AssetsManager.assetsImagesOnBoard)),
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                  "Dicover all about sport",
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 40),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  '''Search millions of jobs and get the inside scoop on companies.
Wait for what? Let’s get start it!''',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                // const Spacer(),
                SizedBox(
                  height: height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return LoginSheetView(
                              mainContext: scafoldKey,
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(16),
                            right: Radius.circular(16),
                          )),
                          fixedSize: const Size(199, 63)),
                      child: Text(
                        "Sign in",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterView.routeName);
                        },
                        child: Text(
                          "Sign Up",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 18),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
