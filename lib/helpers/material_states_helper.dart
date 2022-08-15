import 'package:flutter/material.dart';

bool isHovered(Set<MaterialState> states) {
  return states.contains(MaterialState.hovered);
}

bool isDragged(Set<MaterialState> states) {
  return states.contains(MaterialState.dragged);
}
