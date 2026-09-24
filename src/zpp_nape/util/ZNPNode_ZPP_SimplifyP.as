package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_SimplifyP;
   
   public class ZNPNode_ZPP_SimplifyP
   {
      
      // method body index: 3159 method index: 3318
      public static var zpp_pool:ZNPNode_ZPP_SimplifyP = // method body index: 3161 method index: 3322
      null;
      
      public var next:ZNPNode_ZPP_SimplifyP;
      
      public var elt:ZPP_SimplifyP;
      
      public function ZNPNode_ZPP_SimplifyP()
      {
         // method body index: 3160 method index: 3317
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

