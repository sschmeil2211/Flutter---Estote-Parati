import 'package:flutter/material.dart';

const BorderRadius rightRadius = BorderRadius.only(
  topRight: Radius.circular(50)
);

const BorderRadius leftRadius = BorderRadius.only(
  topLeft: Radius.circular(50)
);

const BorderRadius customSquare = BorderRadius.only(
  topLeft: Radius.circular(50),
  bottomLeft: Radius.circular(10),
  topRight: Radius.circular(10),
  bottomRight: Radius.circular(10),
);

const BorderRadius cornerRadius = BorderRadius.only(
  bottomLeft: Radius.circular(100),
  topRight: Radius.circular(10),
);