library Ilmenscript;

import "dart:html";
import "dart:js";
import "package:transmit/transmit.dart";

void main() {
  // Prevent right clicking (it breaks Blockly menus)
  querySelector("*").onContextMenu.listen((Event e) => e.preventDefault());

  new Service(["compiler_toast"], (String text) => toast(text));
}

void toast(String text) {
  print("TOAST: $text");
}