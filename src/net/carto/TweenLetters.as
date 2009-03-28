package net.carto {
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	
	import gs.*;
	import gs.easing.*;
	
	import net.carto.*;
	
	
	
	
	
	public class TweenLetters extends Sprite  {
		
				
		private var objet1:PuzzleCarte;
		private var objet2:PuzzleCarte;
		private var a_lettersTextfield:Array;
		
		private var tableauMyGroup:Array = new Array();
		public var myGroup:TweenGroup = new TweenGroup();
		
		
		public function TweenLetters(_objet1, _objet2, _a_lettersTextfield) {
						
			objet1 = _objet1;
			objet2 = _objet2;
			a_lettersTextfield = _a_lettersTextfield;
			myGroup.align = TweenGroup.ALIGN_NONE;
			myGroup.loop = 0;
						
			tweenLetters();
			objet1.addEventListener(Event.ENTER_FRAME, testDrag);
			objet2.addEventListener(Event.ENTER_FRAME, testDrag);
			
		
		}
		
		private function tweenLetters():void {
			

			if (myGroup.length <= a_lettersTextfield.length) {
				
				for (var i:int = 0; i<a_lettersTextfield.length; i++) {
										
					myGroup.push( new TweenLite(a_lettersTextfield[i], 1+(i*0.5), {x:objet2.x, y:objet2.y, alpha:0.7, ease:Back.easeInOut}));	
					
				}
				
				
			} else {

				myGroup.clear();
				for (i = 0; i<a_lettersTextfield.length; i++) {
					a_lettersTextfield[i].x = objet1.x;
					a_lettersTextfield[i].y = objet1.y;
					myGroup.push( new TweenLite(a_lettersTextfield[i], 1+(i*0.5), {x:objet2.x, y:objet2.y, alpha:0.7, ease:Back.easeInOut}));	
				}				
			}
		}

		private function testDrag(evt:Event):void {

			var objet1Drag:Boolean = objet1.getDrag();
			var objet2Drag:Boolean = objet2.getDrag();

			
			if (objet1Drag == true || objet2Drag == true) {
				tweenLetters();
			}
		}

	}
}
