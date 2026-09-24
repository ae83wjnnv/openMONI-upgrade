package game.fx
{
   import flashpunk2.Entity;
   import flashpunk2.components.rendering.RectRenderer;
   import flashpunk2.components.timing.Tween;
   
   public class ScreenFlash extends Entity
   {
      
      private var onComplete:Function;
      
      public function ScreenFlash(param1:Number = 0, param2:Number = 0, param3:uint = 16777215, param4:Function = null, param5:Number = 1)
      {
         // method body index: 2346 method index: 2351
         var fadeOutTween:Tween = null;
         var image:RectRenderer = null;
         var fadeInTween:Tween = null;
         var fadeOut:Number = param1;
         var fadeIn:Number = param2;
         var color:uint = param3;
         var onComplete:Function = param4;
         var maxAlpha:Number = param5;
         super();
         this.onComplete = onComplete;
         image = new RectRenderer(engine.width,engine.height,color,false);
         image.scroll = 0;
         add(image);
         if(fadeIn > 0)
         {
            fadeInTween = tween(image,fadeIn).from("alpha",0).to("alpha",maxAlpha).onComplete(function():// method body index: 2345 method index: 2350
            void
            {
               // method body index: 2345 method index: 2350
               fadeOutTween = tween(image,fadeOut).from("alpha",maxAlpha).to("alpha",0);
               if(fadeOutTween != null)
               {
                  fadeOutTween.onComplete(done);
               }
            });
         }
         else
         {
            fadeOutTween = tween(image,fadeOut).from("alpha",maxAlpha).to("alpha",0);
         }
         if(fadeInTween != null && fadeOut == 0)
         {
            fadeInTween.onComplete(this.done);
         }
         depth = -2000;
      }
      
      private function done() : void
      {
         // method body index: 2347 method index: 2352
         if(this.onComplete != null)
         {
            this.onComplete();
         }
         removeSelf();
      }
   }
}

