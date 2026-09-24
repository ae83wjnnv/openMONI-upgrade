package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_CbSet;
   
   public class ZNPNode_ZPP_CbSet
   {
      
      // method body index: 3645 method index: 3936
      public static var zpp_pool:ZNPNode_ZPP_CbSet = // method body index: 3647 method index: 3940
      null;
      
      public var next:ZNPNode_ZPP_CbSet;
      
      public var elt:ZPP_CbSet;
      
      public function ZNPNode_ZPP_CbSet()
      {
         // method body index: 3646 method index: 3935
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

