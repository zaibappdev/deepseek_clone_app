import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onContact;

  const AppBarWidget({super.key, this.onBack, this.onContact});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      automaticallyImplyActions: false,
      centerTitle: true,

      // Leading Button
      leading: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onBack,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
                size: 18,
              ),
            ),
          ),
        ),
      ),

      // Action Text
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 22),
          child: InkWell(
            onTap: onContact,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: const Text(
              "Contact us",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
