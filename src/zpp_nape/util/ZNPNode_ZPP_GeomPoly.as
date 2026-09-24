package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_GeomPoly;
   
   public class ZNPNode_ZPP_GeomPoly
   {
      
      // method body index: 2835 method index: 2853
      public static var zpp_pool:ZNPNode_ZPP_GeomPoly = // method body index: 2837 method index: 2857
      null;
      
      public var next:ZNPNode_ZPP_GeomPoly;
      
      public var elt:ZPP_GeomPoly;
      
      public function ZNPNode_ZPP_GeomPoly()
      {
         // method body index: 2836 method index: 2852
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

