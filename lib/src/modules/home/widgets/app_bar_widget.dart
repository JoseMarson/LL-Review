import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "LocalLog",
              style: AppTheme.textStyles.logoTitle,
            ),
          ],
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(4.0),
        child: Divider(
          color: Color(0xFFD6D6D6),
          height: 1,
          thickness: 2,
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}
