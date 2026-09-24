package zpp_nape.util
{
   import flash.Boot;
   import nape.geom.RayResult;
   
   public class ZNPList_RayResult
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_RayResult;
      
      public function ZNPList_RayResult()
      {
         // method body index: 6640 method index: 7171
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:RayResult) : Boolean
      {
         // method body index: 6617 method index: 7173
         var _loc2_:ZNPNode_RayResult = null;
         var _loc3_:ZNPNode_RayResult = head;
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
      
      public function splice(param1:ZNPNode_RayResult, param2:int) : ZNPNode_RayResult
      {
         // method body index: 6618 method index: 7174
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6619 method index: 7175
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6620 method index: 7177
         var _loc3_:* = null as ZNPNode_RayResult;
         var _loc1_:ZNPNode_RayResult = head;
         var _loc2_:ZNPNode_RayResult = null;
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
      
      public function remove(param1:RayResult) : void
      {
         // method body index: 6621 method index: 7178
         var _loc5_:* = null as ZNPNode_RayResult;
         var _loc6_:* = null as ZNPNode_RayResult;
         var _loc7_:* = null as ZNPNode_RayResult;
         var _loc2_:ZNPNode_RayResult = null;
         var _loc3_:ZNPNode_RayResult = head;
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
               _loc7_.next = ZNPNode_RayResult.zpp_pool;
               ZNPNode_RayResult.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : RayResult
      {
         // method body index: 6622 method index: 7179
         var _loc1_:RayResult = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6623 method index: 7180
         var _loc1_:ZNPNode_RayResult = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_RayResult = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_RayResult.zpp_pool;
         ZNPNode_RayResult.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_RayResult
      {
         // method body index: 6624 method index: 7181
         var _loc2_:ZNPNode_RayResult = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_RayResult, param2:RayResult) : ZNPNode_RayResult
      {
         // method body index: 6625 method index: 7182
         var _loc4_:* = null as ZNPNode_RayResult;
         if(ZNPNode_RayResult.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_RayResult();
         }
         else
         {
            _loc4_ = ZNPNode_RayResult.zpp_pool;
            ZNPNode_RayResult.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_RayResult = _loc4_;
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
      
      public function inlined_pop_unsafe() : RayResult
      {
         // method body index: 6626 method index: 7185
         var _loc1_:RayResult = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6627 method index: 7186
         var _loc1_:ZNPNode_RayResult = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_RayResult = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_RayResult.zpp_pool;
         ZNPNode_RayResult.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_RayResult, param2:RayResult) : ZNPNode_RayResult
      {
         // method body index: 6628 method index: 7187
         var _loc4_:* = null as ZNPNode_RayResult;
         if(ZNPNode_RayResult.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_RayResult();
         }
         else
         {
            _loc4_ = ZNPNode_RayResult.zpp_pool;
            ZNPNode_RayResult.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_RayResult = _loc4_;
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
      
      public function inlined_has(param1:RayResult) : Boolean
      {
         // method body index: 6629 method index: 7188
         var _loc4_:* = null as RayResult;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_RayResult = head;
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
      
      public function inlined_erase(param1:ZNPNode_RayResult) : ZNPNode_RayResult
      {
         // method body index: 6630 method index: 7189
         var _loc2_:* = null as ZNPNode_RayResult;
         var _loc3_:* = null as ZNPNode_RayResult;
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
         var _loc4_:ZNPNode_RayResult = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_RayResult.zpp_pool;
         ZNPNode_RayResult.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6631 method index: 7190
         var _loc1_:* = null as ZNPNode_RayResult;
         var _loc2_:* = null as ZNPNode_RayResult;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_RayResult.zpp_pool;
            ZNPNode_RayResult.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:RayResult) : RayResult
      {
         // method body index: 6632 method index: 7191
         var _loc3_:* = null as ZNPNode_RayResult;
         if(ZNPNode_RayResult.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_RayResult();
         }
         else
         {
            _loc3_ = ZNPNode_RayResult.zpp_pool;
            ZNPNode_RayResult.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_RayResult = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:RayResult) : Boolean
      {
         // method body index: 6633 method index: 7192
         var _loc4_:* = null as RayResult;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_RayResult = head;
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
      
      public function erase(param1:ZNPNode_RayResult) : ZNPNode_RayResult
      {
         // method body index: 6634 method index: 7194
         var _loc2_:* = null as ZNPNode_RayResult;
         var _loc3_:* = null as ZNPNode_RayResult;
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
         var _loc4_:ZNPNode_RayResult = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_RayResult.zpp_pool;
         ZNPNode_RayResult.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6635 method index: 7196
         var _loc1_:* = null as ZNPNode_RayResult;
         var _loc2_:* = null as ZNPNode_RayResult;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_RayResult.zpp_pool;
            ZNPNode_RayResult.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : RayResult
      {
         // method body index: 6636 method index: 7198
         var _loc1_:ZNPNode_RayResult = head;
         var _loc2_:ZNPNode_RayResult = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : RayResult
      {
         // method body index: 6637 method index: 7199
         var _loc2_:ZNPNode_RayResult = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_RayResult) : void
      {
         // method body index: 6638 method index: 7200
         var _loc3_:* = null as RayResult;
         var _loc2_:ZNPNode_RayResult = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:RayResult) : RayResult
      {
         // method body index: 6639 method index: 7201
         var _loc3_:* = null as ZNPNode_RayResult;
         if(ZNPNode_RayResult.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_RayResult();
         }
         else
         {
            _loc3_ = ZNPNode_RayResult.zpp_pool;
            ZNPNode_RayResult.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_RayResult = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

