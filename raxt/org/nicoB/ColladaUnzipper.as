package org.nicoB {
	import deng.fzip.FZip;
	
	import flash.net.URLRequest;
	import flash.events.ProgressEvent;
	
	import deng.fzip.*;
	
	
	import flash.events.EventDispatcher;
	import flash.events.Event;
	
	/**
	 * @author nicoB
	 */
	public class ColladaUnzipper extends EventDispatcher {
		
		var oFZip : FZip;
		
		
		public function ColladaUnzipper(sPath : String){
			oFZip = new FZip();
			
			oFZip.addEventListener(ProgressEvent.PROGRESS, _onLoadProgress);
			oFZip.addEventListener(Event.COMPLETE, _onLoadComplete);	
			
			var oURLRequest : URLRequest = new URLRequest(sPath);
			oFZip.load(oURLRequest); 
		}
		
		
		
		
		private function _onLoadProgress(e : ProgressEvent) : void{
			var iPrct : Number = Math.round(e.bytesLoaded/e.bytesTotal*100);
			var event : ColladaUnzipperEvent = new ColladaUnzipperEvent(ColladaUnzipperEvent.ONCOLLADALOADING);
			event.prct = iPrct;
			dispatchEvent(event);
		}
		
		
		private function _onLoadComplete(e : Event) : void{
		
			var collada : XML = new XML(oFZip.getFileAt(0).content);
			
			var event : ColladaUnzipperEvent = new ColladaUnzipperEvent(ColladaUnzipperEvent.ONGETCOLLADA);
			event.collada = collada;
			dispatchEvent(event);
		}
	
	}
}
