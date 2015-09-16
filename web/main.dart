library Ilmenscript;

import "dart:convert";
import "dart:html";
import "package:transmit/transmit.dart";

part "window.dart";

main() {
  // Prevent right clicking (it breaks Blockly menus)
  document.onContextMenu.listen((Event e) => e.preventDefault());

  // Saved programs window
  new Service(["ilmenscript_internal_saveswindow"], (_) => SaveWindow.open());
  transmit("ilmenscript_internal_saveswindow");

  // Other windows
  new Service(["ilmenscript_internal_window"], (List<String> args) {
    if (args[0] == "_error") {
      // Code error window
      String errorText = "There was an error running your code!\n\n"
      "Please check it for: "
      "typing errors (using one type of data when you need another), "
      "infinite loops (no condition for the loop to end), "
      "stray code (code you forgot to remove or blocks that are not connected to anything else), "
      "and empty required variable slots, then try to run it again."
      "If you need help, let us know! The code you tried to run is shown to the right.";
      new Window.create(errorText, args[1]);
    } else {
      // General notification window
      new Window.create(args[0], args[1]);
    }
  });
}