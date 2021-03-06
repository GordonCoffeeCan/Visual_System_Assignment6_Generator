package
{
	import com.adobe.images.JPGEncoder;
	import com.adobe.images.PNGEncoder;
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	import flash.geom.Matrix;
	
	[SWF(width = "800", height = "800", frameRate="60", backgroundColor = "#FFFFFF", alpha = "0")]
	
	public class CharacterGenerator extends Sprite
	{
		private var characterContrainer:MovieClip;
		private var character:Character_mc;
		private var randomBtn:RandomBtn_mc;
		private var saveBtn:SaveBtn_mc;
		
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
			characterContrainer = new MovieClip();
			character = new Character_mc();
			randomBtn = new RandomBtn_mc();
			saveBtn = new SaveBtn_mc();
			
			head = character.Head_mc;
			torso = character.Torso_mc;
			leftEye = character.Head_mc.LeftEye_mc;
			rightEye = character.Head_mc.RightEye_mc;
			mouth = character.Head_mc.Mouthes_mc;
			leftArm = character.LeftArm_mc;
			rightArm = character.RightArm_mc;
			leftLeg = character.LeftLeg_mc;
			rightLeg = character.RightLeg_mc;
			hat = character.Hat_mc;
			
			SetButton(head);
			SetButton(torso);
			SetButton(leftArm);
			SetButton(rightArm);
			SetButton(leftLeg);
			SetButton(rightLeg);
			SetButton(hat);
			
			SetButton(randomBtn);
			SetButton(saveBtn);
			
			leftEye.stop();
			rightEye.stop();
			mouth.stop();
			
			bodyParts = new Array(head, torso, leftEye, rightEye, mouth, leftArm, rightArm, leftLeg, rightLeg, hat);
			bodyPartsFrame = new Array(headFrame, torsoFrame, leftEyeFrame, rightEyeFrame, mouthFrame, leftArmFrame, rightArmFrame, leftLegFrame, rightLegFrame, hatFrame);
			
			this.addChild(characterContrainer);
			characterContrainer.addChild(character);
			this.addChild(randomBtn);
			this.addChild(saveBtn);
			OnResize();
		}
		
		private function SetButton(_mc:MovieClip):void{
			_mc.stop();
			_mc.buttonMode = true;
			_mc.addEventListener(MouseEvent.CLICK, OnClick);
			
			if(_mc == randomBtn || _mc == saveBtn){
				if(_mc == randomBtn){
					_mc.name = "randomBtn";
				}else if(_mc == saveBtn){
					_mc.name = "saveBtn";
				}
				_mc.addEventListener(MouseEvent.MOUSE_DOWN, OnDown);
				_mc.addEventListener(MouseEvent.MOUSE_UP, OnUp);
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
				case "LeftLeg_mc":
					leftLegFrame++;
					if(leftLegFrame > event.target.totalFrames){
						leftLegFrame = 1;
					}
					event.target.gotoAndStop(leftLegFrame);
					break;
				case "RightLeg_mc":
					rightLegFrame++;
					if(rightLegFrame > event.target.totalFrames){
						rightLegFrame = 1;
					}
					event.target.gotoAndStop(rightLegFrame);
					break;
				case "Hat_mc":
					hatFrame++;
					if(hatFrame > event.target.totalFrames){
						hatFrame = 1;
					}
					event.target.gotoAndStop(hatFrame);
					break;
				
				case "randomBtn":
					for(var i:int = 0; i < bodyPartsFrame.length; i++){
						bodyPartsFrame[i] = Math.floor(Math.random() * 10 + 1);
						trace(bodyPartsFrame[i]);
					}
					
					for(var j:int = 0; j < bodyParts.length; j++){
						bodyParts[j].gotoAndStop(bodyPartsFrame[j]);
					}
					
					characterContrainer.addChild(character);
					
					break;
				
				case "saveBtn":
					var bitmapData:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight);
					var shiftOrigin:Matrix = new Matrix();
					shiftOrigin.translate((stage.stageWidth - characterContrainer.width)/2, (stage.stageHeight - characterContrainer.height)/2 + 80);
					bitmapData.draw(characterContrainer, shiftOrigin);
					//var jpgEncoder:JPGEncoder = new JPGEncoder(85);
					//var byteArray:ByteArray = jpgEncoder.encode(bitmapData);
					var byteArray:ByteArray = PNGEncoder.encode(bitmapData);
					var fileReference:FileReference = new FileReference();
					fileReference.save(byteArray, "image.png");
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
			characterContrainer.x = (stage.stageWidth - characterContrainer.width)/2;
			characterContrainer.y = (stage.stageHeight - characterContrainer.height)/2 + 80;
			
			randomBtn.x = stage.stageWidth - (randomBtn.width + 150);
			randomBtn.y = 20;
			
			saveBtn.x = stage.stageWidth - (saveBtn.width + 20);
			saveBtn.y = 20;
		}
	}
}