/*
 * Open Window
 * https://blockly-demo.appspot.com/static/demos/blockfactory/index.html#tftws5
 */

Blockly.Blocks['openwindow'] = {
    init: function() {
        this.appendDummyInput()
            .appendField("open window")
            .appendField(new Blockly.FieldTextInput("calendar"), "windowtype");
        this.setPreviousStatement(true);
        this.setNextStatement(true);
        this.setColour(270);
        this.setTooltip('Opens a window in the game');
    }
};

/*
 * Player Online
 * https://blockly-demo.appspot.com/static/demos/blockfactory/index.html#dnkmvo
 */

Blockly.Blocks['playeronline'] = {
    init: function() {
        this.appendValueInput("username")
            .setCheck("String");
        this.appendDummyInput()
            .appendField("is online");
        this.setInputsInline(true);
        this.setOutput(true, "Boolean");
        this.setColour(270);
        this.setTooltip('Check if the given player is in the game at the moment');
    }
};

/*
 * Toast
 * https://blockly-demo.appspot.com/static/demos/blockfactory/index.html#y35xfb
 */

Blockly.Blocks['toast'] = {
    init: function() {
        this.appendValueInput("text")
            .setCheck("String")
            .setAlign(Blockly.ALIGN_RIGHT)
            .appendField("toast");
        this.appendDummyInput()
            .appendField("to you");
        this.setInputsInline(true);
        this.setPreviousStatement(true);
        this.setNextStatement(true);
        this.setColour(270);
        this.setTooltip('Add a message to your in-game notification panel');
        this.setHelpUrl('https://en.wikipedia.org/wiki/Pop-up_notification');
    }
};