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
        this.setTooltip('Adds a message to your toast panel');
    }
};

Blockly.JavaScript['toast'] = function(block) {
    var value_text = Blockly.JavaScript.valueToCode(block, 'text', Blockly.JavaScript.ORDER_ATOMIC);
    var code = 'alert(\'';
    code += value_text;
    code += '\');';
    return code;
};