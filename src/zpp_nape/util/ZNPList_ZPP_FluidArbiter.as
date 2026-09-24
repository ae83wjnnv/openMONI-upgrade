package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.dynamics.ZPP_FluidArbiter;
   
   public class ZNPList_ZPP_FluidArbiter
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_FluidArbiter;
      
      public function ZNPList_ZPP_FluidArbiter()
      {
         // method body index: 6193 method index: 6672
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_FluidArbiter) : Boolean
      {
         // method body index: 6170 method index: 6674
         var _loc2_:ZNPNode_ZPP_FluidArbiter = null;
         var _loc3_:ZNPNode_ZPP_FluidArbiter = head;
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
      
      public function splice(param1:ZNPNode_ZPP_FluidArbiter, param2:int) : ZNPNode_ZPP_FluidArbiter
      {
         // method body index: 6171 method index: 6675
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6172 method index: 6676
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6173 method index: 6678
         var _loc3_:* = null as ZNPNode_ZPP_FluidArbiter;
         var _loc1_:ZNPNode_ZPP_FluidArbiter = head;
         var _loc2_:ZNPNode_ZPP_FluidArbiter = null;
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
      
      public function remove(param1:ZPP_FluidArbiter) : void
      {
         // method body index: 6174 method index: 6679
         var _loc5_:* = null as ZNPNode_ZPP_FluidArbiter;
         var _loc6_:* = null as ZNPNode_ZPP_FluidArbiter;
         var _loc7_:* = null as ZNPNode_ZPP_FluidArbiter;
         var _loc2_:ZNPNode_ZPP_FluidArbiter = null;
         var _loc3_:ZNPNode_ZPP_FluidArbiter = head;
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
               _loc7_.next = ZNPNode_ZPP_FluidArbiter.zpp_pool;
               ZNPNode_ZPP_FluidArbiter.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_FluidArbiter
      {
         // method body index: 6175 method index: 6680
         var _loc1_:ZPP_FluidArbiter = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6176 method index: 6681
         var _loc1_:ZNPNode_ZPP_FluidArbiter = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_FluidArbiter = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_FluidArbiter.zpp_pool;
         ZNPNode_ZPP_FluidArbiter.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_FluidArbiter
      {
         // method body index: 6177 method index: 6682
         var _loc2_:ZNPNode_ZPP_FluidArbiter = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_FluidArbiter, param2:ZPP_FluidArbiter) : ZNPNode_ZPP_FluidArbiter
      {
         // method body index: 6178 method index: 6683
         var _loc4_:* = null as ZNPNode_ZPP_FluidArbiter;
         if(ZNPNode_ZPP_FluidArbiter.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_FluidArbiter();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_FluidArbiter.zpp_pool;
            ZNPNode_ZPP_FluidArbiter.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_FluidArbiter = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_FluidArbiter
      {
         // method body index: 6179 method index: 6686
         var _loc1_:ZPP_FluidArbiter = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6180 method index: 6687
         var _loc1_:ZNPNode_ZPP_FluidArbiter = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_FluidArbiter = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_FluidArbiter.zpp_pool;
         ZNPNode_ZPP_FluidArbiter.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_FluidArbiter, param2:ZPP_FluidArbiter) : ZNPNode_ZPP_FluidArbiter
      {
         // method body index: 6181 method index: 6688
         var _loc4_:* = null as ZNPNode_ZPP_FluidArbiter;
         if(ZNPNode_ZPP_FluidArbiter.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_FluidArbiter();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_FluidArbiter.zpp_pool;
            ZNPNode_ZPP_FluidArbiter.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_FluidArbiter = _loc4_;
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
      
      public function inlined_has(param1:ZPP_FluidArbiter) : Boolean
      {
         // method body index: 6182 method index: 6689
         var _loc4_:* = null as ZPP_FluidArbiter;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_FluidArbiter = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_FluidArbiter) : ZNPNode_ZPP_FluidArbiter
      {
         // method body index: 6183 method index: 6690
         var _loc2_:* = null as ZNPNode_ZPP_FluidArbiter;
         var _loc3_:* = null as ZNPNode_ZPP_FluidArbiter;
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
         var _loc4_:ZNPNode_ZPP_FluidArbiter = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_FluidArbiter.zpp_pool;
         ZNPNode_ZPP_FluidArbiter.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6184 method index: 6691
         var _loc1_:* = null as ZNPNode_ZPP_FluidArbiter;
         var _loc2_:* = null as ZNPNode_ZPP_FluidArbiter;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_FluidArbiter.zpp_pool;
            ZNPNode_ZPP_FluidArbiter.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_FluidArbiter) : ZPP_FluidArbiter
      {
         // method body index: 6185 method index: 6692
         var _loc3_:* = null as ZNPNode_ZPP_FluidArbiter;
         if(ZNPNode_ZPP_FluidArbiter.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_FluidArbiter();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_FluidArbiter.zpp_pool;
            ZNPNode_ZPP_FluidArbiter.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_FluidArbiter = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_FluidArbiter) : Boolean
      {
         // method body index: 6186 method index: 6693
         var _loc4_:* = null as ZPP_FluidArbiter;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_FluidArbiter = head;
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
      
      public function erase(param1:ZNPNode_ZPP_FluidArbiter) : ZNPNode_ZPP_FluidArbiter
      {
         // method body index: 6187 method index: 6695
         var _loc2_:* = null as ZNPNode_ZPP_FluidArbiter;
         var _loc3_:* = null as ZNPNode_ZPP_FluidArbiter;
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
         var _loc4_:ZNPNode_ZPP_FluidArbiter = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_FluidArbiter.zpp_pool;
         ZNPNode_ZPP_FluidArbiter.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6188 method index: 6697
         var _loc1_:* = null as ZNPNode_ZPP_FluidArbiter;
         var _loc2_:* = null as ZNPNode_ZPP_FluidArbiter;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_FluidArbiter.zpp_pool;
            ZNPNode_ZPP_FluidArbiter.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_FluidArbiter
      {
         // method body index: 6189 method index: 6699
         var _loc1_:ZNPNode_ZPP_FluidArbiter = head;
         var _loc2_:ZNPNode_ZPP_FluidArbiter = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_FluidArbiter
      {
         // method body index: 6190 method index: 6700
         var _loc2_:ZNPNode_ZPP_FluidArbiter = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_FluidArbiter) : void
      {
         // method body index: 6191 method index: 6701
         var _loc3_:* = null as ZPP_FluidArbiter;
         var _loc2_:ZNPNode_ZPP_FluidArbiter = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_FluidArbiter) : ZPP_FluidArbiter
      {
         // method body index: 6192 method index: 6702
         var _loc3_:* = null as ZNPNode_ZPP_FluidArbiter;
         if(ZNPNode_ZPP_FluidArbiter.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_FluidArbiter();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_FluidArbiter.zpp_pool;
            ZNPNode_ZPP_FluidArbiter.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_FluidArbiter = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

