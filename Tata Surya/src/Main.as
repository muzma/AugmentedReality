package {

	import flash.display.Sprite;
		
	[SWF(width="640", height="480", frameRate="30", backgroundColor="#FFFFFF")]
	public class Main extends Sprite {
		
	
		public function Main () {

			this.addChild(new MultiMarkerMultiDae());

		}
	}
}
