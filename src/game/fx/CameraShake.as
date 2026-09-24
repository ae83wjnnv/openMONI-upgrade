package game.fx
{
   import flashpunk2.Entity;
   import flashpunk2.components.timing.Tween;
   import game.world.PlatformLevel;
   
   public class CameraShake extends Entity
   {
      
      public function CameraShake(param1:int, param2:Number)
      {
         // method body index: 4673 method index: 5043
         var timer:Tween = null;
         var amplitude:int = param1;
         var duration:Number = param2;
         super();
         timer = tween(this,duration).onComplete(this.destroy);
         ON_UPDATE.add(function():// method body index: 4672 method index: 5042
         void
         {
            // method body index: 4672 method index: 5042
            (world as PlatformLevel).cameraShake = amplitude * (1 - timer.percent);
         });
      }
      
      private function destroy() : void
      {
         // method body index: 4674 method index: 5044
         (world as PlatformLevel).cameraShake = 0;
         removeSelf();
      }
   }
}

