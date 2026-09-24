package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.space.ZPP_AABBNode;
   
   public class ZNPNode_ZPP_AABBNode
   {
      
      // method body index: 2832 method index: 2847
      public static var zpp_pool:ZNPNode_ZPP_AABBNode = // method body index: 2834 method index: 2851
      null;
      
      public var next:ZNPNode_ZPP_AABBNode;
      
      public var elt:ZPP_AABBNode;
      
      public function ZNPNode_ZPP_AABBNode()
      {
         // method body index: 2833 method index: 2846
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

