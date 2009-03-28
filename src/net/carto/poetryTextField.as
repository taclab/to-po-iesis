package net.carto {
 
  import flash.text.TextField;
  import flash.text.TextFormat;
  import flash.text.TextFieldType;
  import flash.events.TextEvent;
  import flash.events.FocusEvent;
  import flash.events.KeyboardEvent;
  import flash.ui.Keyboard; 
  import flash.text.AntiAliasType;
 
  public dynamic class poetryTextField extends TextField
  {
    public var defaultText:String = '';
 
	public var letters:Array= new Array();
	public var phrase:String = new String();
	public var mots:Array= new Array();
	

 

    public function poetryTextField(defaultTextFormat:TextFormat=null, defaultText:String=null) {
      if (defaultTextFormat) {
        this.defaultTextFormat = defaultTextFormat;
      }
      if (defaultText) {
        this.defaultText = defaultText;
        this.text = defaultText;
      }
      this.type = TextFieldType.INPUT;
	  this.antiAliasType = AntiAliasType.ADVANCED;
	  addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
      addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
      addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
    }

	public function onKeyUp(event:KeyboardEvent):void
    {
      if (event.keyCode == Keyboard.ENTER) {
		phrase = text;
		mots = text.split(' ');
		
		for (var n:int = 0; n < mots.length; n++) {	
				letters[n] = mots[n].split('');
		}

		text = defaultText;
		stage.focus = null;
        
        }      
      if (event.keyCode == Keyboard.ESCAPE) {
        text = defaultText;
        stage.focus = null;
      }
    }
    
  
    private function onFocusIn(event:FocusEvent):void
    {
      if (text == defaultText) {
        text = '';
      }
    }
    private function onFocusOut(event:FocusEvent):void
    {
      if (text == '') {
        text = defaultText;
      }
    }


	//----- GET -----//

	public function getLetters(_n:int):Array {
		return letters[_n];
	}
	
	public function getMots():Array {
		return mots;
	}
	
	public function getPhrase():String {
		return phrase;
	}
  }
}
