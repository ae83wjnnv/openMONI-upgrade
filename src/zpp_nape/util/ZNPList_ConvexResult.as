package zpp_nape.util
{
   import flash.Boot;
   import nape.geom.ConvexResult;
   
   public class ZNPList_ConvexResult
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ConvexResult;
      
      public function ZNPList_ConvexResult()
      {
         // method body index: 6317 method index: 6816
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ConvexResult) : Boolean
      {
         // method body index: 6294 method index: 6818
         var _loc2_:ZNPNode_ConvexResult = null;
         var _loc3_:ZNPNode_ConvexResult = head;
         var _loc4_:Boolean = false;
         while(_loc3_ != null)
         {
            if(_loc3_.elt == param1)
            {
               erase(_loc2_);
               _loc4_ = true;
               break;
            }
            _loc2_ = _loc3_;
            _loc3_ = _loc3_.next;
         }
         return _loc4_;
      }
      
      public function splice(param1:ZNPNode_ConvexResult, param2:int) : ZNPNode_ConvexResult
      {
         // method body index: 6295 method index: 6819
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6296 method index: 6820
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6297 method index: 6822
         var _loc3_:* = null as ZNPNode_ConvexResult;
         var _loc1_:ZNPNode_ConvexResult = head;
         var _loc2_:ZNPNode_ConvexResult = null;
         while(_loc1_ != null)
         {
            _loc3_ = _loc1_.next;
            _loc1_.next = _loc2_;
            head = _loc1_;
            _loc2_ = _loc1_;
            _loc1_ = _loc3_;
         }
         modified = true;
         pushmod = true;
      }
      
      public function remove(param1:ConvexResult) : void
      {
         // method body index: 6298 method index: 6823
         var _loc5_:* = null as ZNPNode_ConvexResult;
         var _loc6_:* = null as ZNPNode_ConvexResult;
         var _loc7_:* = null as ZNPNode_ConvexResult;
         var _loc2_:ZNPNode_ConvexResult = null;
         var _loc3_:ZNPNode_ConvexResult = head;
         var _loc4_:Boolean = false;
         while(_loc3_ != null)
         {
            if(_loc3_.elt == param1)
            {
               if(_loc2_ == null)
               {
                  _loc5_ = head;
                  _loc6_ = _loc5_.next;
                  head = _loc6_;
                  if(head == null)
                  {
                     pushmod = true;
                  }
               }
               else
               {
                  _loc5_ = _loc2_.next;
                  _loc6_ = _loc5_.next;
                  _loc2_.next = _loc6_;
                  if(_loc6_ == null)
                  {
                     pushmod = true;
                  }
               }
               _loc7_ = _loc5_;
               _loc7_.elt = null;
               _loc7_.next = ZNPNode_ConvexResult.zpp_pool;
               ZNPNode_ConvexResult.zpp_pool = _loc7_;
               modified = true;
               --length;
               pushmod = true;
               _loc6_;
               _loc4_ = true;
               break;
            }
            _loc2_ = _loc3_;
            _loc3_ = _loc3_.next;
         }
         _loc4_;
      }
      
      public function pop_unsafe() : ConvexResult
      {
         // method body index: 6299 method index: 6824
         var _loc1_:ConvexResult = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6300 method index: 6825
         var _loc1_:ZNPNode_ConvexResult = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ConvexResult = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ConvexResult.zpp_pool;
         ZNPNode_ConvexResult.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ConvexResult
      {
         // method body index: 6301 method index: 6826
         var _loc2_:ZNPNode_ConvexResult = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ConvexResult, param2:ConvexResult) : ZNPNode_ConvexResult
      {
         // method body index: 6302 method index: 6827
         var _loc4_:* = null as ZNPNode_ConvexResult;
         if(ZNPNode_ConvexResult.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ConvexResult();
         }
         else
         {
            _loc4_ = ZNPNode_ConvexResult.zpp_pool;
            ZNPNode_ConvexResult.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ConvexResult = _loc4_;
         if(param1 == null)
         {
            _loc3_.next = head;
            head = _loc3_;
         }
         else
         {
            _loc3_.next = param1.next;
            param1.next = _loc3_;
         }
         pushmod = modified = true;
         ++length;
         return _loc3_;
      }
      
      public function inlined_pop_unsafe() : ConvexResult
      {
         // method body index: 6303 method index: 6830
         var _loc1_:ConvexResult = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6304 method index: 6831
         var _loc1_:ZNPNode_ConvexResult = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ConvexResult = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ConvexResult.zpp_pool;
         ZNPNode_ConvexResult.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ConvexResult, param2:ConvexResult) : ZNPNode_ConvexResult
      {
         // method body index: 6305 method index: 6832
         var _loc4_:* = null as ZNPNode_ConvexResult;
         if(ZNPNode_ConvexResult.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ConvexResult();
         }
         else
         {
            _loc4_ = ZNPNode_ConvexResult.zpp_pool;
            ZNPNode_ConvexResult.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ConvexResult = _loc4_;
         if(param1 == null)
         {
            _loc3_.next = head;
            head = _loc3_;
         }
         else
         {
            _loc3_.next = param1.next;
            param1.next = _loc3_;
         }
         pushmod = modified = true;
         ++length;
         return _loc3_;
      }
      
      public function inlined_has(param1:ConvexResult) : Boolean
      {
         // method body index: 6306 method index: 6833
         var _loc4_:* = null as ConvexResult;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ConvexResult = head;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_.elt;
            if(_loc4_ == param1)
            {
               _loc2_ = true;
               break;
            }
            _loc3_ = _loc3_.next;
         }
         return _loc2_;
      }
      
      public function inlined_erase(param1:ZNPNode_ConvexResult) : ZNPNode_ConvexResult
      {
         // method body index: 6307 method index: 6834
         var _loc2_:* = null as ZNPNode_ConvexResult;
         var _loc3_:* = null as ZNPNode_ConvexResult;
         if(param1 == null)
         {
            _loc2_ = head;
            _loc3_ = _loc2_.next;
            head = _loc3_;
            if(head == null)
            {
               pushmod = true;
            }
         }
         else
         {
            _loc2_ = param1.next;
            _loc3_ = _loc2_.next;
            param1.next = _loc3_;
            if(_loc3_ == null)
            {
               pushmod = true;
            }
         }
         var _loc4_:ZNPNode_ConvexResult = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ConvexResult.zpp_pool;
         ZNPNode_ConvexResult.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6308 method index: 6835
         var _loc1_:* = null as ZNPNode_ConvexResult;
         var _loc2_:* = null as ZNPNode_ConvexResult;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ConvexResult.zpp_pool;
            ZNPNode_ConvexResult.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ConvexResult) : ConvexResult
      {
         // method body index: 6309 method index: 6836
         var _loc3_:* = null as ZNPNode_ConvexResult;
         if(ZNPNode_ConvexResult.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ConvexResult();
         }
         else
         {
            _loc3_ = ZNPNode_ConvexResult.zpp_pool;
            ZNPNode_ConvexResult.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ConvexResult = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ConvexResult) : Boolean
      {
         // method body index: 6310 method index: 6837
         var _loc4_:* = null as ConvexResult;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ConvexResult = head;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_.elt;
            if(_loc4_ == param1)
            {
               _loc2_ = true;
               break;
            }
            _loc3_ = _loc3_.next;
         }
         return _loc2_;
      }
      
      public function erase(param1:ZNPNode_ConvexResult) : ZNPNode_ConvexResult
      {
         // method body index: 6311 method index: 6839
         var _loc2_:* = null as ZNPNode_ConvexResult;
         var _loc3_:* = null as ZNPNode_ConvexResult;
         if(param1 == null)
         {
            _loc2_ = head;
            _loc3_ = _loc2_.next;
            head = _loc3_;
            if(head == null)
            {
               pushmod = true;
            }
         }
         else
         {
            _loc2_ = param1.next;
            _loc3_ = _loc2_.next;
            param1.next = _loc3_;
            if(_loc3_ == null)
            {
               pushmod = true;
            }
         }
         var _loc4_:ZNPNode_ConvexResult = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ConvexResult.zpp_pool;
         ZNPNode_ConvexResult.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6312 method index: 6841
         var _loc1_:* = null as ZNPNode_ConvexResult;
         var _loc2_:* = null as ZNPNode_ConvexResult;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ConvexResult.zpp_pool;
            ZNPNode_ConvexResult.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ConvexResult
      {
         // method body index: 6313 method index: 6843
         var _loc1_:ZNPNode_ConvexResult = head;
         var _loc2_:ZNPNode_ConvexResult = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ConvexResult
      {
         // method body index: 6314 method index: 6844
         var _loc2_:ZNPNode_ConvexResult = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ConvexResult) : void
      {
         // method body index: 6315 method index: 6845
         var _loc3_:* = null as ConvexResult;
         var _loc2_:ZNPNode_ConvexResult = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ConvexResult) : ConvexResult
      {
         // method body index: 6316 method index: 6846
         var _loc3_:* = null as ZNPNode_ConvexResult;
         if(ZNPNode_ConvexResult.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ConvexResult();
         }
         else
         {
            _loc3_ = ZNPNode_ConvexResult.zpp_pool;
            ZNPNode_ConvexResult.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ConvexResult = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

