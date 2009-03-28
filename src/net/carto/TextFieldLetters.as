package net.carto {
	
//	import flash.events.Event;
//	import flash.events.MouseEvent;
	import flash.display.*;
	import flash.text.*;
	
	import net.carto.*;			
	import gs.*
	
	public dynamic class TextFieldLetters    {
		
				

		// Génération de la police et de la mise en forme
		private var maPolice:Garamond = new Garamond();
		private var lettersForme:TextFormat = new TextFormat();
		private var objet1:PuzzleCarte;
		
		public var a_lettersTextfield_Class:Array = new Array();
		public var a_getLetters:Array = new Array();
		
		private var contenerLetters:Sprite = new Sprite();
		//this.addChild(contenerLetters);
		
		
		public function TextFieldLetters(_objet1, _a_getLetters) {
			
			objet1 = _objet1;
			a_getLetters = _a_getLetters;
			
		}

		
		public function transformText():Sprite {		

		for (var i:int = 0; i< a_getLetters.length; i++) {

				var oneLetter:TextField = new TextField();
				oneLetter.autoSize = TextFieldAutoSize.LEFT;
				oneLetter.embedFonts = true;

				lettersForme.font = maPolice.fontName;
				//lettersForme.size = 55;
				
				lettersForme.size = 60;
				lettersForme.color = 0xFFFFFF;

				oneLetter.defaultTextFormat = lettersForme;
				oneLetter.text = a_getLetters[i];
				oneLetter.x = objet1.x;
				oneLetter.y = objet1.y;
				
				contenerLetters.addChild(oneLetter);
				
				a_lettersTextfield_Class.push(oneLetter);
			}
			
			return contenerLetters;
			
			
		}

		
		public function getTextField():Array {
			return a_lettersTextfield_Class;
		}

	}
}
