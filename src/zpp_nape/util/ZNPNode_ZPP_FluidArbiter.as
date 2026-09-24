package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.dynamics.ZPP_FluidArbiter;
   
   public class ZNPNode_ZPP_FluidArbiter
   {
      
      // method body index: 3108 method index: 3241
      public static var zpp_pool:ZNPNode_ZPP_FluidArbiter = // method body index: 3110 method index: 3245
      null;
      
      public var next:ZNPNode_ZPP_FluidArbiter;
      
      public var elt:ZPP_FluidArbiter;
      
      public function ZNPNode_ZPP_FluidArbiter()
      {
         // method body index: 3109 method index: 3240
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

