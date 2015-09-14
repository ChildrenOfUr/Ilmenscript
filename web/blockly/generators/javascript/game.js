Blockly.JavaScript['openwindow'] = function(block) {
    var text_windowtype = block.getFieldValue('windowtype');
    return 'transmit("ilmenscript_openwindow", ' + text_windowtype + ');';
};

Blockly.JavaScript['playeronline'] = function(block) {
    var value_username = Blockly.JavaScript.valueToCode(block, 'username', Blockly.JavaScript.ORDER_ATOMIC);
    var code = 'transmit("ilmenscript_playeronline", ' + value_username + ')';
    return [code, Blockly.JavaScript.ORDER_NONE];
};

Blockly.JavaScript['toast'] = function(block) {
    var value_text = Blockly.JavaScript.valueToCode(block, 'text', Blockly.JavaScript.ORDER_ATOMIC);
    return 'transmit("ilmenscript_toast", ' + value_text + ');';
};