import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PageButton extends StatelessWidget {
  final String label;
  final String path;
  final String? currentPage;
  final IconData? icon;

  const PageButton(
      {Key? key, this.label = "", this.path = "", this.icon, this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        GoRouter.of(context).go(path);
      },
      selected: (currentPage == path),
      selectedTileColor:
          Theme.of(context).colorScheme.primary.withOpacity(0.15),
      // selectedColor: Theme.,
      title: Column(
        children: [
          if (icon != null) Icon(icon),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
