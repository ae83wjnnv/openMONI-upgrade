package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_SimpleEvent;
   
   public class ZNPList_ZPP_SimpleEvent
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_SimpleEvent;
      
      public function ZNPList_ZPP_SimpleEvent()
      {
         // method body index: 6744 method index: 7299
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_SimpleEvent) : Boolean
      {
         // method body index: 6721 method index: 7301
         var _loc2_:ZNPNode_ZPP_SimpleEvent = null;
         var _loc3_:ZNPNode_ZPP_SimpleEvent = head;
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
      
      public function splice(param1:ZNPNode_ZPP_SimpleEvent, param2:int) : ZNPNode_ZPP_SimpleEvent
      {
         // method body index: 6722 method index: 7302
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6723 method index: 7303
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6724 method index: 7305
         var _loc3_:* = null as ZNPNode_ZPP_SimpleEvent;
         var _loc1_:ZNPNode_ZPP_SimpleEvent = head;
         var _loc2_:ZNPNode_ZPP_SimpleEvent = null;
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
      
      public function remove(param1:ZPP_SimpleEvent) : void
      {
         // method body index: 6725 method index: 7306
         var _loc5_:* = null as ZNPNode_ZPP_SimpleEvent;
         var _loc6_:* = null as ZNPNode_ZPP_SimpleEvent;
         var _loc7_:* = null as ZNPNode_ZPP_SimpleEvent;
         var _loc2_:ZNPNode_ZPP_SimpleEvent = null;
         var _loc3_:ZNPNode_ZPP_SimpleEvent = head;
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
               _loc7_.next = ZNPNode_ZPP_SimpleEvent.zpp_pool;
               ZNPNode_ZPP_SimpleEvent.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_SimpleEvent
      {
         // method body index: 6726 method index: 7307
         var _loc1_:ZPP_SimpleEvent = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6727 method index: 7308
         var _loc1_:ZNPNode_ZPP_SimpleEvent = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_SimpleEvent = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_SimpleEvent.zpp_pool;
         ZNPNode_ZPP_SimpleEvent.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_SimpleEvent
      {
         // method body index: 6728 method index: 7309
         var _loc2_:ZNPNode_ZPP_SimpleEvent = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_SimpleEvent, param2:ZPP_SimpleEvent) : ZNPNode_ZPP_SimpleEvent
      {
         // method body index: 6729 method index: 7310
         var _loc4_:* = null as ZNPNode_ZPP_SimpleEvent;
         if(ZNPNode_ZPP_SimpleEvent.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_SimpleEvent();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_SimpleEvent.zpp_pool;
            ZNPNode_ZPP_SimpleEvent.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_SimpleEvent = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_SimpleEvent
      {
         // method body index: 6730 method index: 7313
         var _loc1_:ZPP_SimpleEvent = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6731 method index: 7314
         var _loc1_:ZNPNode_ZPP_SimpleEvent = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_SimpleEvent = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_SimpleEvent.zpp_pool;
         ZNPNode_ZPP_SimpleEvent.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_SimpleEvent, param2:ZPP_SimpleEvent) : ZNPNode_ZPP_SimpleEvent
      {
         // method body index: 6732 method index: 7315
         var _loc4_:* = null as ZNPNode_ZPP_SimpleEvent;
         if(ZNPNode_ZPP_SimpleEvent.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_SimpleEvent();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_SimpleEvent.zpp_pool;
            ZNPNode_ZPP_SimpleEvent.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_SimpleEvent = _loc4_;
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
      
      public function inlined_has(param1:ZPP_SimpleEvent) : Boolean
      {
         // method body index: 6733 method index: 7316
         var _loc4_:* = null as ZPP_SimpleEvent;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_SimpleEvent = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_SimpleEvent) : ZNPNode_ZPP_SimpleEvent
      {
         // method body index: 6734 method index: 7317
         var _loc2_:* = null as ZNPNode_ZPP_SimpleEvent;
         var _loc3_:* = null as ZNPNode_ZPP_SimpleEvent;
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
         var _loc4_:ZNPNode_ZPP_SimpleEvent = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_SimpleEvent.zpp_pool;
         ZNPNode_ZPP_SimpleEvent.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6735 method index: 7318
         var _loc1_:* = null as ZNPNode_ZPP_SimpleEvent;
         var _loc2_:* = null as ZNPNode_ZPP_SimpleEvent;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_SimpleEvent.zpp_pool;
            ZNPNode_ZPP_SimpleEvent.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_SimpleEvent) : ZPP_SimpleEvent
      {
         // method body index: 6736 method index: 7319
         var _loc3_:* = null as ZNPNode_ZPP_SimpleEvent;
         if(ZNPNode_ZPP_SimpleEvent.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_SimpleEvent();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_SimpleEvent.zpp_pool;
            ZNPNode_ZPP_SimpleEvent.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_SimpleEvent = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_SimpleEvent) : Boolean
      {
         // method body index: 6737 method index: 7320
         var _loc4_:* = null as ZPP_SimpleEvent;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_SimpleEvent = head;
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
      
      public function erase(param1:ZNPNode_ZPP_SimpleEvent) : ZNPNode_ZPP_SimpleEvent
      {
         // method body index: 6738 method index: 7322
         var _loc2_:* = null as ZNPNode_ZPP_SimpleEvent;
         var _loc3_:* = null as ZNPNode_ZPP_SimpleEvent;
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
         var _loc4_:ZNPNode_ZPP_SimpleEvent = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_SimpleEvent.zpp_pool;
         ZNPNode_ZPP_SimpleEvent.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6739 method index: 7324
         var _loc1_:* = null as ZNPNode_ZPP_SimpleEvent;
         var _loc2_:* = null as ZNPNode_ZPP_SimpleEvent;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_SimpleEvent.zpp_pool;
            ZNPNode_ZPP_SimpleEvent.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_SimpleEvent
      {
         // method body index: 6740 method index: 7326
         var _loc1_:ZNPNode_ZPP_SimpleEvent = head;
         var _loc2_:ZNPNode_ZPP_SimpleEvent = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_SimpleEvent
      {
         // method body index: 6741 method index: 7327
         var _loc2_:ZNPNode_ZPP_SimpleEvent = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_SimpleEvent) : void
      {
         // method body index: 6742 method index: 7328
         var _loc3_:* = null as ZPP_SimpleEvent;
         var _loc2_:ZNPNode_ZPP_SimpleEvent = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_SimpleEvent) : ZPP_SimpleEvent
      {
         // method body index: 6743 method index: 7329
         var _loc3_:* = null as ZNPNode_ZPP_SimpleEvent;
         if(ZNPNode_ZPP_SimpleEvent.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_SimpleEvent();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_SimpleEvent.zpp_pool;
            ZNPNode_ZPP_SimpleEvent.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_SimpleEvent = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

