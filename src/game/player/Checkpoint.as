package game.player
{
   import flash.geom.Rectangle;
   import flashpunk2.Entity;
   import flashpunk2.components.rendering.AnimationRenderer;
   import game.UserData;
   import game.world.PlatformLevel;
   import sound.SoundManager;
   
   public class Checkpoint extends Entity
   {
      
      private var body:Rectangle;
      
      private var image:AnimationRenderer;
      
      public function Checkpoint(param1:int, param2:int)
      {
         // method body index: 2617 method index: 2631
         super(param1,param2,this.onUpdate);
         add(this.image = new AnimationRenderer());
         this.image.addPrefix("off","environment/checkpointOff",10,true);
         this.image.addPrefix("on","environment/checkpointOn",10,true);
         this.body = new Rectangle(param1,param2,32,64);
         ON_START.add(this.onStart);
         depth = 5;
      }
      
      private function onStart() : void
      {
         // method body index: 2618 method index: 2632
         if(UserData.isCheckpoint(world as PlatformLevel))
         {
            this.image.play("on");
         }
         else
         {
            this.image.play("off");
         }
      }
      
      private function onUpdate() : void
      {
         // method body index: 2619 method index: 2633
         if((world as PlatformLevel).player.body.intersects(this.body))
         {
            ON_UPDATE.remove(this.onUpdate);
            UserData.setCheckpoint((world as PlatformLevel).x,(world as PlatformLevel).y);
            this.image.play("on");
            SoundManager.playSound("checkpoint");
         }
      }
   }
}

