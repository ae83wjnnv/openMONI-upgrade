package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_CbSetPair;
   
   public class ZNPNode_ZPP_CbSetPair
   {
      
      // method body index: 3176 method index: 3348
      public static var zpp_pool:ZNPNode_ZPP_CbSetPair = // method body index: 3178 method index: 3352
      null;
      
      public var next:ZNPNode_ZPP_CbSetPair;
      
      public var elt:ZPP_CbSetPair;
      
      public function ZNPNode_ZPP_CbSetPair()
      {
         // method body index: 3177 method index: 3347
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

