import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_app/presentation/layouts/home/tabs/profile_tab/view_model/cubit/profile_cubit.dart';

class CustomListTile extends StatefulWidget {
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
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  final TextEditingController subTitleController = TextEditingController();

  bool _isButtonPressed = false;

  void _onButtonPressed() {
    setState(() {
      _isButtonPressed = true;
    });
    widget.isEditing && mounted
        ? ProfileCubit.get(context).editDataUser(
            textcontroller: subTitleController.text,
            edit: widget.title == "Email"
                ? SelectEdit.email.edit
                : widget.title == "Name"
                    ? SelectEdit.name.edit
                    : widget.title == "Favourite Team"
                        ? SelectEdit.favouriteTeam.edit
                        : SelectEdit.biography.edit,
            context: context)
        : widget.title == "Logout"
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
                            title: widget.title,
                            subTitle: widget.subTitle,
                            icon: widget.icon,
                            isEditing: true,
                          )),
                    ),
                  ),
                ),
              );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onButtonPressed,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          child: Icon(
            widget.icon,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: widget.isEditing
            ? TextField(
                controller: subTitleController,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18),
                decoration: InputDecoration(
                  hintText: widget.subTitle,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18),
                ),
              )
            : Text(
                widget.subTitle,
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
