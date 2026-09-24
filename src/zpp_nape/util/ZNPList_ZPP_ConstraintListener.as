package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_ConstraintListener;
   
   public class ZNPList_ZPP_ConstraintListener
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_ConstraintListener;
      
      public function ZNPList_ZPP_ConstraintListener()
      {
         // method body index: 5728 method index: 6152
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_ConstraintListener) : Boolean
      {
         // method body index: 5705 method index: 6154
         var _loc2_:ZNPNode_ZPP_ConstraintListener = null;
         var _loc3_:ZNPNode_ZPP_ConstraintListener = head;
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
      
      public function splice(param1:ZNPNode_ZPP_ConstraintListener, param2:int) : ZNPNode_ZPP_ConstraintListener
      {
         // method body index: 5706 method index: 6155
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 5707 method index: 6156
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 5708 method index: 6158
         var _loc3_:* = null as ZNPNode_ZPP_ConstraintListener;
         var _loc1_:ZNPNode_ZPP_ConstraintListener = head;
         var _loc2_:ZNPNode_ZPP_ConstraintListener = null;
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
      
      public function remove(param1:ZPP_ConstraintListener) : void
      {
         // method body index: 5709 method index: 6159
         var _loc5_:* = null as ZNPNode_ZPP_ConstraintListener;
         var _loc6_:* = null as ZNPNode_ZPP_ConstraintListener;
         var _loc7_:* = null as ZNPNode_ZPP_ConstraintListener;
         var _loc2_:ZNPNode_ZPP_ConstraintListener = null;
         var _loc3_:ZNPNode_ZPP_ConstraintListener = head;
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
               _loc7_.next = ZNPNode_ZPP_ConstraintListener.zpp_pool;
               ZNPNode_ZPP_ConstraintListener.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_ConstraintListener
      {
         // method body index: 5710 method index: 6160
         var _loc1_:ZPP_ConstraintListener = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 5711 method index: 6161
         var _loc1_:ZNPNode_ZPP_ConstraintListener = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_ConstraintListener = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_ConstraintListener.zpp_pool;
         ZNPNode_ZPP_ConstraintListener.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_ConstraintListener
      {
         // method body index: 5712 method index: 6162
         var _loc2_:ZNPNode_ZPP_ConstraintListener = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_ConstraintListener, param2:ZPP_ConstraintListener) : ZNPNode_ZPP_ConstraintListener
      {
         // method body index: 5713 method index: 6163
         var _loc4_:* = null as ZNPNode_ZPP_ConstraintListener;
         if(ZNPNode_ZPP_ConstraintListener.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_ConstraintListener();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_ConstraintListener.zpp_pool;
            ZNPNode_ZPP_ConstraintListener.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_ConstraintListener = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_ConstraintListener
      {
         // method body index: 5714 method index: 6166
         var _loc1_:ZPP_ConstraintListener = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 5715 method index: 6167
         var _loc1_:ZNPNode_ZPP_ConstraintListener = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_ConstraintListener = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_ConstraintListener.zpp_pool;
         ZNPNode_ZPP_ConstraintListener.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_ConstraintListener, param2:ZPP_ConstraintListener) : ZNPNode_ZPP_ConstraintListener
      {
         // method body index: 5716 method index: 6168
         var _loc4_:* = null as ZNPNode_ZPP_ConstraintListener;
         if(ZNPNode_ZPP_ConstraintListener.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_ConstraintListener();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_ConstraintListener.zpp_pool;
            ZNPNode_ZPP_ConstraintListener.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_ConstraintListener = _loc4_;
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
      
      public function inlined_has(param1:ZPP_ConstraintListener) : Boolean
      {
         // method body index: 5717 method index: 6169
         var _loc4_:* = null as ZPP_ConstraintListener;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_ConstraintListener = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_ConstraintListener) : ZNPNode_ZPP_ConstraintListener
      {
         // method body index: 5718 method index: 6170
         var _loc2_:* = null as ZNPNode_ZPP_ConstraintListener;
         var _loc3_:* = null as ZNPNode_ZPP_ConstraintListener;
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
         var _loc4_:ZNPNode_ZPP_ConstraintListener = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_ConstraintListener.zpp_pool;
         ZNPNode_ZPP_ConstraintListener.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 5719 method index: 6171
         var _loc1_:* = null as ZNPNode_ZPP_ConstraintListener;
         var _loc2_:* = null as ZNPNode_ZPP_ConstraintListener;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_ConstraintListener.zpp_pool;
            ZNPNode_ZPP_ConstraintListener.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_ConstraintListener) : ZPP_ConstraintListener
      {
         // method body index: 5720 method index: 6172
         var _loc3_:* = null as ZNPNode_ZPP_ConstraintListener;
         if(ZNPNode_ZPP_ConstraintListener.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_ConstraintListener();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_ConstraintListener.zpp_pool;
            ZNPNode_ZPP_ConstraintListener.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_ConstraintListener = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_ConstraintListener) : Boolean
      {
         // method body index: 5721 method index: 6173
         var _loc4_:* = null as ZPP_ConstraintListener;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_ConstraintListener = head;
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
      
      public function erase(param1:ZNPNode_ZPP_ConstraintListener) : ZNPNode_ZPP_ConstraintListener
      {
         // method body index: 5722 method index: 6175
         var _loc2_:* = null as ZNPNode_ZPP_ConstraintListener;
         var _loc3_:* = null as ZNPNode_ZPP_ConstraintListener;
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
         var _loc4_:ZNPNode_ZPP_ConstraintListener = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_ConstraintListener.zpp_pool;
         ZNPNode_ZPP_ConstraintListener.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 5723 method index: 6177
         var _loc1_:* = null as ZNPNode_ZPP_ConstraintListener;
         var _loc2_:* = null as ZNPNode_ZPP_ConstraintListener;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_ConstraintListener.zpp_pool;
            ZNPNode_ZPP_ConstraintListener.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_ConstraintListener
      {
         // method body index: 5724 method index: 6179
         var _loc1_:ZNPNode_ZPP_ConstraintListener = head;
         var _loc2_:ZNPNode_ZPP_ConstraintListener = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_ConstraintListener
      {
         // method body index: 5725 method index: 6180
         var _loc2_:ZNPNode_ZPP_ConstraintListener = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_ConstraintListener) : void
      {
         // method body index: 5726 method index: 6181
         var _loc3_:* = null as ZPP_ConstraintListener;
         var _loc2_:ZNPNode_ZPP_ConstraintListener = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_ConstraintListener) : ZPP_ConstraintListener
      {
         // method body index: 5727 method index: 6182
         var _loc3_:* = null as ZNPNode_ZPP_ConstraintListener;
         if(ZNPNode_ZPP_ConstraintListener.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_ConstraintListener();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_ConstraintListener.zpp_pool;
            ZNPNode_ZPP_ConstraintListener.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_ConstraintListener = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

