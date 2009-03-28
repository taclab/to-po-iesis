package net.carto {
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.*;
	import flash.geom.Point;
	
	import com.google.maps.LatLng;
	import com.google.maps.Map;
	import com.google.maps.MapEvent;
	import com.google.maps.MapType;
	
	import gs.*;
	import gs.easing.*;
	
	
	
	public class PuzzleCarte extends Sprite  {
		
		private var map:Map = new Map();
		private var mapWidth:int;
		private var mapHeight:int;
		private var mapCenter:LatLng;
		private var mapLat:Number;
		private var mapLng:Number;
		
		private var mapType:String;
		
		private var contenerPuzzle:MovieClip = new MovieClip();
		
		//--- Inertia ---//
		private var _x:Number;
		private var _y:Number;
		private var _xSpeed:Number;
		private var _ySpeed:Number;
		private var _decel:Number = .95;
		private var _ratio:Number = .1;
		private var _drag:Boolean;
		
		private var masque_A:masqueA;
		private var masque_B:masqueB;
		private var masque_C:masqueC;
		private var masque_D:masqueD;
		private var masque_E:masqueE;
		
				
			
		public function PuzzleCarte(_mapWidth, _mapHeight, _latCenter, _lngCenter, _mapType) {
			
			mapWidth = _mapWidth;
			mapHeight = _mapHeight;
			mapLat = _latCenter;
			mapLng = _lngCenter;
			
		  	mapCenter = new LatLng(mapLat, mapLng);
			mapType = _mapType;
			
		//	map.key = "ABQIAAAADxpuqR-LQLc4sXcav5V5sBSvzLFakHBJlTzyQZR0__BvaqtM_xR_s1IevK8xh-IypaDybDihAA_HHQ";
			map.key = "ABQIAAAADxpuqR-LQLc4sXcav5V5sBTM4C8FdT4kAeduS5xfAYbshYj6mhSiEMxR9OQrhXvQXKJ2v8PJSTvlWw";			
			map.setSize(new Point(mapWidth, mapHeight));
			map.addEventListener(MapEvent.MAP_READY, onMapReady);
			
			addEventListener (Event.ENTER_FRAME,inertia);
			contenerPuzzle.addChild(map);
		
		}
		
		private function onMapReady(ev:Event):void {
			if (mapType == "normal") {
				map.setCenter(mapCenter, 14, MapType.NORMAL_MAP_TYPE);
			}
			if (mapType == "satellite") {
				map.setCenter(mapCenter, 14, MapType.SATELLITE_MAP_TYPE);
			}
			if (mapType == "physical") {
				map.setCenter(mapCenter, 14, MapType.PHYSICAL_MAP_TYPE);
			}
			if (mapType == "hybrid") {
				map.setCenter(mapCenter, 14, MapType.HYBRID_MAP_TYPE);
			}
			
	  	} 
	
		public function drawMask(_numMask):void {
						
			var numMask:String = _numMask;
			
			map.x = 10-map.width/2;
			map.y = 10-map.height/2;
			
			if (numMask == "A"){
				
				
				var newContour_A:Sprite = new Sprite();
				newContour_A.graphics.lineStyle(5, 0xFFFFFF);
				newContour_A.graphics.drawRect(0, 0, 163, 317.8);
				newContour_A.alpha = 0.6;
				newContour_A.x = -81.5+10;
				newContour_A.y = -158.9+10;
				addChild(newContour_A);
				
				
				masque_A = new masqueA();
				masque_A.x = 10;
				masque_A.y = 10;

				contenerPuzzle.mask = masque_A;
				
				contenerPuzzle.contour = newContour_A;
				contenerPuzzle.contourWidth = 163;
				contenerPuzzle.contourHeight = 317.8;
				contenerPuzzle.contourX= -81.5+10;
				contenerPuzzle.contourY = -158.9+10;

				//contenerPuzzle.addChild(contour_A);
				contenerPuzzle.addChild(newContour_A);
				contenerPuzzle.addChild(masque_A);

				this.addChild(contenerPuzzle);

				// drag and drop
				newContour_A.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_UP, dropIt);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_OVER, bigContour);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_OUT, petitContour);
			}
			
			if (numMask == "B"){
				
				var newContour_B:Sprite = new Sprite();
				newContour_B.graphics.lineStyle(5, 0xFFFFFF);
				newContour_B.graphics.drawRect(0, 0, 100, 326);
				newContour_B.alpha = 0.6;
				newContour_B.x = -50+10;
				newContour_B.y = -163.1+10;
				addChild(newContour_B);
				
				
				masque_B = new masqueB();
				masque_B.x = 10;
				masque_B.y = 10;

				contenerPuzzle.mask = masque_B;
				
				contenerPuzzle.contour = newContour_B;
				contenerPuzzle.contourWidth = 100;
				contenerPuzzle.contourHeight = 326;
				contenerPuzzle.contourX= -50+10;
				contenerPuzzle.contourY = -163.1+10;
				

				contenerPuzzle.addChild(newContour_B);
				contenerPuzzle.addChild(masque_B);

				this.addChild(contenerPuzzle);

				// drag and drop				
				newContour_B.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_UP, dropIt);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_OVER, bigContour);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_OUT, petitContour);
			}
			
			if (numMask == "C"){
				
				var newContour_C:Sprite = new Sprite();
				newContour_C.graphics.lineStyle(5, 0xFFFFFF);
				newContour_C.graphics.drawRect(0, 0, 116, 442.6);
				newContour_C.alpha = 0.6;
				newContour_C.y = -221.3+10;
				newContour_C.x = -58+10;
				addChild(newContour_C);
				
				
				masque_C = new masqueC();
				masque_C.x = 10;
				masque_C.y = 10;

				contenerPuzzle.mask = masque_C;
				
				contenerPuzzle.contour = newContour_C;
				contenerPuzzle.contourHeight = 442.6;
				contenerPuzzle.contourWidth = 116;
				contenerPuzzle.contourY= -221.3+10;
				contenerPuzzle.contourX = -58+10;
				

				contenerPuzzle.addChild(newContour_C);
				contenerPuzzle.addChild(masque_C);

				this.addChild(contenerPuzzle);

				// drag and drop				
				newContour_C.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_UP, dropIt);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_OVER, bigContour);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_OUT, petitContour);
			}
			
			if (numMask == "D"){
				
				var newContour_D:Sprite = new Sprite();
				newContour_D.graphics.lineStyle(5, 0xFFFFFF);
				newContour_D.graphics.drawRect(0, 0, 147.4, 329.7);
				newContour_D.alpha = 0.6;
				newContour_D.x = -73.7+10;
				newContour_D.y = -164.8+10;
				addChild(newContour_D);
				
				
				masque_D = new masqueD();
				masque_D.x = 10;
				masque_D.y = 10;

				contenerPuzzle.mask = masque_D;
				
				contenerPuzzle.contour = newContour_D;
				contenerPuzzle.contourWidth = 147.4;
				contenerPuzzle.contourHeight = 329.7;
				contenerPuzzle.contourX= -73.7+10;;
				contenerPuzzle.contourY = -164.8+10;
				

				contenerPuzzle.addChild(newContour_D);
				contenerPuzzle.addChild(masque_D);

				this.addChild(contenerPuzzle);

				// drag and drop				
				newContour_D.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_UP, dropIt);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_OVER, bigContour);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_OUT, petitContour);
			}
			
			if (numMask == "E"){
				var newContour_E:Sprite = new Sprite();
				newContour_E.graphics.lineStyle(5, 0xFFFFFF);
				newContour_E.graphics.drawRect(0, 0, 120, 480);
				newContour_E.alpha = 0.6;
				newContour_E.x = -60+10;
				newContour_E.y = -240+10;
				addChild(newContour_E);


				masque_E = new masqueE();
				masque_E.x = 10;
				masque_E.y = 10;

				contenerPuzzle.mask = masque_E;

				contenerPuzzle.contour = newContour_E;
				contenerPuzzle.contourWidth = 120;
				contenerPuzzle.contourHeight = 480;
				contenerPuzzle.contourX= -60+10;
				contenerPuzzle.contourY = -240+10;


				contenerPuzzle.addChild(newContour_E);
				contenerPuzzle.addChild(masque_E);

				this.addChild(contenerPuzzle);

				// drag and drop				
				newContour_E.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_UP, dropIt);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_OVER, bigContour);
				contenerPuzzle.addEventListener(MouseEvent.MOUSE_OUT, petitContour);
			}

			

		}
		private function bigContour(event:MouseEvent):void {
			
			event.currentTarget.contour.graphics.clear();
			event.currentTarget.contour.graphics.lineStyle(20, 0xFFFFFF);
			event.currentTarget.contour.graphics.drawRect(0, 0, event.currentTarget.contourWidth, event.currentTarget.contourHeight);
			event.currentTarget.contour.x = event.currentTarget.contourX;
			event.currentTarget.contour.y = event.currentTarget.contourY;
		
			
		}
		
		private function petitContour(event:MouseEvent):void {
			
			event.currentTarget.contour.graphics.clear();
			event.currentTarget.contour.graphics.lineStyle(5, 0xFFFFFF);
			event.currentTarget.contour.graphics.drawRect(0, 0, event.currentTarget.contourWidth, event.currentTarget.contourHeight);
			event.currentTarget.contour.x = event.currentTarget.contourX;
			event.currentTarget.contour.y = event.currentTarget.contourY;
			
		}
				
		public function pickUp(event:MouseEvent):void {
			this.startDrag(false);
			_drag = true;			
		}

		public function dropIt(event:MouseEvent):void {
			this.stopDrag();

			
			_drag = false;
			_xSpeed = (contenerPuzzle.x-_x)*_ratio;
			_ySpeed = (contenerPuzzle.y-_y)*_ratio;				
		}
	
		private function inertia (e:Event):void {
			if (!_drag) {
				contenerPuzzle.x += _xSpeed *= _decel;
				contenerPuzzle.y += _ySpeed *= _decel;
				var clickPoint:Point = new Point(contenerPuzzle.x, contenerPuzzle.y);
			}
			else {
				_x = contenerPuzzle.x;
				_y = contenerPuzzle.y;
			}
		}
		
		public function getDrag():Boolean {
			return _drag;
		}
		
		public function getmasque(_ltr:String="A"):Sprite {
			
			if (_ltr == "A"){
				return masque_A;
			}
			if (_ltr == "B"){
				return masque_B;
			}
			if (_ltr == "C"){
				return masque_C;
			}
			if (_ltr == "D"){
				return masque_D;
			}
			if (_ltr == "E"){
				return masque_E;
			}
			
			return masque_A;
			
		}
		
		// Changer le centre de la map après coup
		public function setCenter(_plusLat:Number, _plusLng:Number):void {
		

			mapLat += _plusLat;
			mapLng += _plusLng;
			mapCenter = new LatLng(mapLat, mapLng);
			map.setCenter(mapCenter, 14, MapType.SATELLITE_MAP_TYPE);
			
			
		}
		
	}
}
