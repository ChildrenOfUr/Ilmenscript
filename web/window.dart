part of Ilmenscript;

class Window {
  static bool is_open = false, initComplete = false;
  static Element holder = querySelector("#windows");

  Element w;
  String message, code;

  static void init() {
    if (initComplete) {
      throw new StateError("Window has already been initialized");
    }
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

    initComplete = true;
  }

  Window();

  Window.create(this.message, [this.code]) {
    if (is_open) {
      throw new StateError("A window is already open");
    }

    w = querySelector("#window-template").clone(true);
    w
      ..attributes.remove("id")
      ..querySelector(".message").text = message
      ..querySelector(".close").onClick.listen((_) => close());

    if (code != null) {
      w
        ..querySelector(".code").setInnerHtml(code.replaceAll("\n", "<br>"))
        ..classes.add("withcode");
    }

    holder.append(w);
    is_open = true;
  }

  void close() {
    w.remove();
    is_open = false;
  }
}

class SaveWindow {
  static Element trigger = querySelector("#saves");
  static bool is_open = false, initComplete = false;
  static Element w = querySelector("#save-window");
  static Element list;

  static void init() {
    if (initComplete) {
      throw new StateError("SaveWindow has already been initialized");
    }

    new Service(["ilmenscript_internal_saveswindow"], (_) => SaveWindow.open());
    transmit("ilmenscript_internal_saveswindow");

    initComplete = true;
  }

  static List<Map<String, dynamic>> saves = [
    {
      "id": 1,
      "name": "My Awesome Program",
      "blocks": 15,
      "xml": ""
    },
    {
      "id": 2,
      "name": "My (More) Awesome Program",
      "blocks": 0,
      "xml": ""
    }
  ];

  static void open() {
    if (is_open) {
      fill();
    }

    list = w.querySelector(".saves tbody");

    fill();

    Window.holder.append(w);

    is_open = true;

    toggleBlockly(false);
  }

  static void close() {
    w.remove();
    is_open = false;
    toggleBlockly(true);
  }

  static void fill() {
    list.children.clear();

    saves.forEach((Map saveData) {
      TableCellElement td_name = new TableCellElement()
        ..text = saveData["name"];

      TableCellElement td_blocks = new TableCellElement()
        ..text = saveData["blocks"].toString();

      ButtonElement open_save = new ButtonElement()
        ..classes.add("btn")
        ..setInnerHtml('<i class="fa fa-folder-open"></i> Open')
        ..onClick.first.then((_) => openSave(saveData["id"]));

      ButtonElement delete_save = new ButtonElement()
        ..classes.add("btn")
        ..title = "Delete (there is no undo!)"
        ..setInnerHtml('<i class="fa fa-trash"></i> Delete')
        ..onClick.first.then((_) => deleteSave(saveData["id"]));

      TableCellElement td_actions = new TableCellElement()
        ..classes.add("actions")
        ..append(open_save)
        ..appendText(" ")
        ..append(delete_save);

      TableRowElement tr = new TableRowElement()
        ..append(td_name)
        ..append(td_blocks)
        ..append(td_actions);

      list.append(tr);
    });
  }

  static void deleteSave(int save_id) {
    saves.removeWhere((Map<String, dynamic> save) => save["id"] == save_id);
    window.localStorage["saves"] = JSON.encode(saves);
    fill();
  }

  static void openSave(int save_id) {
    close();
  }

  static void closeSave(int save_id) {
    new SaveWindow();
  }
}

class NewProgramWindow {
  static bool is_open = false, initComplete = false;
  static Element w = querySelector("#new-program-window");

  static void init() {
    if (initComplete) {
      throw new StateError("NewProgramWindow has already been initialized");
    }

    SaveWindow.w.querySelector(".new-program").onClick.listen((_) {
      SaveWindow.close();
      open();
    });

    initComplete = true;
  }

  static void open() {
    if (is_open) {
      throw new StateError("A program is already being created");
    }

    w.hidden = false;

    is_open = true;
  }

  static void close() {
    w.hidden = true;
    is_open = false;
  }
}