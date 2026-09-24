package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_GeomVert;
   
   public class ZNPNode_ZPP_GeomVert
   {
      
      // method body index: 3247 method index: 3451
      public static var zpp_pool:ZNPNode_ZPP_GeomVert = // method body index: 3249 method index: 3455
      null;
      
      public var next:ZNPNode_ZPP_GeomVert;
      
      public var elt:ZPP_GeomVert;
      
      public function ZNPNode_ZPP_GeomVert()
      {
         // method body index: 3248 method index: 3450
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

