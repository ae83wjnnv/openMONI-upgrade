package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.phys.ZPP_Body;
   
   public class ZNPNode_ZPP_Body
   {
      
      // method body index: 3722 method index: 4035
      public static var zpp_pool:ZNPNode_ZPP_Body = // method body index: 3724 method index: 4039
      null;
      
      public var next:ZNPNode_ZPP_Body;
      
      public var elt:ZPP_Body;
      
      public function ZNPNode_ZPP_Body()
      {
         // method body index: 3723 method index: 4034
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

