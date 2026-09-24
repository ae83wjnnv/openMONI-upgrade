package zpp_nape.util
{
   import flash.Boot;
   import nape.geom.RayResult;
   
   public class ZNPNode_RayResult
   {
      
      // method body index: 3402 method index: 3639
      public static var zpp_pool:ZNPNode_RayResult = // method body index: 3404 method index: 3643
      null;
      
      public var next:ZNPNode_RayResult;
      
      public var elt:RayResult;
      
      public function ZNPNode_RayResult()
      {
         // method body index: 3403 method index: 3638
         if(Boot.skip_constructor)
         {
            return;
         }
         elt = null;
         next = null;
      }
   }
}

