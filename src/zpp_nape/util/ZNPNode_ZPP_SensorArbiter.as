package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.dynamics.ZPP_SensorArbiter;
   
   public class ZNPNode_ZPP_SensorArbiter
   {
      
      // method body index: 2918 method index: 2993
      public static var zpp_pool:ZNPNode_ZPP_SensorArbiter = // method body index: 2920 method index: 2997
      null;
      
      public var next:ZNPNode_ZPP_SensorArbiter;
      
      public var elt:ZPP_SensorArbiter;
      
      public function ZNPNode_ZPP_SensorArbiter()
      {
         // method body index: 2919 method index: 2992
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

