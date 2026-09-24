package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.shape.ZPP_Edge;
   
   public class ZNPNode_ZPP_Edge
   {
      
      // method body index: 3173 method index: 3342
      public static var zpp_pool:ZNPNode_ZPP_Edge = // method body index: 3175 method index: 3346
      null;
      
      public var next:ZNPNode_ZPP_Edge;
      
      public var elt:ZPP_Edge;
      
      public function ZNPNode_ZPP_Edge()
      {
         // method body index: 3174 method index: 3341
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

