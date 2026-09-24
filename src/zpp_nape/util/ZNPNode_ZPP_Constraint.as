package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.constraint.ZPP_Constraint;
   
   public class ZNPNode_ZPP_Constraint
   {
      
      // method body index: 3244 method index: 3445
      public static var zpp_pool:ZNPNode_ZPP_Constraint = // method body index: 3246 method index: 3449
      null;
      
      public var next:ZNPNode_ZPP_Constraint;
      
      public var elt:ZPP_Constraint;
      
      public function ZNPNode_ZPP_Constraint()
      {
         // method body index: 3245 method index: 3444
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

