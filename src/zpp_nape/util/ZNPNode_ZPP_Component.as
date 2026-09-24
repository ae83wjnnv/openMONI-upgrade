package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.space.ZPP_Component;
   
   public class ZNPNode_ZPP_Component
   {
      
      // method body index: 3642 method index: 3930
      public static var zpp_pool:ZNPNode_ZPP_Component = // method body index: 3644 method index: 3934
      null;
      
      public var next:ZNPNode_ZPP_Component;
      
      public var elt:ZPP_Component;
      
      public function ZNPNode_ZPP_Component()
      {
         // method body index: 3643 method index: 3929
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

