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

/*
 * Jump
 * https://blockly-demo.appspot.com/static/demos/blockfactory/index.html#nkvapd
 */

Blockly.Blocks['jump'] = {
    init: function() {
        this.appendDummyInput()
            .appendField("jump");
        this.setPreviousStatement(true);
        this.setNextStatement(true);
        this.setColour(160);
        this.setTooltip('Jumps once (triple jumps will still happen if you jump 3 times fast enough)');
    }
};

/*
 * Username color
 * https://blockly-demo.appspot.com/static/demos/blockfactory/index.html#uuhasb
 */

//Blockly.Blocks['getusernamecolor'] = {
//    init: function() {
//        this.appendValueInput("username")
//            .setCheck("String")
//            .appendField("get color of username");
//        this.setInputsInline(true);
//        this.setOutput(true, "color");
//        this.setColour(290);
//        this.setTooltip('');
//        this.setHelpUrl('http://www.example.com/');
//    }
//};

/*
 * Walk
 * https://blockly-demo.appspot.com/static/demos/blockfactory/index.html#ztvoko
 */

Blockly.Blocks['walk'] = {
    init: function() {
        this.appendDummyInput()
            .appendField("walk in direction")
            .appendField(new Blockly.FieldDropdown([["left", "left"], ["right", "right"]]), "direction");
        this.appendValueInput("length")
            .setCheck("Number")
            .appendField("for this many seconds");
        this.setPreviousStatement(true);
        this.setNextStatement(true);
        this.setColour(160);
        this.setTooltip('Moves your character in the specified direction for the specified number of seconds');
    }
};