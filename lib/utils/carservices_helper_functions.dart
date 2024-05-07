import 'package:flutter/material.dart';

import '../generic_widgets/bottomSheets/post_category_bottom_sheet.dart';

class BottomModalsAndDialogs {
  static void selectPostCategoryBottomSheet(
      BuildContext context, String searchTxt) {
    showModalBottomSheet(
      elevation: 0.00,
      context: context,
      isDismissible: false,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      builder: (BuildContext context) {
        return PostCategoryBottomSheet(
          searchTxt: searchTxt,
        );
      },
    );
  }
}
