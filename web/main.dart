library Ilmenscript;

import "dart:html";
import "package:transmit/transmit.dart";

main() {
  // Prevent right clicking (it breaks Blockly menus)
  document.onContextMenu.listen((Event e) => e.preventDefault());
}