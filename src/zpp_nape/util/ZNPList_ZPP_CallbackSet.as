package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.space.ZPP_CallbackSet;
   
   public class ZNPList_ZPP_CallbackSet
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_CallbackSet;
      
      public function ZNPList_ZPP_CallbackSet()
      {
         // method body index: 6038 method index: 6486
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_CallbackSet) : Boolean
      {
         // method body index: 6015 method index: 6488
         var _loc2_:ZNPNode_ZPP_CallbackSet = null;
         var _loc3_:ZNPNode_ZPP_CallbackSet = head;
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
      
      public function splice(param1:ZNPNode_ZPP_CallbackSet, param2:int) : ZNPNode_ZPP_CallbackSet
      {
         // method body index: 6016 method index: 6489
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6017 method index: 6490
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6018 method index: 6492
         var _loc3_:* = null as ZNPNode_ZPP_CallbackSet;
         var _loc1_:ZNPNode_ZPP_CallbackSet = head;
         var _loc2_:ZNPNode_ZPP_CallbackSet = null;
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
      
      public function remove(param1:ZPP_CallbackSet) : void
      {
         // method body index: 6019 method index: 6493
         var _loc5_:* = null as ZNPNode_ZPP_CallbackSet;
         var _loc6_:* = null as ZNPNode_ZPP_CallbackSet;
         var _loc7_:* = null as ZNPNode_ZPP_CallbackSet;
         var _loc2_:ZNPNode_ZPP_CallbackSet = null;
         var _loc3_:ZNPNode_ZPP_CallbackSet = head;
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
               _loc7_.next = ZNPNode_ZPP_CallbackSet.zpp_pool;
               ZNPNode_ZPP_CallbackSet.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_CallbackSet
      {
         // method body index: 6020 method index: 6494
         var _loc1_:ZPP_CallbackSet = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6021 method index: 6495
         var _loc1_:ZNPNode_ZPP_CallbackSet = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_CallbackSet = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_CallbackSet.zpp_pool;
         ZNPNode_ZPP_CallbackSet.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_CallbackSet
      {
         // method body index: 6022 method index: 6496
         var _loc2_:ZNPNode_ZPP_CallbackSet = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_CallbackSet, param2:ZPP_CallbackSet) : ZNPNode_ZPP_CallbackSet
      {
         // method body index: 6023 method index: 6497
         var _loc4_:* = null as ZNPNode_ZPP_CallbackSet;
         if(ZNPNode_ZPP_CallbackSet.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_CallbackSet();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_CallbackSet.zpp_pool;
            ZNPNode_ZPP_CallbackSet.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_CallbackSet = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_CallbackSet
      {
         // method body index: 6024 method index: 6500
         var _loc1_:ZPP_CallbackSet = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6025 method index: 6501
         var _loc1_:ZNPNode_ZPP_CallbackSet = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_CallbackSet = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_CallbackSet.zpp_pool;
         ZNPNode_ZPP_CallbackSet.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_CallbackSet, param2:ZPP_CallbackSet) : ZNPNode_ZPP_CallbackSet
      {
         // method body index: 6026 method index: 6502
         var _loc4_:* = null as ZNPNode_ZPP_CallbackSet;
         if(ZNPNode_ZPP_CallbackSet.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_CallbackSet();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_CallbackSet.zpp_pool;
            ZNPNode_ZPP_CallbackSet.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_CallbackSet = _loc4_;
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
      
      public function inlined_has(param1:ZPP_CallbackSet) : Boolean
      {
         // method body index: 6027 method index: 6503
         var _loc4_:* = null as ZPP_CallbackSet;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_CallbackSet = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_CallbackSet) : ZNPNode_ZPP_CallbackSet
      {
         // method body index: 6028 method index: 6504
         var _loc2_:* = null as ZNPNode_ZPP_CallbackSet;
         var _loc3_:* = null as ZNPNode_ZPP_CallbackSet;
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
         var _loc4_:ZNPNode_ZPP_CallbackSet = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_CallbackSet.zpp_pool;
         ZNPNode_ZPP_CallbackSet.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6029 method index: 6505
         var _loc1_:* = null as ZNPNode_ZPP_CallbackSet;
         var _loc2_:* = null as ZNPNode_ZPP_CallbackSet;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_CallbackSet.zpp_pool;
            ZNPNode_ZPP_CallbackSet.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_CallbackSet) : ZPP_CallbackSet
      {
         // method body index: 6030 method index: 6506
         var _loc3_:* = null as ZNPNode_ZPP_CallbackSet;
         if(ZNPNode_ZPP_CallbackSet.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_CallbackSet();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_CallbackSet.zpp_pool;
            ZNPNode_ZPP_CallbackSet.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_CallbackSet = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_CallbackSet) : Boolean
      {
         // method body index: 6031 method index: 6507
         var _loc4_:* = null as ZPP_CallbackSet;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_CallbackSet = head;
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
      
      public function erase(param1:ZNPNode_ZPP_CallbackSet) : ZNPNode_ZPP_CallbackSet
      {
         // method body index: 6032 method index: 6509
         var _loc2_:* = null as ZNPNode_ZPP_CallbackSet;
         var _loc3_:* = null as ZNPNode_ZPP_CallbackSet;
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
         var _loc4_:ZNPNode_ZPP_CallbackSet = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_CallbackSet.zpp_pool;
         ZNPNode_ZPP_CallbackSet.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6033 method index: 6511
         var _loc1_:* = null as ZNPNode_ZPP_CallbackSet;
         var _loc2_:* = null as ZNPNode_ZPP_CallbackSet;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_CallbackSet.zpp_pool;
            ZNPNode_ZPP_CallbackSet.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_CallbackSet
      {
         // method body index: 6034 method index: 6513
         var _loc1_:ZNPNode_ZPP_CallbackSet = head;
         var _loc2_:ZNPNode_ZPP_CallbackSet = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_CallbackSet
      {
         // method body index: 6035 method index: 6514
         var _loc2_:ZNPNode_ZPP_CallbackSet = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_CallbackSet) : void
      {
         // method body index: 6036 method index: 6515
         var _loc3_:* = null as ZPP_CallbackSet;
         var _loc2_:ZNPNode_ZPP_CallbackSet = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_CallbackSet) : ZPP_CallbackSet
      {
         // method body index: 6037 method index: 6516
         var _loc3_:* = null as ZNPNode_ZPP_CallbackSet;
         if(ZNPNode_ZPP_CallbackSet.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_CallbackSet();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_CallbackSet.zpp_pool;
            ZNPNode_ZPP_CallbackSet.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_CallbackSet = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

