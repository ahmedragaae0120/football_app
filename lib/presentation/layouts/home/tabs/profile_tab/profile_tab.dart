import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:football_app/presentation/layouts/home/tabs/profile_tab/view_model/cubit/profile_cubit.dart';
import 'package:football_app/presentation/layouts/home/tabs/profile_tab/widgets/custom_list_tile.dart';
import 'package:football_app/presentation/layouts/onboarding/onboarding_view.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  File? image;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (mounted) {
          context.read<ProfileCubit>().getDataUser();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      if (state is LogOutState) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          OnboardingView.routeName,
          (route) => false,
        );
      }
    }, builder: (context, state) {
      if (state is ProfileErrorState) {
        return Center(
          child: Text(
            state.error,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
      }
      if (state is ProfileSuccessState) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: image != null
                    ? FileImage(image!)
                    : NetworkImage(state.user?.profileImage ?? ""),
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 80,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () async {
                      await pickImage(context);
                    },
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context).colorScheme.onPrimary,
                      opticalSize: 20,
                      size: 40,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.user?.biography == ""
                        ? "add status"
                        : state.user?.biography ?? "",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Center(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Material(
                                        color: Colors.transparent,
                                        child: CustomListTile(
                                          title: "Biography",
                                          subTitle: state.user?.biography ?? "",
                                          icon: Icons.textsms,
                                          isEditing: true,
                                        )),
                                  ),
                                ),
                              ));
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              CustomListTile(
                title: "Name",
                subTitle: state.user?.name ?? "",
                icon: Icons.person,
                isEditing: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomListTile(
                title: "Email",
                subTitle: "${state.user?.email}",
                icon: Icons.email_rounded,
                isEditing: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomListTile(
                title: "Favourite Team",
                subTitle: state.user?.favouriteTeam ?? "",
                icon: Icons.stadium_rounded,
                isEditing: false,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomListTile(
                title: "Logout",
                subTitle: "Email",
                icon: Icons.logout,
                isEditing: false,
              ),
            ],
          ),
        );
      }
      return const Center(child: CircularProgressIndicator.adaptive());
    });
  }

  Future<void> pickImage(context) async {
    final ImagePicker picker = ImagePicker();
    var imagePick = await picker.pickImage(source: ImageSource.gallery);
    if (imagePick != null) {
      image = File(imagePick.path);
      if (mounted) {
        // تحقق من أن الـ widget لا يزال موجودًا

        ProfileCubit.get(context).uploadImage(context, image);
        setState(() {});
      }
    }
  }

}
