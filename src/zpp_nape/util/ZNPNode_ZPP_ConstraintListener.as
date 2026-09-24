package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_ConstraintListener;
   
   public class ZNPNode_ZPP_ConstraintListener
   {
      
      // method body index: 3356 method index: 3582
      public static var zpp_pool:ZNPNode_ZPP_ConstraintListener = // method body index: 3358 method index: 3586
      null;
      
      public var next:ZNPNode_ZPP_ConstraintListener;
      
      public var elt:ZPP_ConstraintListener;
      
      public function ZNPNode_ZPP_ConstraintListener()
      {
         // method body index: 3357 method index: 3581
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

