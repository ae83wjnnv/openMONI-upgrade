package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_PartitionedPoly;
   
   public class ZNPNode_ZPP_PartitionedPoly
   {
      
      // method body index: 2949 method index: 3042
      public static var zpp_pool:ZNPNode_ZPP_PartitionedPoly = // method body index: 2951 method index: 3046
      null;
      
      public var next:ZNPNode_ZPP_PartitionedPoly;
      
      public var elt:ZPP_PartitionedPoly;
      
      public function ZNPNode_ZPP_PartitionedPoly()
      {
         // method body index: 2950 method index: 3041
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

