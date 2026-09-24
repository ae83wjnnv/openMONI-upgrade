package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.dynamics.ZPP_ColArbiter;
   
   public class ZNPNode_ZPP_ColArbiter
   {
      
      // method body index: 3162 method index: 3324
      public static var zpp_pool:ZNPNode_ZPP_ColArbiter = // method body index: 3164 method index: 3328
      null;
      
      public var next:ZNPNode_ZPP_ColArbiter;
      
      public var elt:ZPP_ColArbiter;
      
      public function ZNPNode_ZPP_ColArbiter()
      {
         // method body index: 3163 method index: 3323
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

