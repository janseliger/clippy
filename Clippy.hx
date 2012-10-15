import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.display.SimpleButton;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

class ButtonUp extends MovieClip { public function new() { super(); } }
    
class ButtonOver extends MovieClip { public function new() { super(); } }
    
class ButtonDown extends MovieClip { public function new() { super(); } }

class Clippy {
  // Main
  static function main() {
  
    // Extract the passed in params.
    var text:String = flash.Lib.current.loaderInfo.parameters.text;
    var copyMessage:String = flash.Lib.current.loaderInfo.parameters.copyMessage;
    var copyCompleteMessage:String = flash.Lib.current.loaderInfo.parameters.copyCompleteMessage;
    var font:String = flash.Lib.current.loaderInfo.parameters.font;
    var fontSize:String = flash.Lib.current.loaderInfo.parameters.fontSize;
    
    if (copyMessage == null || copyMessage.length == 0) {
        copyMessage = "copy text";
    }
    
    if (copyCompleteMessage == null || copyCompleteMessage.length == 0) {
        copyCompleteMessage = "copied.";
    }
    
	if (font == null || font.length == 0) {
        font = "Arial";
    }
    
    var fontSizeInt:Int = 10;
	if (fontSize != null && fontSize.length >= 0) {
        fontSizeInt = Std.parseInt(fontSize);
    }
    
    // Label for the message
    var label:TextField = new TextField();
    var format:TextFormat = new TextFormat(font, fontSizeInt);
    label.text = copyMessage;
    label.setTextFormat(format);
    label.textColor = 0x888888;
    label.selectable = false;
    label.x = 25;
    label.visible = false;
    flash.Lib.current.addChild(label);
    
    // Create the button.
    var button:SimpleButton = new SimpleButton();
    button.useHandCursor = true;
    button.upState = flash.Lib.attach("ButtonUp");
    button.overState = flash.Lib.attach("ButtonOver");
    button.downState = flash.Lib.attach("ButtonDown");
    button.hitTestState = flash.Lib.attach("ButtonDown");
    
    // Display the copy complete message on mouse up.
    button.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent) {
      flash.system.System.setClipboard(text);
      label.text = copyCompleteMessage;
      label.setTextFormat(format);
    });
    
    // Display the label on mouse over.
    button.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent) {
      label.visible = true;
    });
    
    // Display the copy message on mouse out.
    button.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent) {
      label.visible = false;
      label.text = copyMessage;
      label.setTextFormat(format);
    });
    
    flash.Lib.current.addChild(button);
  }
}