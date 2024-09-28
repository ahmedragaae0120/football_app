import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  const CustomListTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
