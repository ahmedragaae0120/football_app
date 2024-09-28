import 'dart:io';

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
        context.read<ProfileCubit>().getDataUser();
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
            "Cheek your internet connecions",
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
              Text(
                "#liverbool YNWA",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CustomListTile(
                title: "Name",
                subTitle: state.user?.name ?? "",
                icon: Icons.person,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomListTile(
                title: "Email",
                subTitle: state.user?.email ?? "",
                icon: Icons.email_rounded,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomListTile(
                title: "Favourite Team",
                subTitle: "Liverbool",
                icon: Icons.stadium_rounded,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: ProfileCubit.get(context).logOut,
                child: const CustomListTile(
                  title: "Logout",
                  subTitle: "Email",
                  icon: Icons.logout,
                ),
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
      setState(() {});
      ProfileCubit.get(context).uploadImage(context, image);
    }
  }

  // Future<void> uploadImage(context) async {
  //   try {
  //     FirebaseStorage storage = FirebaseStorage.instance;
  //     Reference ref = storage.ref().child(p.basename(image!.path));
  //     UploadTask storageUploadTask = ref.putFile(image!);
  //     TaskSnapshot taskSnapshot = storageUploadTask.snapshot;
  //     String url = await taskSnapshot.ref.getDownloadURL();
  //     String userid = SharedPreferencesHelper.getId();
  //     await FirestoreHelper.updateProfileImage(userId: userid, pathImage: url);
  //     log(url);
  //     log(userid);
  //   } catch (error) {
  //     log(error.toString());
  //     CustomSnackBar.showOverlaySnackBar(
  //         context: context, message: error.toString(), positive: false);
  //   }
  // }
}
