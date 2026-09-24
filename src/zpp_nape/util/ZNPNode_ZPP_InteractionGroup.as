package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.dynamics.ZPP_InteractionGroup;
   
   public class ZNPNode_ZPP_InteractionGroup
   {
      
      // method body index: 3049 method index: 3161
      public static var zpp_pool:ZNPNode_ZPP_InteractionGroup = // method body index: 3051 method index: 3165
      null;
      
      public var next:ZNPNode_ZPP_InteractionGroup;
      
      public var elt:ZPP_InteractionGroup;
      
      public function ZNPNode_ZPP_InteractionGroup()
      {
         // method body index: 3050 method index: 3160
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

