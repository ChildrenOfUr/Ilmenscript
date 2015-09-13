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
        this.setTooltip('');
        this.setHelpUrl('http://www.example.com/');
    }
};

Blockly.JavaScript['playeronline'] = function(block) {
    var value_username = Blockly.JavaScript.valueToCode(block, 'username', Blockly.JavaScript.ORDER_ATOMIC);
    var code = value_username;
    return [code, Blockly.JavaScript.ORDER_NONE];
};