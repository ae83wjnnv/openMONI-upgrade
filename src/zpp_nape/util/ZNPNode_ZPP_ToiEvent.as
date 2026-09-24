package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_ToiEvent;
   
   public class ZNPNode_ZPP_ToiEvent
   {
      
      // method body index: 3129 method index: 3276
      public static var zpp_pool:ZNPNode_ZPP_ToiEvent = // method body index: 3131 method index: 3280
      null;
      
      public var next:ZNPNode_ZPP_ToiEvent;
      
      public var elt:ZPP_ToiEvent;
      
      public function ZNPNode_ZPP_ToiEvent()
      {
         // method body index: 3130 method index: 3275
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

