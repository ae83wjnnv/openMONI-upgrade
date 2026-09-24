package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.dynamics.ZPP_Arbiter;
   
   public class ZNPNode_ZPP_Arbiter
   {
      
      // method body index: 3138 method index: 3291
      public static var zpp_pool:ZNPNode_ZPP_Arbiter = // method body index: 3140 method index: 3295
      null;
      
      public var next:ZNPNode_ZPP_Arbiter;
      
      public var elt:ZPP_Arbiter;
      
      public function ZNPNode_ZPP_Arbiter()
      {
         // method body index: 3139 method index: 3290
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

