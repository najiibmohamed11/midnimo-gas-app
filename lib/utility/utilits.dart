import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Color Kmost_used = Color(0xff4C9CE1);

Decoration KClickedContainersDocoration = BoxDecoration(
  color: Kmost_used,
  borderRadius: BorderRadius.circular(20.0),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.7), // Shadow color
      spreadRadius: 5, // Spread radius
      blurRadius: 7, // Blur radius
      offset: Offset(0, 3), // Offset in x and y direction
    ),
  ],
);
Decoration? KUnClickedContainersDocoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20.0),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.7), // Shadow color
      spreadRadius: 5, // Spread radius
      blurRadius: 7, // Blur radius
      offset: Offset(0, 3), // Offset in x and y direction
    ),
  ],
);
