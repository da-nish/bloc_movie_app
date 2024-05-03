import 'package:flutter/material.dart';
import 'package:wework_app/app/core/theme/app_colors.dart';

class SearchField extends StatelessWidget {
  final Function(String) onSearch;
  SearchField({super.key, required this.onSearch});

  TextEditingController txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txt,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {
        // txt.text = value;
        onSearch(value);
      },
      decoration: InputDecoration(
        hintText: 'Search Movies by name...',
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.gray01,
        ),
        fillColor: AppColors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    );
  }
}
