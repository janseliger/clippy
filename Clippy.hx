import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.display.SimpleButton;

class ButtonUp extends MovieClip { public function new() { super(); } }
    
class ButtonOver extends MovieClip { public function new() { super(); } }
    
class ButtonDown extends MovieClip { public function new() { super(); } }

class Clippy {
    // Main
    static function main() {
        flash.Lib.current.text = flash.Lib.current.loaderInfo.parameters.text;

        // Create the button.
        var button:SimpleButton = new SimpleButton();
        button.useHandCursor = true;
        button.upState = flash.Lib.attach("ButtonUp");
        button.overState = flash.Lib.attach("ButtonOver");
        button.downState = flash.Lib.attach("ButtonDown");
        button.hitTestState = flash.Lib.attach("ButtonDown");
        
        // Display the copy complete message on mouse click.
        button.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
            flash.system.System.setClipboard(flash.Lib.current.text);
        });
        
        flash.Lib.current.addChild(button);
    }
}