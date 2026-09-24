package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_InteractionListener;
   
   public class ZNPNode_ZPP_InteractionListener
   {
      
      // method body index: 3516 method index: 3786
      public static var zpp_pool:ZNPNode_ZPP_InteractionListener = // method body index: 3518 method index: 3790
      null;
      
      public var next:ZNPNode_ZPP_InteractionListener;
      
      public var elt:ZPP_InteractionListener;
      
      public function ZNPNode_ZPP_InteractionListener()
      {
         // method body index: 3517 method index: 3785
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

