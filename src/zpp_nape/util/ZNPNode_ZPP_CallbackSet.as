package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.space.ZPP_CallbackSet;
   
   public class ZNPNode_ZPP_CallbackSet
   {
      
      // method body index: 2952 method index: 3048
      public static var zpp_pool:ZNPNode_ZPP_CallbackSet = // method body index: 2954 method index: 3052
      null;
      
      public var next:ZNPNode_ZPP_CallbackSet;
      
      public var elt:ZPP_CallbackSet;
      
      public function ZNPNode_ZPP_CallbackSet()
      {
         // method body index: 2953 method index: 3047
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

