import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension SizeExtension on Size {
  Size scaleFrom(BuildContext context, [Size? figmaFrameSize]) {
    final helper = DimensionsHelper.getInstance(context, figmaFrameSize);
    return Size(
      helper.scaleWidthFrom(
        figmaSize: this,
      ),
      helper.scaleHeightFrom(
        figmaSize: this,
      ),
    );
  }
}
