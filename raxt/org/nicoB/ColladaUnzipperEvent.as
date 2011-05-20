package org.nicoB {
	import flash.events.Event;
		
	/**
	 * @author nicoB
	 */
	public class ColladaUnzipperEvent extends Event {
		
		public static const ONGETCOLLADA: String = "onGetCollada";
		public static const ONCOLLADALOADING: String = "onColladaLoading";
		
		
		public var collada : XML;
		public var prct : Number;			
					
		
		public function ColladaUnzipperEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}
