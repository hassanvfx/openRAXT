package org.nicoB {
	import flash.display.Sprite;
	
	
	/**
	 * @author nicoB
	 */
	public class Papervision_fzip extends Sprite {
		
		public function Papervision_fzip(){
			var unzipper : ColladaUnzipper = new ColladaUnzipper("Duck/Duck.zip");
			unzipper.addEventListener(ColladaUnzipperEvent.ONGETCOLLADA, _onGetCollada);
		}
		
		private function _onGetCollada(e : ColladaUnzipperEvent) : void {
			var oDuck : Duck3D = new Duck3D(e.collada);
			addChild(oDuck);
		}
	
	
	}
}
