package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.phys.ZPP_Interactor;
   
   public class ZNPNode_ZPP_Interactor
   {
      
      // method body index: 2910 method index: 2981
      public static var zpp_pool:ZNPNode_ZPP_Interactor = // method body index: 2912 method index: 2985
      null;
      
      public var next:ZNPNode_ZPP_Interactor;
      
      public var elt:ZPP_Interactor;
      
      public function ZNPNode_ZPP_Interactor()
      {
         // method body index: 2911 method index: 2980
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

