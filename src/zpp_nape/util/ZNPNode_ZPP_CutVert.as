package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_CutVert;
   
   public class ZNPNode_ZPP_CutVert
   {
      
      // method body index: 3337 method index: 3555
      public static var zpp_pool:ZNPNode_ZPP_CutVert = // method body index: 3339 method index: 3559
      null;
      
      public var next:ZNPNode_ZPP_CutVert;
      
      public var elt:ZPP_CutVert;
      
      public function ZNPNode_ZPP_CutVert()
      {
         // method body index: 3338 method index: 3554
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

