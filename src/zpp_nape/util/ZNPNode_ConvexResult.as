package zpp_nape.util
{
   import flash.Boot;
   import nape.geom.ConvexResult;
   
   public class ZNPNode_ConvexResult
   {
      
      // method body index: 2907 method index: 2975
      public static var zpp_pool:ZNPNode_ConvexResult = // method body index: 2909 method index: 2979
      null;
      
      public var next:ZNPNode_ConvexResult;
      
      public var elt:ConvexResult;
      
      public function ZNPNode_ConvexResult()
      {
         // method body index: 2908 method index: 2974
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

