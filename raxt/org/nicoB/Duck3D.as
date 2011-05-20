package org.nicoB {
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.objects.Collada;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.scenes.Scene3D;
	
		
	/**
	 * @author nicoB
	 */
	public class Duck3D extends Sprite {
		
		private var oScene : Scene3D;
		private var oCamera : Camera3D;
		private var oContainer : DisplayObject3D;
		private var oObj : DisplayObject3D;
		private var oCollada : XML;
		
		
		public function Duck3D(collada : XML) : void{
			oCollada = collada;
		
			_buildScene();
			_buildCamera();
			_buildObject();
			
			//onEnterFrame
			this.addEventListener(Event.ENTER_FRAME, _draw);
			
		}
	
	
		//--------------------------------
		//			SCENE
		//--------------------------------	
		
		private function _buildScene():void{
			oScene = new Scene3D(this);
		}
		
		
		
		//--------------------------------
		//			CAMERA
		//--------------------------------
		
		private function _buildCamera():void{
			oCamera = new Camera3D();
			oCamera.z = 60000; 
			oCamera.zoom = 10;
			oCamera.focus = 100;
		}
		
		
		//--------------------------------
		//			OBJECT
		//--------------------------------
				
		private function _buildObject():void{
			oContainer = new DisplayObject3D();
			oScene.addChild(oContainer);
			
			oObj = new Collada(oCollada);
			oObj.y -= 20000;
			oObj.x -= 15000;
			
			oContainer.addChild(oObj);
		}
	
	
		//--------------------------------
		//			DRAW
		//--------------------------------
		private function _draw(e : Event = null):void{
			oObj.rotationY += 1;
			oScene.renderCamera(oCamera);
		}
	
		
	}
}
