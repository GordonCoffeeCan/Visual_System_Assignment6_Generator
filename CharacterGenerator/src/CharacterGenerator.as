package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width = "960", height = "640", frameRate="60", backgroundColor = "#FFFFFF")]
	
	public class CharacterGenerator extends Sprite
	{
		private var character:Character_mc;
		
		private var head:MovieClip;
		private var torso:MovieClip;
		private var leftEye:MovieClip;
		private var rightEye:MovieClip;
		
		private var headFrame:int = 1;
		private var torsoFrame:int = 1;
		private var leftEyeFrame:int = 1;
		private var rightEyeFrame:int = 1;
		
		public function CharacterGenerator()
		{
			if(stage){
				init();
			}else{
				this.addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(event:Event = null):void{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			stage.addEventListener(Event.RESIZE, OnResize);
			
			SetElement();
		}
		
		private function SetElement():void{
			character = new Character_mc();
			
			head = character.Head_mc;
			torso = character.Torso_mc;
			leftEye = character.LeftEye_mc;
			rightEye = character.RightEye_mc;
			
			SetButton(head);
			SetButton(torso);
			SetButton(leftEye);
			SetButton(rightEye);
			
			this.addChild(character);
			OnResize();
		}
		
		private function SetButton(_mc:MovieClip):void{
			_mc.stop();
			_mc.buttonMode = true;
			_mc.addEventListener(MouseEvent.CLICK, OnClick);
		}
		
		private function OnClick(event:MouseEvent):void{
			trace(event.target.name);
			
			switch(event.target.name){
				case "Head_mc":
					headFrame++;
					if(headFrame > event.target.totalFrames){
						headFrame = 1;
					}
					event.target.gotoAndStop(headFrame);
					break;
				case "Torso_mc":
					torsoFrame++;
					if(torsoFrame > event.target.totalFrames){
						torsoFrame = 1;
					}
					event.target.gotoAndStop(torsoFrame);
					break;
				case "LeftEye_mc":
					leftEyeFrame++;
					if(leftEyeFrame > event.target.totalFrames){
						leftEyeFrame = 1;
					}
					event.target.gotoAndStop(leftEyeFrame);
					break;
				case "RightEye_mc":
					rightEyeFrame++;
					if(rightEyeFrame > event.target.totalFrames){
						rightEyeFrame = 1;
					}
					event.target.gotoAndStop(rightEyeFrame);
					break;
			}
		}
		
		private function OnResize(event:Event = null):void{
			character.x = (stage.stageWidth - character.width)/2;
			character.y = (stage.stageHeight - character.height)/2;
		}
	}
}