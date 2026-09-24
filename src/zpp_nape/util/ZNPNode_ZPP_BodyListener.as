package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_BodyListener;
   
   public class ZNPNode_ZPP_BodyListener
   {
      
      // method body index: 3073 method index: 3188
      public static var zpp_pool:ZNPNode_ZPP_BodyListener = // method body index: 3075 method index: 3192
      null;
      
      public var next:ZNPNode_ZPP_BodyListener;
      
      public var elt:ZPP_BodyListener;
      
      public function ZNPNode_ZPP_BodyListener()
      {
         // method body index: 3074 method index: 3187
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

