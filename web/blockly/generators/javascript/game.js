Blockly.JavaScript['toast'] = function(block) {
    var value_text = Blockly.JavaScript.valueToCode(block, 'text', Blockly.JavaScript.ORDER_ATOMIC);
    //return 'transmit("ilmenscript_toast", "' + value_text + '");\n';
    return 'window.parent.postMessage("ilmenscript_toast");\n';
};

Blockly.JavaScript['jump'] = function(block) {
    return 'transmit("ilmenscript_jump");\n';
};

Blockly.JavaScript['walk'] = function(block) {
    var dropdown_direction = block.getFieldValue('direction');
    var value_length = Blockly.JavaScript.valueToCode(block, 'length', Blockly.JavaScript.ORDER_ATOMIC);
    if (value_length == '') {
        return 'transmit("ilmenscript_walk' + dropdown_direction + '", 1);\n';
    }
    return 'transmit("ilmenscript_walk' + dropdown_direction + '", ' + value_length + ');\n';
};