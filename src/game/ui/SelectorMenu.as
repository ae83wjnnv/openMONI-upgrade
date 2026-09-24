package game.ui
{
   import flash.geom.Rectangle;
   import flashpunk2.Entity;
   import flashpunk2.components.rendering.BitmapTextRenderer;
   import flashpunk2.components.rendering.ImageRenderer;
   import flashpunk2.components.rendering.Renderer;
   import flashpunk2.global.Calc;
   import flashpunk2.global.Ease;
   import flashpunk2.global.Rand;
   import flashpunk2.namespaces.fp_internal;
   import game.Constants;
   import game.Controls;
   import sound.SoundManager;
   
   use namespace fp_internal;
   
   public class SelectorMenu extends Entity
   {
      
      // method body index: 1167 method index: 1167
      private static const BORDER:Number = // method body index: 1167 method index: 1167
      20;
      
      private static const WIDTH:Number = // method body index: 1167 method index: 1167
      200;
      
      private static const TEXT_H:Number = // method body index: 1167 method index: 1167
      22;
      
      public var justGotBack:Boolean = false;
      
      private var HEIGHT:int;
      
      private var options:Vector.<String>;
      
      private var functions:Vector.<Function>;
      
      private var defaultFunction:Function;
      
      public var selection:int;
      
      private var optionsText:Vector.<Button>;
      
      private var pressed:Boolean = false;
      
      private var chosen:Boolean = false;
      
      private var textScale:Number = 1;
      
      private var images:Boolean;
      
      public function SelectorMenu(param1:Vector.<String>, param2:Vector.<Function>, param3:Function, param4:Boolean = false, param5:Boolean = false)
      {
         // method body index: 1170 method index: 1170
         var i:int;
         var bArea:Rectangle = null;
         var s:String = null;
         var button:Button = null;
         var imageBtn:ImageRenderer = null;
         var text:BitmapTextRenderer = null;
         var options:Vector.<String> = param1;
         var functions:Vector.<Function> = param2;
         var defaultFunction:Function = param3;
         var autoInit:Boolean = param4;
         var images:Boolean = param5;
         this.optionsText = new Vector.<Button>();
         super();
         this.images = images;
         this.defaultFunction = defaultFunction;
         this.functions = functions;
         this.options = options;
         this.HEIGHT = options.length * TEXT_H + BORDER * 2;
         i = 0;
         for each(s in options)
         {
            if(images)
            {
               imageBtn = new ImageRenderer("interface/" + s,true);
               bArea = new Rectangle(Constants.STAGE_WIDTH / 2,this.y - this.HEIGHT / 2 + BORDER + TEXT_H * i + 50 - TEXT_H / 2,imageBtn.width,imageBtn.height - 10);
            }
            else
            {
               text = new BitmapTextRenderer(Constants.STAGE_WIDTH,32,s,"font",Constants.TEXT_SIZE,16777215,true);
               text.alpha = 0;
               bArea = new Rectangle(Constants.STAGE_WIDTH / 2 - 50,this.y - this.HEIGHT / 2 + BORDER + TEXT_H * i + 20 - TEXT_H / 2,100,TEXT_H);
            }
            button = new Button(x + bArea.x + 50,bArea.y + TEXT_H / 2,imageBtn ? imageBtn : text,null,bArea);
            if(!images)
            {
               button.overScale = 2;
            }
            else
            {
               button.body.x += 50;
               button.body.y += 20;
            }
            button.index = i;
            button.onHoverIn = function(param1:Button):// method body index: 1168 method index: 1168
            void
            {
               // method body index: 1168 method index: 1168
               selection = param1.index;
               SoundManager.playSound("menuSelect");
            };
            button.onPressed = function(param1:Button):// method body index: 1169 method index: 1169
            void
            {
               // method body index: 1169 method index: 1169
               selection = param1.index;
               ConfirmSelection();
            };
            this.optionsText.push(button);
            i++;
         }
         this.depth = -100;
         if(autoInit)
         {
            ON_START.add(this.init);
         }
      }
      
      override public function removeSelf() : void
      {
         // method body index: 1171 method index: 1171
         var _loc1_:Button = null;
         super.removeSelf();
         for each(_loc1_ in this.optionsText)
         {
            _loc1_.removeSelf();
         }
      }
      
      public function init() : void
      {
         // method body index: 1172 method index: 1172
         var _loc1_:Button = null;
         for each(_loc1_ in this.optionsText)
         {
            world.add(_loc1_);
            tween(_loc1_.image,Rand.getNumberRange(0.3,1.2)).to("alpha",1).ease(Rand.choose(Ease.bounceOut,Ease.elasticOut,Ease.sineOut));
         }
         ON_UPDATE.add(this.onUpdate);
      }
      
      private function onUpdate() : void
      {
         // method body index: 1173 method index: 1173
         var _loc1_:Button = null;
         SoundManager.refresh();
         for each(_loc1_ in this.optionsText)
         {
            _loc1_.update();
         }
         if(this.chosen)
         {
            return;
         }
         if((Controls.ATTACK.pressed || Controls.JUMP.pressed) && !this.justGotBack)
         {
            this.ConfirmSelection();
         }
         else
         {
            this.justGotBack = false;
         }
         if(Math.abs(Controls.AXIS.y) > 0.5)
         {
            if(!this.pressed)
            {
               this.selection += Calc.sign(Controls.AXIS.y);
               SoundManager.playSound("menuSelect");
               this.pressed = true;
            }
            if(this.selection > this.optionsText.length - 1)
            {
               this.selection = 0;
            }
            else if(this.selection < 0)
            {
               this.selection = this.optionsText.length - 1;
            }
         }
         else
         {
            this.pressed = false;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.optionsText.length)
         {
            this.optionsText[_loc2_].image.alpha = _loc2_ == this.selection ? 1 : 0.25;
            _loc2_++;
         }
      }
      
      public function alignButtons() : void
      {
         // method body index: 1174 method index: 1174
         var _loc2_:Button = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.optionsText)
         {
            if(!this.images)
            {
               _loc2_.image.setScale(this.textScale,this.textScale);
            }
            if(this.images)
            {
               _loc2_.y = this.y - this.HEIGHT / 2 + BORDER + _loc1_ * _loc2_.image.height + 20;
               _loc2_.x = Constants.STAGE_WIDTH / 2 + x - _loc2_.image.width;
            }
            else
            {
               _loc2_.y = this.y - this.HEIGHT / 2 + BORDER + TEXT_H * _loc1_ * this.textScale + 20;
               _loc2_.x = Constants.STAGE_WIDTH / 2 + x;
            }
            _loc1_++;
         }
      }
      
      private function ConfirmSelection() : void
      {
         // method body index: 1175 method index: 1175
         this.chosen = true;
         if(this.defaultFunction != null)
         {
            this.defaultFunction();
         }
         if(this.functions[this.selection] != null)
         {
            this.functions[this.selection]();
         }
         SoundManager.playSound("menuAccept");
      }
      
      override public function get height() : Number
      {
         // method body index: 1176 method index: 1176
         return this.HEIGHT;
      }
      
      public function reset() : void
      {
         // method body index: 1177 method index: 1177
         this.chosen = false;
         activate();
         this.justGotBack = true;
      }
      
      public function setTextScale(param1:Number) : void
      {
         // method body index: 1178 method index: 1178
         this.textScale = param1;
         this.alignButtons();
      }
      
      override public function get y() : Number
      {
         // method body index: 1179 method index: 1179
         return super.y;
      }
      
      override public function set y(param1:Number) : void
      {
         // method body index: 1180 method index: 1180
         super.y = param1;
         this.alignButtons();
      }
      
      override public function set depth(param1:int) : void
      {
         // method body index: 1181 method index: 1181
         var _loc2_:Button = null;
         super.depth = param1;
         for each(_loc2_ in this.optionsText)
         {
            _loc2_.depth = depth;
         }
      }
   }
}

