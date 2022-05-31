import 'package:flutter/material.dart';

mixin CharacterNetwork {
  NetworkImage characterNetworkImage(String? path, String? ext) =>
      NetworkImage("$path.$ext");
}
