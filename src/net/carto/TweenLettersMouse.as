package net.carto {
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	
	import gs.*;
	import gs.easing.*;
	
	import net.carto.*;
	
	
	
	
	
	public class TweenLettersMouse extends Sprite  {
		
				
		private var objet1:PuzzleCarte;
		private var objet2:PuzzleCarte;
		private var a_lettersTextfieldTemp:Array;
		
		private var tableauMyGroup:Array = new Array();
		public var myGroup:TweenGroup = new TweenGroup();
		
		
		public function TweenLettersMouse(_objet1, _a_lettersTextfield) {
						
			objet1 = _objet1;
			a_lettersTextfieldTemp = _a_lettersTextfield;
			myGroup.align = TweenGroup.ALIGN_NONE;
			myGroup.loop = 0;
			trace(this);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, tweenLettersMouse);
			
		
		}
		
		public function tweenLettersMouse(pEvt:Event):void {
			
			
			trace(mouseX);
			trace(mouseY);

			//myGroup.clear();
			
			myGroup.push( new TweenLite(a_lettersTextfieldTemp[0], 1, {x:mouseX, y:mouseY, alpha:0.7, ease:Back.easeInOut}));	
			

		
			
		/*
			if (myGroup.length <= a_lettersTextfield.length) {
				
				for (var i:int = 0; i<a_lettersTextfield.length; i++) {
										
					myGroup.push( new TweenLite(a_lettersTextfield[i], 1+(i*0.5), {x:mouseX, y:mouseY, alpha:0.7, ease:Back.easeInOut}));	
					
				}
				
				
			} else {

				myGroup.clear();
				for (i = 0; i<a_lettersTextfield.length; i++) {
					a_lettersTextfield[i].x = objet1.x;
					a_lettersTextfield[i].y = objet1.y;
					myGroup.push( new TweenLite(a_lettersTextfield[i], 1+(i*0.5), {x:mouseX, y:mouseY, alpha:0.7, ease:Back.easeInOut}));	
				}				
			}
			*/
		}



	}
}
