package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_Listener;
   
   public class ZNPList_ZPP_Listener
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_Listener;
      
      public function ZNPList_ZPP_Listener()
      {
         // method body index: 6258 method index: 6745
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_Listener) : Boolean
      {
         // method body index: 6235 method index: 6747
         var _loc2_:ZNPNode_ZPP_Listener = null;
         var _loc3_:ZNPNode_ZPP_Listener = head;
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
      
      public function splice(param1:ZNPNode_ZPP_Listener, param2:int) : ZNPNode_ZPP_Listener
      {
         // method body index: 6236 method index: 6748
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6237 method index: 6749
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6238 method index: 6751
         var _loc3_:* = null as ZNPNode_ZPP_Listener;
         var _loc1_:ZNPNode_ZPP_Listener = head;
         var _loc2_:ZNPNode_ZPP_Listener = null;
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
      
      public function remove(param1:ZPP_Listener) : void
      {
         // method body index: 6239 method index: 6752
         var _loc5_:* = null as ZNPNode_ZPP_Listener;
         var _loc6_:* = null as ZNPNode_ZPP_Listener;
         var _loc7_:* = null as ZNPNode_ZPP_Listener;
         var _loc2_:ZNPNode_ZPP_Listener = null;
         var _loc3_:ZNPNode_ZPP_Listener = head;
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
               _loc7_.next = ZNPNode_ZPP_Listener.zpp_pool;
               ZNPNode_ZPP_Listener.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_Listener
      {
         // method body index: 6240 method index: 6753
         var _loc1_:ZPP_Listener = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6241 method index: 6754
         var _loc1_:ZNPNode_ZPP_Listener = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_Listener = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_Listener.zpp_pool;
         ZNPNode_ZPP_Listener.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_Listener
      {
         // method body index: 6242 method index: 6755
         var _loc2_:ZNPNode_ZPP_Listener = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_Listener, param2:ZPP_Listener) : ZNPNode_ZPP_Listener
      {
         // method body index: 6243 method index: 6756
         var _loc4_:* = null as ZNPNode_ZPP_Listener;
         if(ZNPNode_ZPP_Listener.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_Listener();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_Listener.zpp_pool;
            ZNPNode_ZPP_Listener.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_Listener = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_Listener
      {
         // method body index: 6244 method index: 6759
         var _loc1_:ZPP_Listener = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6245 method index: 6760
         var _loc1_:ZNPNode_ZPP_Listener = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_Listener = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_Listener.zpp_pool;
         ZNPNode_ZPP_Listener.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_Listener, param2:ZPP_Listener) : ZNPNode_ZPP_Listener
      {
         // method body index: 6246 method index: 6761
         var _loc4_:* = null as ZNPNode_ZPP_Listener;
         if(ZNPNode_ZPP_Listener.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_Listener();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_Listener.zpp_pool;
            ZNPNode_ZPP_Listener.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_Listener = _loc4_;
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
      
      public function inlined_has(param1:ZPP_Listener) : Boolean
      {
         // method body index: 6247 method index: 6762
         var _loc4_:* = null as ZPP_Listener;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_Listener = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_Listener) : ZNPNode_ZPP_Listener
      {
         // method body index: 6248 method index: 6763
         var _loc2_:* = null as ZNPNode_ZPP_Listener;
         var _loc3_:* = null as ZNPNode_ZPP_Listener;
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
         var _loc4_:ZNPNode_ZPP_Listener = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_Listener.zpp_pool;
         ZNPNode_ZPP_Listener.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6249 method index: 6764
         var _loc1_:* = null as ZNPNode_ZPP_Listener;
         var _loc2_:* = null as ZNPNode_ZPP_Listener;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_Listener.zpp_pool;
            ZNPNode_ZPP_Listener.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_Listener) : ZPP_Listener
      {
         // method body index: 6250 method index: 6765
         var _loc3_:* = null as ZNPNode_ZPP_Listener;
         if(ZNPNode_ZPP_Listener.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_Listener();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_Listener.zpp_pool;
            ZNPNode_ZPP_Listener.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_Listener = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_Listener) : Boolean
      {
         // method body index: 6251 method index: 6766
         var _loc4_:* = null as ZPP_Listener;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_Listener = head;
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
      
      public function erase(param1:ZNPNode_ZPP_Listener) : ZNPNode_ZPP_Listener
      {
         // method body index: 6252 method index: 6768
         var _loc2_:* = null as ZNPNode_ZPP_Listener;
         var _loc3_:* = null as ZNPNode_ZPP_Listener;
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
         var _loc4_:ZNPNode_ZPP_Listener = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_Listener.zpp_pool;
         ZNPNode_ZPP_Listener.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6253 method index: 6770
         var _loc1_:* = null as ZNPNode_ZPP_Listener;
         var _loc2_:* = null as ZNPNode_ZPP_Listener;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_Listener.zpp_pool;
            ZNPNode_ZPP_Listener.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_Listener
      {
         // method body index: 6254 method index: 6772
         var _loc1_:ZNPNode_ZPP_Listener = head;
         var _loc2_:ZNPNode_ZPP_Listener = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_Listener
      {
         // method body index: 6255 method index: 6773
         var _loc2_:ZNPNode_ZPP_Listener = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_Listener) : void
      {
         // method body index: 6256 method index: 6774
         var _loc3_:* = null as ZPP_Listener;
         var _loc2_:ZNPNode_ZPP_Listener = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_Listener) : ZPP_Listener
      {
         // method body index: 6257 method index: 6775
         var _loc3_:* = null as ZNPNode_ZPP_Listener;
         if(ZNPNode_ZPP_Listener.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_Listener();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_Listener.zpp_pool;
            ZNPNode_ZPP_Listener.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_Listener = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

