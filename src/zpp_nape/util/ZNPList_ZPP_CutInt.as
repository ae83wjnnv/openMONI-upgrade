package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_CutInt;
   
   public class ZNPList_ZPP_CutInt
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_CutInt;
      
      public function ZNPList_ZPP_CutInt()
      {
         // method body index: 6718 method index: 7267
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_CutInt) : Boolean
      {
         // method body index: 6695 method index: 7269
         var _loc2_:ZNPNode_ZPP_CutInt = null;
         var _loc3_:ZNPNode_ZPP_CutInt = head;
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
      
      public function splice(param1:ZNPNode_ZPP_CutInt, param2:int) : ZNPNode_ZPP_CutInt
      {
         // method body index: 6696 method index: 7270
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6697 method index: 7271
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6698 method index: 7273
         var _loc3_:* = null as ZNPNode_ZPP_CutInt;
         var _loc1_:ZNPNode_ZPP_CutInt = head;
         var _loc2_:ZNPNode_ZPP_CutInt = null;
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
      
      public function remove(param1:ZPP_CutInt) : void
      {
         // method body index: 6699 method index: 7274
         var _loc5_:* = null as ZNPNode_ZPP_CutInt;
         var _loc6_:* = null as ZNPNode_ZPP_CutInt;
         var _loc7_:* = null as ZNPNode_ZPP_CutInt;
         var _loc2_:ZNPNode_ZPP_CutInt = null;
         var _loc3_:ZNPNode_ZPP_CutInt = head;
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
               _loc7_.next = ZNPNode_ZPP_CutInt.zpp_pool;
               ZNPNode_ZPP_CutInt.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_CutInt
      {
         // method body index: 6700 method index: 7275
         var _loc1_:ZPP_CutInt = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6701 method index: 7276
         var _loc1_:ZNPNode_ZPP_CutInt = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_CutInt = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_CutInt.zpp_pool;
         ZNPNode_ZPP_CutInt.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_CutInt
      {
         // method body index: 6702 method index: 7277
         var _loc2_:ZNPNode_ZPP_CutInt = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_CutInt, param2:ZPP_CutInt) : ZNPNode_ZPP_CutInt
      {
         // method body index: 6703 method index: 7278
         var _loc4_:* = null as ZNPNode_ZPP_CutInt;
         if(ZNPNode_ZPP_CutInt.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_CutInt();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_CutInt.zpp_pool;
            ZNPNode_ZPP_CutInt.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_CutInt = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_CutInt
      {
         // method body index: 6704 method index: 7281
         var _loc1_:ZPP_CutInt = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6705 method index: 7282
         var _loc1_:ZNPNode_ZPP_CutInt = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_CutInt = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_CutInt.zpp_pool;
         ZNPNode_ZPP_CutInt.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_CutInt, param2:ZPP_CutInt) : ZNPNode_ZPP_CutInt
      {
         // method body index: 6706 method index: 7283
         var _loc4_:* = null as ZNPNode_ZPP_CutInt;
         if(ZNPNode_ZPP_CutInt.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_CutInt();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_CutInt.zpp_pool;
            ZNPNode_ZPP_CutInt.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_CutInt = _loc4_;
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
      
      public function inlined_has(param1:ZPP_CutInt) : Boolean
      {
         // method body index: 6707 method index: 7284
         var _loc4_:* = null as ZPP_CutInt;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_CutInt = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_CutInt) : ZNPNode_ZPP_CutInt
      {
         // method body index: 6708 method index: 7285
         var _loc2_:* = null as ZNPNode_ZPP_CutInt;
         var _loc3_:* = null as ZNPNode_ZPP_CutInt;
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
         var _loc4_:ZNPNode_ZPP_CutInt = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_CutInt.zpp_pool;
         ZNPNode_ZPP_CutInt.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6709 method index: 7286
         var _loc1_:* = null as ZNPNode_ZPP_CutInt;
         var _loc2_:* = null as ZNPNode_ZPP_CutInt;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_CutInt.zpp_pool;
            ZNPNode_ZPP_CutInt.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_CutInt) : ZPP_CutInt
      {
         // method body index: 6710 method index: 7287
         var _loc3_:* = null as ZNPNode_ZPP_CutInt;
         if(ZNPNode_ZPP_CutInt.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_CutInt();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_CutInt.zpp_pool;
            ZNPNode_ZPP_CutInt.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_CutInt = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_CutInt) : Boolean
      {
         // method body index: 6711 method index: 7288
         var _loc4_:* = null as ZPP_CutInt;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_CutInt = head;
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
      
      public function erase(param1:ZNPNode_ZPP_CutInt) : ZNPNode_ZPP_CutInt
      {
         // method body index: 6712 method index: 7290
         var _loc2_:* = null as ZNPNode_ZPP_CutInt;
         var _loc3_:* = null as ZNPNode_ZPP_CutInt;
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
         var _loc4_:ZNPNode_ZPP_CutInt = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_CutInt.zpp_pool;
         ZNPNode_ZPP_CutInt.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6713 method index: 7292
         var _loc1_:* = null as ZNPNode_ZPP_CutInt;
         var _loc2_:* = null as ZNPNode_ZPP_CutInt;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_CutInt.zpp_pool;
            ZNPNode_ZPP_CutInt.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_CutInt
      {
         // method body index: 6714 method index: 7294
         var _loc1_:ZNPNode_ZPP_CutInt = head;
         var _loc2_:ZNPNode_ZPP_CutInt = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_CutInt
      {
         // method body index: 6715 method index: 7295
         var _loc2_:ZNPNode_ZPP_CutInt = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_CutInt) : void
      {
         // method body index: 6716 method index: 7296
         var _loc3_:* = null as ZPP_CutInt;
         var _loc2_:ZNPNode_ZPP_CutInt = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_CutInt) : ZPP_CutInt
      {
         // method body index: 6717 method index: 7297
         var _loc3_:* = null as ZNPNode_ZPP_CutInt;
         if(ZNPNode_ZPP_CutInt.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_CutInt();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_CutInt.zpp_pool;
            ZNPNode_ZPP_CutInt.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_CutInt = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

