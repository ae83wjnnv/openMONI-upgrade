package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_PartitionVertex;
   
   public class ZNPNode_ZPP_PartitionVertex
   {
      
      // method body index: 3096 method index: 3220
      public static var zpp_pool:ZNPNode_ZPP_PartitionVertex = // method body index: 3098 method index: 3224
      null;
      
      public var next:ZNPNode_ZPP_PartitionVertex;
      
      public var elt:ZPP_PartitionVertex;
      
      public function ZNPNode_ZPP_PartitionVertex()
      {
         // method body index: 3097 method index: 3219
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

