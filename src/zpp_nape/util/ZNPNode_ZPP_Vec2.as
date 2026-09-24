package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_Vec2;
   
   public class ZNPNode_ZPP_Vec2
   {
      
      // method body index: 3334 method index: 3549
      public static var zpp_pool:ZNPNode_ZPP_Vec2 = // method body index: 3336 method index: 3553
      null;
      
      public var next:ZNPNode_ZPP_Vec2;
      
      public var elt:ZPP_Vec2;
      
      public function ZNPNode_ZPP_Vec2()
      {
         // method body index: 3335 method index: 3548
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

