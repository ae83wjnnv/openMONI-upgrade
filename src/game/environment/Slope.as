package game.environment
{
   import flash.geom.Rectangle;
   import flashpunk2.Entity;
   import flashpunk2.global.Debug;
   import game.Constants;
   import game.PlatformObject;
   
   public class Slope extends Entity implements Solid
   {
      
      // method body index: 4575 method index: 4945
      public static const RIGHT:uint = // method body index: 4575 method index: 4945
      0;
      
      public static const LEFT:uint = // method body index: 4575 method index: 4945
      1;
      
      private var _floorRight:Number;
      
      private var _floorLeft:Number;
      
      private var _body:Rectangle = // method body index: 4577 method index: 4947
      new Rectangle(32,32);
      
      public function Slope(param1:int, param2:int, param3:uint)
      {
         // method body index: 4577 method index: 4947
         super(int(param1 + Constants.TILE_WIDTH / 2),int(param2 + Constants.TILE_HEIGHT / 2));
         if(param3 == RIGHT)
         {
            this._floorLeft = 0;
            this._floorRight = Constants.TILE_HEIGHT - 1;
         }
         else
         {
            this._floorRight = 0;
            this._floorLeft = Constants.TILE_HEIGHT - 1;
         }
         groups = Groups.SOLID | Groups.BLOCK | Groups.THICK;
         ON_DEBUG.add(this.onDebug);
      }
      
      public function get body() : Rectangle
      {
         // method body index: 4576 method index: 4946
         return this._body;
      }
      
      private function onDebug() : void
      {
         // method body index: 4578 method index: 4948
         var _loc1_:int = x - Constants.TILE_WIDTH / 2;
         Debug.drawLine(_loc1_,this.bottom - this._floorLeft,_loc1_ + Constants.TILE_WIDTH,this.bottom - this._floorRight,16776960,0.5,3);
         Debug.drawLine(_loc1_,this.bottom - this._floorLeft,_loc1_,this.bottom,16776960,0.5,3);
         Debug.drawLine(_loc1_ + Constants.TILE_WIDTH,this.bottom,_loc1_ + Constants.TILE_WIDTH,this.bottom - this._floorRight,16776960,0.5,3);
      }
      
      public function get floorLeft() : Number
      {
         // method body index: 4579 method index: 4949
         return this._floorLeft;
      }
      
      public function get floorRight() : Number
      {
         // method body index: 4580 method index: 4950
         return this._floorRight;
      }
      
      public function isObstacle(param1:int, param2:int) : Boolean
      {
         // method body index: 4581 method index: 4951
         return param1 == 1;
      }
      
      public function onStepped(param1:PlatformObject) : void
      {
         // method body index: 4582 method index: 4952
      }
      
      public function get bottom() : Number
      {
         // method body index: 4583 method index: 4953
         return y + Constants.TILE_HEIGHT / 2;
      }
      
      public function get top() : Number
      {
         // method body index: 4584 method index: 4954
         return y - Constants.TILE_HEIGHT / 2;
      }
      
      public function onHit(param1:PlatformObject) : void
      {
         // method body index: 4585 method index: 4955
      }
      
      public function reset() : void
      {
         // method body index: 4586 method index: 4956
      }
   }
}

