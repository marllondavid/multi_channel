import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:multi_channel/src/app_widget.dart';

void main() {
  setUrlStrategy(PathUrlStrategy()); //RETIRA O # DA ROTA DAS PÁGINAS
  runApp(const AppWidget());
}
