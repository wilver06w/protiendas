import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/constant/protienda_ui.dart';
import 'package:protiendas/src/core/utils/constant/spacing.dart';

class SearchSeparated extends StatelessWidget {
  const SearchSeparated({
    super.key,
    required this.onChanged,
  });

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: const Border(
          left: BorderSide(
            color: ProTiendasUiColors.secondaryColor,
            width: 3,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: ProTiendaSpacing.md),
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: ProTiendasUiColors.secondaryColor,
        decoration: InputDecoration(
          hintStyle: GoogleFonts.lato(),
          hintText: ProTiendasUiValues.searchProtiendas,
        ),
      ),
    );
  }
}
