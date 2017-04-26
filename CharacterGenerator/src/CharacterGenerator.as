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
		private var randomBtn:RandomBtn_mc;
		
		private var head:MovieClip;
		private var torso:MovieClip;
		private var leftEye:MovieClip;
		private var rightEye:MovieClip;
		private var leftArm:MovieClip;
		private var rightArm:MovieClip;
		private var mouth:MovieClip;
		private var leftLeg:MovieClip;
		private var rightLeg:MovieClip;
		private var hat:MovieClip;
		
		private var headFrame:int = 1;
		private var torsoFrame:int = 1;
		private var leftEyeFrame:int = 1;
		private var rightEyeFrame:int = 1;
		private var mouthFrame:int = 1;
		private var leftArmFrame:int = 1;
		private var rightArmFrame:int = 1;
		private var leftLegFrame:int = 1;
		private var rightLegFrame:int = 1;
		private var hatFrame:int = 1;
		
		private var bodyParts:Array;
		private var bodyPartsFrame:Array;
		
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
			randomBtn = new RandomBtn_mc();
			
			head = character.Head_mc;
			torso = character.Torso_mc;
			leftEye = character.Head_mc.LeftEye_mc;
			rightEye = character.Head_mc.RightEye_mc;
			mouth = character.Head_mc.Mouthes_mc;
			leftArm = character.LeftArm_mc;
			rightArm = character.RightArm_mc;
			
			SetButton(head);
			SetButton(torso);
			
			SetButton(leftArm);
			SetButton(rightArm);
			
			SetButton(randomBtn);
			
			leftEye.stop();
			rightEye.stop();
			mouth.stop();
			
			bodyParts = new Array(head, torso, leftEye, rightEye, mouth, leftArm, rightArm);
			bodyPartsFrame = new Array(headFrame, torsoFrame, leftEyeFrame, rightEyeFrame, mouthFrame, leftArmFrame, rightArmFrame);
			
			this.addChild(character);
			this.addChild(randomBtn);
			OnResize();
		}
		
		private function SetButton(_mc:MovieClip):void{
			_mc.stop();
			_mc.buttonMode = true;
			_mc.addEventListener(MouseEvent.CLICK, OnClick);
			
			if(_mc == randomBtn){
				_mc.addEventListener(MouseEvent.MOUSE_DOWN, OnDown);
				_mc.addEventListener(MouseEvent.MOUSE_UP, OnUp);
				_mc.name = "randomBtn";
			}
		}
		
		private function OnClick(event:MouseEvent):void{
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
				case "Mouthes_mc":
					mouthFrame++;
					if(mouthFrame > event.target.totalFrames){
						mouthFrame = 1;
					}
					event.target.gotoAndStop(mouthFrame);
					break;
				case "LeftArm_mc":
					leftArmFrame++;
					if(leftArmFrame > event.target.totalFrames){
						leftArmFrame = 1;
					}
					event.target.gotoAndStop(leftArmFrame);
					break;
				case "RightArm_mc":
					rightArmFrame++;
					if(rightArmFrame > event.target.totalFrames){
						rightArmFrame = 1;
					}
					event.target.gotoAndStop(rightArmFrame);
					break;
				
				case "randomBtn":
					for(var i:int = 0; i < bodyPartsFrame.length; i++){
						bodyPartsFrame[i] = Math.floor(Math.random() * 10 + 1);
						trace(bodyPartsFrame[i]);
					}
					
					for(var j:int = 0; j < bodyParts.length; j++){
						bodyParts[j].gotoAndStop(bodyPartsFrame[j]);
					}
					break;
			}
		}
		
		private function OnDown(event:MouseEvent):void{
			event.target.gotoAndStop(2);
		}
		private function OnUp(event:MouseEvent):void{
			event.target.gotoAndStop(1);
		}
		
		private function OnResize(event:Event = null):void{
			character.x = (stage.stageWidth - character.width)/2;
			character.y = (stage.stageHeight - character.height)/2;
			
			randomBtn.x = stage.stageWidth - (randomBtn.width + 20);
			randomBtn.y = 20;
		}
	}
}