package game.environment
{
   import flash.geom.Rectangle;
   import flashpunk2.Entity;
   import flashpunk2.components.rendering.Renderer;
   import flashpunk2.global.Debug;
   import game.Constants;
   import game.PlatformObject;
   import game.world.PlatformLevel;
   
   public class Wall extends Entity implements Solid
   {
      
      protected var image:Renderer;
      
      private var _body:Rectangle;
      
      public var glow:Boolean = false;
      
      public function Wall(param1:int, param2:int, param3:int, param4:int)
      {
         // method body index: 2456 method index: 2470
         super(int(param1 + param3 / 2),int(param2 + param4 / 2));
         this._body = new Rectangle(-param3 / 2,-param4 / 2,param3,param4);
         groups = Groups.SOLID | Groups.BLOCK | Groups.THICK;
         ON_DEBUG.add(this.onDebug);
         depth = -2;
      }
      
      public function get body() : Rectangle
      {
         // method body index: 2454 method index: 2468
         return this._body;
      }
      
      public function get level() : PlatformLevel
      {
         // method body index: 2455 method index: 2469
         return world as PlatformLevel;
      }
      
      protected function onDebug() : void
      {
         // method body index: 2457 method index: 2471
         Debug.drawRect(x + this.body.x,y + this.body.y,this.body.width,this.body.height,16776960,0.5);
      }
      
      public function get floorRight() : Number
      {
         // method body index: 2458 method index: 2472
         return Constants.TILE_HEIGHT - 1;
      }
      
      public function get floorLeft() : Number
      {
         // method body index: 2459 method index: 2473
         return Constants.TILE_HEIGHT - 1;
      }
      
      public function isObstacle(param1:int, param2:int) : Boolean
      {
         // method body index: 2460 method index: 2474
         return true;
      }
      
      public function onStepped(param1:PlatformObject) : void
      {
         // method body index: 2461 method index: 2475
      }
      
      public function onHit(param1:PlatformObject) : void
      {
         // method body index: 2462 method index: 2476
      }
      
      public function get bottom() : Number
      {
         // method body index: 2463 method index: 2477
         return y + this._body.y + this._body.height;
      }
      
      public function get top() : Number
      {
         // method body index: 2464 method index: 2478
         return y + this._body.y;
      }
      
      public function reset() : void
      {
         // method body index: 2465 method index: 2479
      }
   }
}

