package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_CutInt;
   
   public class ZNPNode_ZPP_CutInt
   {
      
      // method body index: 2955 method index: 3054
      public static var zpp_pool:ZNPNode_ZPP_CutInt = // method body index: 2957 method index: 3058
      null;
      
      public var next:ZNPNode_ZPP_CutInt;
      
      public var elt:ZPP_CutInt;
      
      public function ZNPNode_ZPP_CutInt()
      {
         // method body index: 2956 method index: 3053
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

