package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_SimpleEvent;
   
   public class ZNPNode_ZPP_SimpleEvent
   {
      
      // method body index: 3691 method index: 3999
      public static var zpp_pool:ZNPNode_ZPP_SimpleEvent = // method body index: 3693 method index: 4003
      null;
      
      public var next:ZNPNode_ZPP_SimpleEvent;
      
      public var elt:ZPP_SimpleEvent;
      
      public function ZNPNode_ZPP_SimpleEvent()
      {
         // method body index: 3692 method index: 3998
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

