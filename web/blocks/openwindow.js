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
        this.setTooltip('');
        this.setHelpUrl('http://www.example.com/');
    }
};

Blockly.JavaScript['openwindow'] = function(block) {
    var text_windowtype = block.getFieldValue('windowtype');
    // TODO: Assemble JavaScript into code variable.
    var code = '...';
    return code;
};