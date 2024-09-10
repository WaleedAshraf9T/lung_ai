import 'package:flutter/material.dart';
import 'package:lung_ai/shared/theme_colors.dart';

var enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(
    color: fieldsBorder,
    width: 1.7,
    strokeAlign: BorderSide.strokeAlignInside,
  ),
);

var focousedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12.0),
  borderSide: const BorderSide(
    color: Colors.black38,
    width: 1.7,
    strokeAlign: BorderSide.strokeAlignInside,
  ),
);

var border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12.0),
  borderSide: const BorderSide(
    color: primaryColor,
    width: 1.6,
  ),
);
