package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
  private var _overworld:TiledLevel;
  private var _player:FlxSprite;

  private var _playerSpeed:Float = 120;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
    FlxG.mouse.visible = false;
    FlxG.cameras.flash(FlxColor.BLACK);

    _overworld = new TiledLevel("assets/tiled/overworld.tmx");
    add(_overworld.foregroundTiles);

    _player = new FlxSprite(240, 200);
    _player.loadGraphic("assets/images/cycle.png", true, true, 15, 9);
    _player.animation.add("idle", [0]);
    add(_player);

    _player.acceleration.y = 420;
    _player.maxVelocity.set(_playerSpeed, 420);
    _player.drag.set(_playerSpeed * 4, _playerSpeed * 4);

    _player.width = 15;
    _player.height = 9;
    _player.offset.set(8, 2);

    FlxG.worldBounds.set(0, 0, 800, 600);
    FlxG.worldDivisions = 8;

    FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN);

		super.create();
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
    if (FlxG.keys.anyPressed(["LEFT", "A"]))
    {
      _player.velocity.x = -_playerSpeed;
      _player.facing = FlxObject.LEFT;
    }

    if (FlxG.keys.anyPressed(["RIGHT", "D"]))
    {
      _player.velocity.x = _playerSpeed;
      _player.facing = FlxObject.RIGHT;
    }

		super.update();
	}	
}
