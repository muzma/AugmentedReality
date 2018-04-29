package  {
    import com.transmote.flar.FLARManager;
    import com.transmote.flar.marker.FLARMarker;
    import com.transmote.flar.marker.FLARMarkerEvent;
    import com.transmote.flar.utils.geom.FLARPVGeomUtils;
    
    import flash.display.Sprite;
    import flash.events.Event;
	import flash.media.Sound;
    import flash.media.SoundChannel;
	import flash.net.URLRequest;
    
    import org.libspark.flartoolkit.support.pv3d.FLARCamera3D;
    import org.papervision3d.lights.PointLight3D;
    import org.papervision3d.objects.DisplayObject3D;
    import org.papervision3d.objects.parsers.DAE;
    import org.papervision3d.render.LazyRenderEngine;
    import org.papervision3d.scenes.Scene3D;
    import org.papervision3d.view.Viewport3D;
	
	//mengimport class file suara
	
        
    public class MultiMarkerMultiDae extends Sprite {
        private var flarManager:FLARManager;
        
        private var scene3D:Scene3D;
        private var camera3D:FLARCamera3D;
        private var viewport3D:Viewport3D;
        private var renderEngine:LazyRenderEngine;
        private var titikCahaya3D:PointLight3D;
        
        private var activeMarker:FLARMarker;
		private var activeMarker1:FLARMarker;
        private var activeMarker2:FLARMarker;
        private var activeMarker3:FLARMarker;
        private var activeMarker4:FLARMarker;
		private var activeMarker5:FLARMarker;
		private var activeMarker6:FLARMarker;
		private var activeMarker7:FLARMarker;
		private var activeMarker8:FLARMarker;
		private var activeMarker9:FLARMarker;
        private var modelContainer:DisplayObject3D;
        private var modelContainer1:DisplayObject3D;
		private var modelContainer2:DisplayObject3D;
        private var modelContainer3:DisplayObject3D;
		private var modelContainer4:DisplayObject3D;
		private var modelContainer5:DisplayObject3D;
		private var modelContainer6:DisplayObject3D;
		private var modelContainer7:DisplayObject3D;
		private var modelContainer8:DisplayObject3D;
		private var modelContainer9:DisplayObject3D;
		private var modelContainer10:DisplayObject3D;
		
		
        //file class untuk mengontrol suara
		//private var Suara1 = new suara();
		private var pausePoint:Number = 0.00;
		private var isPlaying:Boolean;
		
		private var soundChannel:SoundChannel = new SoundChannel();
		private var sound:Sound = new Sound(new URLRequest("suarapendukung/backsound.mp3"));
        
        private var markerId:int;        
		
		
        public function MultiMarkerMultiDae () 
        {
            
            this.flarManager = new FLARManager("flar/flarConfig.xml");
            
            this.addChild(Sprite(this.flarManager.flarSource));
            
            this.flarManager.addEventListener(FLARMarkerEvent.MARKER_ADDED, this.onMarkerAdded);
            this.flarManager.addEventListener(FLARMarkerEvent.MARKER_UPDATED, this.onMarkerUpdated);
            this.flarManager.addEventListener(FLARMarkerEvent.MARKER_REMOVED, this.onMarkerRemoved);
            
            this.flarManager.addEventListener(Event.INIT, this.onFlarManagerInited);
        }
        
        private function onFlarManagerInited (evt:Event) :void 
        {
            this.flarManager.removeEventListener(Event.INIT, this.onFlarManagerInited);
            
            this.scene3D = new Scene3D();
            
            this.camera3D = new FLARCamera3D(this.flarManager.cameraParams);
            
            this.viewport3D = new Viewport3D(this.stage.stageWidth, this.stage.stageHeight);
            this.addChild(this.viewport3D);
            
            this.renderEngine = new LazyRenderEngine(this.scene3D, this.camera3D, this.viewport3D);
            
            this.titikCahaya3D = new PointLight3D();
            this.titikCahaya3D.x = 1000;
            this.titikCahaya3D.y = 1000;
            this.titikCahaya3D.z = -1000;
            
            var model1:DAE = new DAE(true, "matahari", true); 
            model1.load("assets/matahari.dae"); 
			trace("Matahari loaded"); 
            model1.rotationX = 90; 
            model1.rotationY = 0; 
            model1.rotationZ = 0; 
            model1.scale = 5; 
            
            var model2:DAE = new DAE(true, "merkurius", true); 
            model2.load("assets/merkurius.dae");
            trace("Merkurius loaded"); 
            model2.rotationX = 90; 
            model2.rotationY=  0;
            model2.rotationZ = 0; 
            model2.scale = 2; 
            
            var model3:DAE = new DAE(true, "venus", true); 
            model3.load("assets/venus.dae"); 
            model3.rotationX = 90; 
            model3.rotationY=  0;
            model3.rotationZ = 0; 
            model3.scale = 1; 
            
            var model4:DAE = new DAE(true, "bumi", true); 
            model4.load("assets/bumi.dae"); 
            model4.rotationX = 90; 
            model4.rotationY=  0;
            model4.rotationZ = 0; 
            model4.scale = 2; 
			
			var model5:DAE = new DAE(true, "mars", true); 
            model5.load("assets/mars.dae"); 
            model5.rotationX = 90; 
            model5.rotationY=  0;
            model5.rotationZ = 0; 
            model5.scale = 2; 
									
			var model6:DAE = new DAE(true, "jupiter", true); 
            model6.load("assets/jupiter.dae"); 
            model6.rotationX = 90; 
            model6.rotationY=  0;
            model6.rotationZ = 0; 
            model6.scale = 6; 
						
			var model7:DAE = new DAE(true, "saturnus", true); 
            model7.load("assets/saturnus.dae"); 
            model7.rotationX = 90; 
            model7.rotationY=  0;
            model7.rotationZ = 0; 
            model7.scale = 0.5; 
						
			var model8:DAE = new DAE(true, "uranus", true); 
            model8.load("assets/uranus.dae"); 
            model8.rotationX = 90; 
            model8.rotationY=  0;
            model8.rotationZ = 0; 
            model8.scale = 50; 
						
			var model9:DAE = new DAE(true, "neptunus", true); 
            model9.load("assets/neptunus.dae"); 
            model9.rotationX = 90; 
            model9.rotationY=  0;
            model9.rotationZ = 0; 
            model9.scale = 2; 
						
			var model10:DAE = new DAE(true, "pluto", true); 
            model10.load("assets/pluto.dae"); 
            model10.rotationX = 90; 
            model10.rotationY=  0;
            model10.rotationZ = 0; 
            model10.scale = 2; 
          

            this.modelContainer = new DisplayObject3D();
            this.modelContainer.addChild(model1);
            this.modelContainer.visible = false;
            this.scene3D.addChild(this.modelContainer);
            
            this.modelContainer1 = new DisplayObject3D();
            this.modelContainer1.addChild(model2);
            this.modelContainer1.visible = false;
            this.scene3D.addChild(this.modelContainer1);
            
			this.modelContainer2 = new DisplayObject3D();
			this.modelContainer2.addChild(model3);
			this.modelContainer2.visible = false;
			this.scene3D.addChild(this.modelContainer2);
            
            this.modelContainer3 = new DisplayObject3D();
            this.modelContainer3.addChild(model4);
            this.modelContainer3.visible = false;
            this.scene3D.addChild(this.modelContainer3);
			            
            this.modelContainer4 = new DisplayObject3D();
            this.modelContainer4.addChild(model5);
            this.modelContainer4.visible = false;
            this.scene3D.addChild(this.modelContainer4);
			            
            this.modelContainer5 = new DisplayObject3D();
            this.modelContainer5.addChild(model6);
            this.modelContainer5.visible = false;
            this.scene3D.addChild(this.modelContainer5);
			            
            this.modelContainer6 = new DisplayObject3D();
            this.modelContainer6.addChild(model7);
            this.modelContainer6.visible = false;
            this.scene3D.addChild(this.modelContainer6);
			            
            this.modelContainer7 = new DisplayObject3D();
            this.modelContainer7.addChild(model8);
            this.modelContainer7.visible = false;
            this.scene3D.addChild(this.modelContainer7);
			            
            this.modelContainer8 = new DisplayObject3D();
            this.modelContainer8.addChild(model9);
            this.modelContainer8.visible = false;
            this.scene3D.addChild(this.modelContainer8);
			            
            this.modelContainer9 = new DisplayObject3D();
            this.modelContainer9.addChild(model10);
            this.modelContainer9.visible = false;
            this.scene3D.addChild(this.modelContainer9);

            
            //------------------------------------------------------------------------- --------- 
            this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame); 
			
       } 
           
		
			private function onMarkerAdded ( evt:FLARMarkerEvent) :void
			{
				
					trace("["+evt.marker.patternId+"] ditambahkan");
					if(evt.marker.patternId == 1)
					{
							trace("Pola 1 ditambahkan");
							markerAdded(1);
							this.activeMarker = evt.marker;
							this.flarManager.addEventListener(FLARMarkerEvent.MARKER_ADDED, this.PlaySound);							
					}
					
					if(evt.marker.patternId == 2)
					{
						trace("Pola 2 ditambahkan");
						markerAdded(2);
						this.activeMarker1 = evt.marker;
						
					}
					
					if(evt.marker.patternId == 3)
					{
						trace("Pola 3 ditambahkan");
						markerAdded(3);
						this.activeMarker2 = evt.marker;
					}
					
						if(evt.marker.patternId == 4)
					{
						trace("Pola 4 ditambahkan");
						markerAdded(4);
						this.activeMarker3 = evt.marker;
					}
					
						if(evt.marker.patternId == 5)
					{
						trace("Pola 5 ditambahkan");
						markerAdded(5);
						this.activeMarker4 = evt.marker;
					}
						if(evt.marker.patternId == 6)
					{
						trace("Pola 6 ditambahkan");
						markerAdded(6);
						this.activeMarker5 = evt.marker;
					}
					
						if(evt.marker.patternId == 7)
					{
						trace("Pola 7 ditambahkan");
						markerAdded(7);
						this.activeMarker6 = evt.marker;
					}
					
						if(evt.marker.patternId == 8)
					{
						trace("Pola 8 ditambahkan");
						markerAdded(8);
						this.activeMarker7 = evt.marker;
					}
					
						if(evt.marker.patternId == 9)
					{
						trace("Pola 9 ditambahkan");
						markerAdded(9);
						this.activeMarker8 = evt.marker;
					}
					
					if(evt.marker.patternId == 10)
					{
						trace("Pola 10 ditambahkan");
						markerAdded(10);
						this.activeMarker9 = evt.marker;
					}
					this.activeMarker = evt.marker;
			}
		   
			private function onMarkerUpdated (evt:FLARMarkerEvent) :void 
         	{ 
	            trace("["+evt.marker.patternId+"] diupdate"); 
	            if(evt.marker.patternId == 1)
	            {
		            trace("pola 1 diupdate"); 
		            markerAdded(1);
		            this.activeMarker = evt.marker; 
					//Suara1.PlayMusic();

	            }
	            if(evt.marker.patternId == 2)
	            {
		            trace("pola 2 di update"); 
		            markerAdded(2);
		            this.activeMarker1 = evt.marker; 
	            }
	            if(evt.marker.patternId == 3)
	            {
		            trace("pola 3 diupdate"); 
		            markerAdded(3);
		            this.activeMarker2 = evt.marker; 
            	}
				if(evt.marker.patternId == 4)
				{
					trace("pola 4 diupdate"); 
					markerAdded(4);
					this.activeMarker3 = evt.marker; 
				}
				if(evt.marker.patternId == 5)
				{
					trace("pola 5 diupdate"); 
					markerAdded(5);
					this.activeMarker4 = evt.marker; 
				}
				if(evt.marker.patternId == 6)
				{
					trace("pola 6 diupdate"); 
					markerAdded(6);
					this.activeMarker5 = evt.marker; 
				}
				if(evt.marker.patternId == 7)
				{
					trace("pola 7 diupdate"); 
					markerAdded(7);
					this.activeMarker6 = evt.marker; 
				}
				if(evt.marker.patternId == 8)
				{
					trace("pola 8 diupdate"); 
					markerAdded(8);
					this.activeMarker7 = evt.marker; 
				}
				if(evt.marker.patternId == 9)
				{
					trace("pola 9 diupdate"); 
					markerAdded(9);
					this.activeMarker8 = evt.marker; 
				}
				if(evt.marker.patternId == 10)
				{
					trace("pola 10 diupdate"); 
					markerAdded(10);
					this.activeMarker9 = evt.marker; 
				}
            } 
            
             private function onMarkerRemoved (evt:FLARMarkerEvent) :void { 
            trace("["+evt.marker.patternId+"] dihilangkan"); 
           
            if(evt.marker.patternId == 1)
            {
            trace("pola 1 dihilangkan");
            markerRemoved(1);
			this.flarManager.addEventListener(FLARMarkerEvent.MARKER_REMOVED, this.PauseSound);
            }
			if(evt.marker.patternId == 2)
            {
            trace("pola 2 dihilangkan");
            markerRemoved(2);
            }
            if(evt.marker.patternId == 3)
            {
            trace("pola 3 dihilangkan");
            markerRemoved(3);
            }
			if(evt.marker.patternId == 4)
			{
			trace("pola 4 dihilangkan");
			markerRemoved(4);
			} 
            if(evt.marker.patternId == 5)
			{
			trace("pola 5 dihilangkan");
			markerRemoved(5);
			} 
			if(evt.marker.patternId == 6)
			{
			trace("pola 6 dihilangkan");
			markerRemoved(6);
			} 
			if(evt.marker.patternId == 7)
			{
			trace("pola 7 dihilangkan");
			markerRemoved(7);
			} 
			if(evt.marker.patternId == 8)
			{
			trace("pola 8 dihilangkan");
			markerRemoved(8);
			} 
			if(evt.marker.patternId == 9)
			{
			trace("pola 9 dihilangkan");
			markerRemoved(9);
			} 
			if(evt.marker.patternId == 10)
			{
			trace("pola 10 dihilangkan");
			markerRemoved(10);
			} 
            this.activeMarker = null;
            this.activeMarker1 = null; 
            this.activeMarker2 = null;
            this.activeMarker3 = null;
			this.activeMarker4 = null;
			this.activeMarker5 = null;
			this.activeMarker6 = null;
			this.activeMarker7 = null;
			this.activeMarker8 = null;
			this.activeMarker9 = null;
            } 
            
             private function onEnterFrame (evt:Event) :void { 
                 
                if (this.activeMarker) {
                this.modelContainer.transform =    FLARPVGeomUtils.convertFLARMatrixToPVMatrix(this.activeMarker.transformMatrix);
                }
                
                if (this.activeMarker1) {
                this.modelContainer1.transform =    FLARPVGeomUtils.convertFLARMatrixToPVMatrix(this.activeMarker1.transformMatrix);
                }
                
                if (this.activeMarker2) {
                this.modelContainer2.transform = FLARPVGeomUtils.convertFLARMatrixToPVMatrix(this.activeMarker2.transformMatrix);
                }
                
                if (this.activeMarker3) {
                this.modelContainer3.transform = FLARPVGeomUtils.convertFLARMatrixToPVMatrix(this.activeMarker3.transformMatrix);
                }
				                
                if (this.activeMarker4) {
                this.modelContainer4.transform = FLARPVGeomUtils.convertFLARMatrixToPVMatrix(this.activeMarker4.transformMatrix);
                }
				                
                if (this.activeMarker5) {
                this.modelContainer5.transform = FLARPVGeomUtils.convertFLARMatrixToPVMatrix(this.activeMarker5.transformMatrix);
                }
				                
                if (this.activeMarker6) {
                this.modelContainer6.transform = FLARPVGeomUtils.convertFLARMatrixToPVMatrix(this.activeMarker6.transformMatrix);
                }
				                
                if (this.activeMarker7) {
                this.modelContainer7.transform = FLARPVGeomUtils.convertFLARMatrixToPVMatrix(this.activeMarker7.transformMatrix);
                }
				                
                if (this.activeMarker8) {
                this.modelContainer8.transform = FLARPVGeomUtils.convertFLARMatrixToPVMatrix(this.activeMarker8.transformMatrix);
                }
				                
                if (this.activeMarker9) {
                this.modelContainer9.transform = FLARPVGeomUtils.convertFLARMatrixToPVMatrix(this.activeMarker9.transformMatrix);
                }

       
              this.renderEngine.render(); 
             }
             
    
                private function markerAdded(markerId:int):void
            {
                trace(markerId);
                var x:int = markerId;
                switch(x)
                {
                    case 1:
                    {
                        
                        if(modelContainer.visible==false)
                        {
                            modelContainer.visible=true;
                            break;
                        }
                        else
                            break;    
                    }
                    case 2:
                    {
                        if(modelContainer1.visible==false)
                        {
                            modelContainer1.visible=true;
                            break;
                        }
                        else
                            break;
                    }
                    case 3:
                    {
                        
                        if(modelContainer2.visible==false)
                        {
                            modelContainer2.visible=true;
                            break;
                        }
                        else
                            break;    
                    }
					case 4:
					{
						
						if(modelContainer3.visible==false)
						{
							modelContainer3.visible=true;
							break;
						}
						else
							break;    
					}
					case 5:
					{
						
						if(modelContainer4.visible==false)
						{
							modelContainer4.visible=true;
							break;
						}
						else
							break;    
					}
					case 6:
					{
						
						if(modelContainer5.visible==false)
						{
							modelContainer5.visible=true;
							break;
						}
						else
							break;    
					}
					case 7:
					{
						
						if(modelContainer6.visible==false)
						{
							modelContainer6.visible=true;
							break;
						}
						else
							break;    
					}
					case 8:
					{
						
						if(modelContainer7.visible==false)
						{
							modelContainer7.visible=true;
							break;
						}
						else
							break;    
					}
					case 9:
					{
						
						if(modelContainer8.visible==false)
						{
							modelContainer8.visible=true;
							break;
						}
						else
							break;    
					}
					case 10:
					{
						
						if(modelContainer9.visible==false)
						{
							modelContainer9.visible=true;
							break;
						}
						else
							break;    
					}
                }
                
            }
            
            private function markerRemoved(markerId:int):void
            {
                var x:int = markerId;
                switch(x)
                {
                    case 1:
                    {
                        if(modelContainer.visible==true)
                        {
                            modelContainer.visible=false;
                            break;
                        }
                        else
                            break;
                    }
                    
                    case 2:
                    {
                        if(modelContainer1.visible==true)
                        {
                            modelContainer1.visible=false;
                            break;
                        }
                        else
                        {
                            break;
                        }
                    }
                    
                    case 3:
                    {
                        if(modelContainer2.visible==true)
                        {
                            modelContainer2.visible=false;
                            break;
                        }
                        else
                            break;
                    }
					case 4:
					{
						if(modelContainer3.visible==true)
						{
							modelContainer3.visible=false;
							break;
						}
						else
						{
							break;
						}
					}
					
					case 5:
					{
						if(modelContainer4.visible==true)
						{
							modelContainer4.visible=false;
							break;
						}
						else
						{
							break;
						}
					}
					
					case 6:
					{
						if(modelContainer5.visible==true)
						{
							modelContainer5.visible=false;
							break;
						}
						else
						{
							break;
						}
					}
					
					case 7:
					{
						if(modelContainer6.visible==true)
						{
							modelContainer6.visible=false;
							break;
						}
						else
						{
							break;
						}
					}
					
					case 8:
					{
						if(modelContainer7.visible==true)
						{
							modelContainer7.visible=false;
							break;
						}
						else
						{
							break;
						}
					}
					
					case 9:
					{
						if(modelContainer8.visible==true)
						{
							modelContainer8.visible=false;
							break;
						}
						else
						{
							break;
						}
					}
					
					case 10:
					{
						if(modelContainer9.visible==true)
						{
							modelContainer9.visible=false;
							break;
						}
						else
						{
							break;
						}
					}
					
                }
            }
			
		private function clickPlayPause(evt:FLARMarkerEvent) :void  {
			if (isPlaying) {
				pausePoint = soundChannel.position;
				soundChannel.stop();
				isPlaying = false;
			} else if (!isPlaying) {
				soundChannel = sound.play(pausePoint);
				isPlaying = true;
			}
		}
		private function PlaySound(evt:FLARMarkerEvent):void
		{
			if(!isPlaying){
				soundChannel = sound.play(pausePoint);
				isPlaying = true;
			}
		}
		private function PauseSound(evt:FLARMarkerEvent):void
		{
				if (isPlaying) {
				pausePoint = soundChannel.position;
				soundChannel.stop();
				isPlaying = false;
				} 
		}

		private function clickStop(evt:FLARMarkerEvent) :void  {
			if (isPlaying) {
				soundChannel.stop();
				isPlaying = false;
			}
			pausePoint = 0.00;
		}
    }   
	
}