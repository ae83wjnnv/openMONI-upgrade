package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_BodyListener;
   
   public class ZNPList_ZPP_BodyListener
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_BodyListener;
      
      public function ZNPList_ZPP_BodyListener()
      {
         // method body index: 5650 method index: 6056
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_BodyListener) : Boolean
      {
         // method body index: 5627 method index: 6058
         var _loc2_:ZNPNode_ZPP_BodyListener = null;
         var _loc3_:ZNPNode_ZPP_BodyListener = head;
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
      
      public function splice(param1:ZNPNode_ZPP_BodyListener, param2:int) : ZNPNode_ZPP_BodyListener
      {
         // method body index: 5628 method index: 6059
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 5629 method index: 6060
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 5630 method index: 6062
         var _loc3_:* = null as ZNPNode_ZPP_BodyListener;
         var _loc1_:ZNPNode_ZPP_BodyListener = head;
         var _loc2_:ZNPNode_ZPP_BodyListener = null;
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
      
      public function remove(param1:ZPP_BodyListener) : void
      {
         // method body index: 5631 method index: 6063
         var _loc5_:* = null as ZNPNode_ZPP_BodyListener;
         var _loc6_:* = null as ZNPNode_ZPP_BodyListener;
         var _loc7_:* = null as ZNPNode_ZPP_BodyListener;
         var _loc2_:ZNPNode_ZPP_BodyListener = null;
         var _loc3_:ZNPNode_ZPP_BodyListener = head;
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
               _loc7_.next = ZNPNode_ZPP_BodyListener.zpp_pool;
               ZNPNode_ZPP_BodyListener.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_BodyListener
      {
         // method body index: 5632 method index: 6064
         var _loc1_:ZPP_BodyListener = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 5633 method index: 6065
         var _loc1_:ZNPNode_ZPP_BodyListener = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_BodyListener = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_BodyListener.zpp_pool;
         ZNPNode_ZPP_BodyListener.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_BodyListener
      {
         // method body index: 5634 method index: 6066
         var _loc2_:ZNPNode_ZPP_BodyListener = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_BodyListener, param2:ZPP_BodyListener) : ZNPNode_ZPP_BodyListener
      {
         // method body index: 5635 method index: 6067
         var _loc4_:* = null as ZNPNode_ZPP_BodyListener;
         if(ZNPNode_ZPP_BodyListener.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_BodyListener();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_BodyListener.zpp_pool;
            ZNPNode_ZPP_BodyListener.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_BodyListener = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_BodyListener
      {
         // method body index: 5636 method index: 6070
         var _loc1_:ZPP_BodyListener = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 5637 method index: 6071
         var _loc1_:ZNPNode_ZPP_BodyListener = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_BodyListener = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_BodyListener.zpp_pool;
         ZNPNode_ZPP_BodyListener.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_BodyListener, param2:ZPP_BodyListener) : ZNPNode_ZPP_BodyListener
      {
         // method body index: 5638 method index: 6072
         var _loc4_:* = null as ZNPNode_ZPP_BodyListener;
         if(ZNPNode_ZPP_BodyListener.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_BodyListener();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_BodyListener.zpp_pool;
            ZNPNode_ZPP_BodyListener.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_BodyListener = _loc4_;
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
      
      public function inlined_has(param1:ZPP_BodyListener) : Boolean
      {
         // method body index: 5639 method index: 6073
         var _loc4_:* = null as ZPP_BodyListener;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_BodyListener = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_BodyListener) : ZNPNode_ZPP_BodyListener
      {
         // method body index: 5640 method index: 6074
         var _loc2_:* = null as ZNPNode_ZPP_BodyListener;
         var _loc3_:* = null as ZNPNode_ZPP_BodyListener;
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
         var _loc4_:ZNPNode_ZPP_BodyListener = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_BodyListener.zpp_pool;
         ZNPNode_ZPP_BodyListener.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 5641 method index: 6075
         var _loc1_:* = null as ZNPNode_ZPP_BodyListener;
         var _loc2_:* = null as ZNPNode_ZPP_BodyListener;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_BodyListener.zpp_pool;
            ZNPNode_ZPP_BodyListener.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_BodyListener) : ZPP_BodyListener
      {
         // method body index: 5642 method index: 6076
         var _loc3_:* = null as ZNPNode_ZPP_BodyListener;
         if(ZNPNode_ZPP_BodyListener.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_BodyListener();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_BodyListener.zpp_pool;
            ZNPNode_ZPP_BodyListener.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_BodyListener = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_BodyListener) : Boolean
      {
         // method body index: 5643 method index: 6077
         var _loc4_:* = null as ZPP_BodyListener;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_BodyListener = head;
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
      
      public function erase(param1:ZNPNode_ZPP_BodyListener) : ZNPNode_ZPP_BodyListener
      {
         // method body index: 5644 method index: 6079
         var _loc2_:* = null as ZNPNode_ZPP_BodyListener;
         var _loc3_:* = null as ZNPNode_ZPP_BodyListener;
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
         var _loc4_:ZNPNode_ZPP_BodyListener = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_BodyListener.zpp_pool;
         ZNPNode_ZPP_BodyListener.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 5645 method index: 6081
         var _loc1_:* = null as ZNPNode_ZPP_BodyListener;
         var _loc2_:* = null as ZNPNode_ZPP_BodyListener;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_BodyListener.zpp_pool;
            ZNPNode_ZPP_BodyListener.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_BodyListener
      {
         // method body index: 5646 method index: 6083
         var _loc1_:ZNPNode_ZPP_BodyListener = head;
         var _loc2_:ZNPNode_ZPP_BodyListener = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_BodyListener
      {
         // method body index: 5647 method index: 6084
         var _loc2_:ZNPNode_ZPP_BodyListener = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_BodyListener) : void
      {
         // method body index: 5648 method index: 6085
         var _loc3_:* = null as ZPP_BodyListener;
         var _loc2_:ZNPNode_ZPP_BodyListener = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_BodyListener) : ZPP_BodyListener
      {
         // method body index: 5649 method index: 6086
         var _loc3_:* = null as ZNPNode_ZPP_BodyListener;
         if(ZNPNode_ZPP_BodyListener.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_BodyListener();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_BodyListener.zpp_pool;
            ZNPNode_ZPP_BodyListener.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_BodyListener = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

