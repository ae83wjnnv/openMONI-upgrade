package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_Listener;
   
   public class ZNPNode_ZPP_Listener
   {
      
      // method body index: 3132 method index: 3282
      public static var zpp_pool:ZNPNode_ZPP_Listener = // method body index: 3134 method index: 3286
      null;
      
      public var next:ZNPNode_ZPP_Listener;
      
      public var elt:ZPP_Listener;
      
      public function ZNPNode_ZPP_Listener()
      {
         // method body index: 3133 method index: 3281
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

