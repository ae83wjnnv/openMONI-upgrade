package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_CbType;
   
   public class ZNPNode_ZPP_CbType
   {
      
      // method body index: 3185 method index: 3360
      public static var zpp_pool:ZNPNode_ZPP_CbType = // method body index: 3187 method index: 3364
      null;
      
      public var next:ZNPNode_ZPP_CbType;
      
      public var elt:ZPP_CbType;
      
      public function ZNPNode_ZPP_CbType()
      {
         // method body index: 3186 method index: 3359
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

