import 'package:flutter/material.dart';

import '../constants/assets.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            child: Image.asset(Assets.iconProfile),
          ),
        ),
      ],
    );
  }
}