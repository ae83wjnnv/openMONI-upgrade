package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_SimpleVert;
   
   public class ZNPNode_ZPP_SimpleVert
   {
      
      // method body index: 2872 method index: 2895
      public static var zpp_pool:ZNPNode_ZPP_SimpleVert = // method body index: 2874 method index: 2899
      null;
      
      public var next:ZNPNode_ZPP_SimpleVert;
      
      public var elt:ZPP_SimpleVert;
      
      public function ZNPNode_ZPP_SimpleVert()
      {
         // method body index: 2873 method index: 2894
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

