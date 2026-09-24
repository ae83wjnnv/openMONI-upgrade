package game.environment
{
   import flashpunk2.components.rendering.ImageRenderer;
   import flashpunk2.global.Debug;
   
   public class OneWay extends Wall
   {
      
      public function OneWay(param1:int, param2:int)
      {
         // method body index: 2527 method index: 2541
         super(param1,param2,32,32);
         image = new ImageRenderer("environment/oneWay",true);
         add(image);
         ON_START.add(this.onStart);
         depth = 1;
      }
      
      private function onStart() : void
      {
         // method body index: 2528 method index: 2542
         level.setSolid(x / 32,y / 32,this);
      }
      
      override protected function onDebug() : void
      {
         // method body index: 2529 method index: 2543
         Debug.drawRect(x + body.x,y + body.y,body.width,body.height / 2,16742144,0.5);
      }
      
      override public function isObstacle(param1:int, param2:int) : Boolean
      {
         // method body index: 2530 method index: 2544
         return level.player.body.bottom <= body.top + y + 1 && param2 > 0 && param1 == 1;
      }
   }
}

