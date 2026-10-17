package com.jpexs.decompiler.flash.debugger
{
   import flash.display.MovieClip;
   
   public class DebugMain extends MovieClip
   {
      
      public function DebugMain()
      {
         // method body index: 47 method index: 47
         super();
         debugAlert("vixe deu erro!");
         debugConsole("uuuuu entrou!");
         debugSocket("È... eu sei o que eu escrevo aqui!");
         debugTrace("leia isso!");
         var _loc1_:DebugLoader = new DebugLoader();
         var _loc2_:* = debugGetDefinitionByName("flash.display.Loader");
         debugDescribeType(_loc2_);
         var _loc3_:* = debugGetQualifiedClassName(_loc2_);
         var _loc4_:* = debugGetQualifiedSuperclassName(_loc2_);
      }
   }
}

