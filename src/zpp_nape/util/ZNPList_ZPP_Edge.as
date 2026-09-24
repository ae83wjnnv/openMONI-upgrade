package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.shape.ZPP_Edge;
   
   public class ZNPList_ZPP_Edge
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_Edge;
      
      public function ZNPList_ZPP_Edge()
      {
         // method body index: 6607 method index: 7131
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_Edge) : Boolean
      {
         // method body index: 6584 method index: 7133
         var _loc2_:ZNPNode_ZPP_Edge = null;
         var _loc3_:ZNPNode_ZPP_Edge = head;
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
      
      public function splice(param1:ZNPNode_ZPP_Edge, param2:int) : ZNPNode_ZPP_Edge
      {
         // method body index: 6585 method index: 7134
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6586 method index: 7135
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6587 method index: 7137
         var _loc3_:* = null as ZNPNode_ZPP_Edge;
         var _loc1_:ZNPNode_ZPP_Edge = head;
         var _loc2_:ZNPNode_ZPP_Edge = null;
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
      
      public function remove(param1:ZPP_Edge) : void
      {
         // method body index: 6588 method index: 7138
         var _loc5_:* = null as ZNPNode_ZPP_Edge;
         var _loc6_:* = null as ZNPNode_ZPP_Edge;
         var _loc7_:* = null as ZNPNode_ZPP_Edge;
         var _loc2_:ZNPNode_ZPP_Edge = null;
         var _loc3_:ZNPNode_ZPP_Edge = head;
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
               _loc7_.next = ZNPNode_ZPP_Edge.zpp_pool;
               ZNPNode_ZPP_Edge.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_Edge
      {
         // method body index: 6589 method index: 7139
         var _loc1_:ZPP_Edge = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6590 method index: 7140
         var _loc1_:ZNPNode_ZPP_Edge = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_Edge = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_Edge.zpp_pool;
         ZNPNode_ZPP_Edge.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_Edge
      {
         // method body index: 6591 method index: 7141
         var _loc2_:ZNPNode_ZPP_Edge = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_Edge, param2:ZPP_Edge) : ZNPNode_ZPP_Edge
      {
         // method body index: 6592 method index: 7142
         var _loc4_:* = null as ZNPNode_ZPP_Edge;
         if(ZNPNode_ZPP_Edge.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_Edge();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_Edge.zpp_pool;
            ZNPNode_ZPP_Edge.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_Edge = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_Edge
      {
         // method body index: 6593 method index: 7145
         var _loc1_:ZPP_Edge = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6594 method index: 7146
         var _loc1_:ZNPNode_ZPP_Edge = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_Edge = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_Edge.zpp_pool;
         ZNPNode_ZPP_Edge.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_Edge, param2:ZPP_Edge) : ZNPNode_ZPP_Edge
      {
         // method body index: 6595 method index: 7147
         var _loc4_:* = null as ZNPNode_ZPP_Edge;
         if(ZNPNode_ZPP_Edge.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_Edge();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_Edge.zpp_pool;
            ZNPNode_ZPP_Edge.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_Edge = _loc4_;
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
      
      public function inlined_has(param1:ZPP_Edge) : Boolean
      {
         // method body index: 6596 method index: 7148
         var _loc4_:* = null as ZPP_Edge;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_Edge = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_Edge) : ZNPNode_ZPP_Edge
      {
         // method body index: 6597 method index: 7149
         var _loc2_:* = null as ZNPNode_ZPP_Edge;
         var _loc3_:* = null as ZNPNode_ZPP_Edge;
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
         var _loc4_:ZNPNode_ZPP_Edge = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_Edge.zpp_pool;
         ZNPNode_ZPP_Edge.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6598 method index: 7150
         var _loc1_:* = null as ZNPNode_ZPP_Edge;
         var _loc2_:* = null as ZNPNode_ZPP_Edge;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_Edge.zpp_pool;
            ZNPNode_ZPP_Edge.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_Edge) : ZPP_Edge
      {
         // method body index: 6599 method index: 7151
         var _loc3_:* = null as ZNPNode_ZPP_Edge;
         if(ZNPNode_ZPP_Edge.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_Edge();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_Edge.zpp_pool;
            ZNPNode_ZPP_Edge.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_Edge = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_Edge) : Boolean
      {
         // method body index: 6600 method index: 7152
         var _loc4_:* = null as ZPP_Edge;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_Edge = head;
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
      
      public function erase(param1:ZNPNode_ZPP_Edge) : ZNPNode_ZPP_Edge
      {
         // method body index: 6601 method index: 7154
         var _loc2_:* = null as ZNPNode_ZPP_Edge;
         var _loc3_:* = null as ZNPNode_ZPP_Edge;
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
         var _loc4_:ZNPNode_ZPP_Edge = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_Edge.zpp_pool;
         ZNPNode_ZPP_Edge.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6602 method index: 7156
         var _loc1_:* = null as ZNPNode_ZPP_Edge;
         var _loc2_:* = null as ZNPNode_ZPP_Edge;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_Edge.zpp_pool;
            ZNPNode_ZPP_Edge.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_Edge
      {
         // method body index: 6603 method index: 7158
         var _loc1_:ZNPNode_ZPP_Edge = head;
         var _loc2_:ZNPNode_ZPP_Edge = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_Edge
      {
         // method body index: 6604 method index: 7159
         var _loc2_:ZNPNode_ZPP_Edge = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_Edge) : void
      {
         // method body index: 6605 method index: 7160
         var _loc3_:* = null as ZPP_Edge;
         var _loc2_:ZNPNode_ZPP_Edge = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_Edge) : ZPP_Edge
      {
         // method body index: 6606 method index: 7161
         var _loc3_:* = null as ZNPNode_ZPP_Edge;
         if(ZNPNode_ZPP_Edge.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_Edge();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_Edge.zpp_pool;
            ZNPNode_ZPP_Edge.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_Edge = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

