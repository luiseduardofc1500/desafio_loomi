// Controller com GetX para gerenciar o estado do ícone
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikeController extends GetxController {
  final Rx<IconData> currentIcon = Icons.favorite_border.obs;

  void setLike() {
    currentIcon.value = Icons.thumb_up;
  }

  void setDislike() {
    currentIcon.value = Icons.thumb_down;
  }
}
