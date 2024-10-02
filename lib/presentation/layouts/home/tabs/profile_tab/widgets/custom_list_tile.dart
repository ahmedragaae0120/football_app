import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_app/presentation/layouts/home/tabs/profile_tab/view_model/cubit/profile_cubit.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final bool isEditing;
  const CustomListTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.isEditing});

  @override
  Widget build(BuildContext context) {
    final TextEditingController subTitleController = TextEditingController();
    return InkWell(
      onTap: () {
        isEditing
            ? ProfileCubit.get(context).editDataUser(
                textcontroller: subTitleController.text,
                edit: title == "Email"
                    ? SelectEdit.email.edit
                    : title == "Name"
                        ? SelectEdit.name.edit
                        : title == "Favourite Team"
                            ? SelectEdit.favouriteTeam.edit
                            : SelectEdit.biography.edit,
                context: context)
            : title == "Logout"
                ? ProfileCubit.get(context).logOut()
                : showDialog(
                    context: context,
                    builder: (context) => BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Center(
                        child: Container(
                          color: Colors.transparent,
                          child: Material(
                              color: Colors.transparent,
                              child: CustomListTile(
                                title: title,
                                subTitle: subTitle,
                                icon: icon,
                                isEditing: true,
                              )),
                        ),
                      ),
                    ),
                  );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: isEditing
            ? TextField(
                controller: subTitleController,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18),
                decoration: InputDecoration(
                  hintText: subTitle,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18),
                ),
              )
            : Text(
                subTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}

enum SelectEdit {
  name('name'),
  email('email'),
  biography('biography'),
  favouriteTeam('favouriteTeam');

  final String edit;
  const SelectEdit(this.edit);
}
