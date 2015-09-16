part of Ilmenscript;

class Window {
  static bool is_open = false;
  static Element holder = querySelector("#windows");

  Element w;
  String message, code;

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
  static Element runBtn = querySelector("#run");
  static bool is_open = false;
  static Element w = querySelector("#save-window");
  static Element list;

  static List<Map<String, dynamic>> saves = [
    {
      "id": 51663626,
      "name": "My Awesome Program",
      "blocks": 15,
      "xml": ""
    },
    {
      "id": 543156955215,
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
  }

  static void close() {
    w.remove();
    is_open = false;
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
    runBtn.hidden = false;
  }

  static void closeSave(int save_id) {
    runBtn.hidden = true;
    new SaveWindow();
  }
}