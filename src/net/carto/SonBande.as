package net.carto {
	
	public class SonBande extends Sprite  {
		
		private var objetSon:Sound;	
		private var urlSon:URLRequest;
		private var canal:SoundChannel;
				
		public function SonBande(_urlSon:String) {
						
			objetSon = new Sound();
			urlSon = new URLRequest(_urlSon);
			canal = new SoundChannel();			
		}

		public function createSon():Sound {
			
			objetSon.load(urlSon);
			
			
			// Son global
			var conteneurSon:Sound = new Sound();
			var ikedaLong:URLRequest = new URLRequest("ikeda_testpattern0100.mp3");
			var canal:SoundChannel = new SoundChannel();
			conteneurSon.load(ikedaLong);
			canal = conteneurSon.play(0, 10);
			
		}
	}	