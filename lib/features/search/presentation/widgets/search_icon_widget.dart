import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/resources/assets_manager.dart';
import '../../../../core/utils/resources/color_manager.dart';

class SearchIconWidget extends StatelessWidget {
  const SearchIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SvgPicture.asset(
        AssetsManager.searchIcon,
        height: MediaQuery.of(context).size.height * 0.038,
        width: MediaQuery.of(context).size.width * 0.038,
        colorFilter: const ColorFilter.mode(
          ColorManager.brown, // The color you want to apply
          BlendMode.srcIn, // Blend mode to apply the color
        ),
      ),
    );
  }
}
