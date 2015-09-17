library Ilmenscript;

import "dart:convert";
import "dart:html";
import "package:transmit/transmit.dart";

part "window.dart";

Element progListBtn = querySelector("#saves");
Element runBtn = querySelector("#run");
Element helpBtn = querySelector("#help");

main() {
  // Prevent right clicking (it breaks Blockly menus)
  document.onContextMenu.listen((Event e) => e.preventDefault());
  // Saved programs window
  SaveWindow.init();
  // New program window
  NewProgramWindow.init();
  // Other windows
  Window.init();
}

void toggleBlockly(bool state) {
  if (state) {
    // Workspace enabled
    querySelector("#workspace").classes.remove("disabled");
    runBtn.hidden = false;
    progListBtn.hidden = false;
    helpBtn.classes.remove("only-child");
  } else {
    // Workspace disabled
    querySelector("#workspace").classes.add("disabled");
    runBtn.hidden = true;
    progListBtn.hidden = true;
    helpBtn.classes.add("only-child");
  }
}