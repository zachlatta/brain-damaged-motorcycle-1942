package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
  private var _gameTitle:FlxText;
  private var _bg:FlxSprite;
  private var _startButton:FlxButton;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
    _bg = new FlxSprite(0, 0, "assets/images/menuBackground.png");
    add(_bg);

    _gameTitle = new FlxText(10, 25, 300, "Brain Damaged Motorcycle 1942");
    _gameTitle.setFormat(null, 16, FlxColor.BLACK, "center");
    add(_gameTitle);

    _startButton = new FlxButton(137, 195, "", onStart);
    _startButton.loadGraphic("assets/images/btnStartUp.png");
    _startButton.onOver.callback = onStartOver;
    _startButton.onOut.callback = onStartOut;
    add(_startButton);

    add(new FlxText(160, 220, 160, "by Zach Latta and Jack Miesse"));

		super.create();
	}

  private function onStart():Void
  {
    FlxG.cameras.fade(FlxColor.BLACK, 1, false, onFade);
  }

  private function onFade():Void
  {
    FlxG.switchState(new PlayState());
  }

  private function onStartOver():Void
  {
    _startButton.loadGraphic("assets/images/btnStartDown.png");
  }

  private function onStartOut():Void
  {
    _startButton.loadGraphic("assets/images/btnStartUp.png");
  }
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}
