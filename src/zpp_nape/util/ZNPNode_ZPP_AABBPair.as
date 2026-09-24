package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.space.ZPP_AABBPair;
   
   public class ZNPNode_ZPP_AABBPair
   {
      
      // method body index: 3523 method index: 3798
      public static var zpp_pool:ZNPNode_ZPP_AABBPair = // method body index: 3525 method index: 3802
      null;
      
      public var next:ZNPNode_ZPP_AABBPair;
      
      public var elt:ZPP_AABBPair;
      
      public function ZNPNode_ZPP_AABBPair()
      {
         // method body index: 3524 method index: 3797
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

