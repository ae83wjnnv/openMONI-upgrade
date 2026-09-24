package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.phys.ZPP_Compound;
   
   public class ZNPNode_ZPP_Compound
   {
      
      // method body index: 2940 method index: 3022
      public static var zpp_pool:ZNPNode_ZPP_Compound = // method body index: 2942 method index: 3026
      null;
      
      public var next:ZNPNode_ZPP_Compound;
      
      public var elt:ZPP_Compound;
      
      public function ZNPNode_ZPP_Compound()
      {
         // method body index: 2941 method index: 3021
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

