package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.dynamics.ZPP_InteractionGroup;
   
   public class ZNPList_ZPP_InteractionGroup
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_InteractionGroup;
      
      public function ZNPList_ZPP_InteractionGroup()
      {
         // method body index: 6153 method index: 6625
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_InteractionGroup) : Boolean
      {
         // method body index: 6130 method index: 6627
         var _loc2_:ZNPNode_ZPP_InteractionGroup = null;
         var _loc3_:ZNPNode_ZPP_InteractionGroup = head;
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
      
      public function splice(param1:ZNPNode_ZPP_InteractionGroup, param2:int) : ZNPNode_ZPP_InteractionGroup
      {
         // method body index: 6131 method index: 6628
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6132 method index: 6629
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6133 method index: 6631
         var _loc3_:* = null as ZNPNode_ZPP_InteractionGroup;
         var _loc1_:ZNPNode_ZPP_InteractionGroup = head;
         var _loc2_:ZNPNode_ZPP_InteractionGroup = null;
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
      
      public function remove(param1:ZPP_InteractionGroup) : void
      {
         // method body index: 6134 method index: 6632
         var _loc5_:* = null as ZNPNode_ZPP_InteractionGroup;
         var _loc6_:* = null as ZNPNode_ZPP_InteractionGroup;
         var _loc7_:* = null as ZNPNode_ZPP_InteractionGroup;
         var _loc2_:ZNPNode_ZPP_InteractionGroup = null;
         var _loc3_:ZNPNode_ZPP_InteractionGroup = head;
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
               _loc7_.next = ZNPNode_ZPP_InteractionGroup.zpp_pool;
               ZNPNode_ZPP_InteractionGroup.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_InteractionGroup
      {
         // method body index: 6135 method index: 6633
         var _loc1_:ZPP_InteractionGroup = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6136 method index: 6634
         var _loc1_:ZNPNode_ZPP_InteractionGroup = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_InteractionGroup = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_InteractionGroup.zpp_pool;
         ZNPNode_ZPP_InteractionGroup.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_InteractionGroup
      {
         // method body index: 6137 method index: 6635
         var _loc2_:ZNPNode_ZPP_InteractionGroup = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_InteractionGroup, param2:ZPP_InteractionGroup) : ZNPNode_ZPP_InteractionGroup
      {
         // method body index: 6138 method index: 6636
         var _loc4_:* = null as ZNPNode_ZPP_InteractionGroup;
         if(ZNPNode_ZPP_InteractionGroup.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_InteractionGroup();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_InteractionGroup.zpp_pool;
            ZNPNode_ZPP_InteractionGroup.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_InteractionGroup = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_InteractionGroup
      {
         // method body index: 6139 method index: 6639
         var _loc1_:ZPP_InteractionGroup = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6140 method index: 6640
         var _loc1_:ZNPNode_ZPP_InteractionGroup = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_InteractionGroup = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_InteractionGroup.zpp_pool;
         ZNPNode_ZPP_InteractionGroup.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_InteractionGroup, param2:ZPP_InteractionGroup) : ZNPNode_ZPP_InteractionGroup
      {
         // method body index: 6141 method index: 6641
         var _loc4_:* = null as ZNPNode_ZPP_InteractionGroup;
         if(ZNPNode_ZPP_InteractionGroup.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_InteractionGroup();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_InteractionGroup.zpp_pool;
            ZNPNode_ZPP_InteractionGroup.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_InteractionGroup = _loc4_;
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
      
      public function inlined_has(param1:ZPP_InteractionGroup) : Boolean
      {
         // method body index: 6142 method index: 6642
         var _loc4_:* = null as ZPP_InteractionGroup;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_InteractionGroup = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_InteractionGroup) : ZNPNode_ZPP_InteractionGroup
      {
         // method body index: 6143 method index: 6643
         var _loc2_:* = null as ZNPNode_ZPP_InteractionGroup;
         var _loc3_:* = null as ZNPNode_ZPP_InteractionGroup;
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
         var _loc4_:ZNPNode_ZPP_InteractionGroup = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_InteractionGroup.zpp_pool;
         ZNPNode_ZPP_InteractionGroup.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6144 method index: 6644
         var _loc1_:* = null as ZNPNode_ZPP_InteractionGroup;
         var _loc2_:* = null as ZNPNode_ZPP_InteractionGroup;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_InteractionGroup.zpp_pool;
            ZNPNode_ZPP_InteractionGroup.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_InteractionGroup) : ZPP_InteractionGroup
      {
         // method body index: 6145 method index: 6645
         var _loc3_:* = null as ZNPNode_ZPP_InteractionGroup;
         if(ZNPNode_ZPP_InteractionGroup.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_InteractionGroup();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_InteractionGroup.zpp_pool;
            ZNPNode_ZPP_InteractionGroup.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_InteractionGroup = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_InteractionGroup) : Boolean
      {
         // method body index: 6146 method index: 6646
         var _loc4_:* = null as ZPP_InteractionGroup;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_InteractionGroup = head;
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
      
      public function erase(param1:ZNPNode_ZPP_InteractionGroup) : ZNPNode_ZPP_InteractionGroup
      {
         // method body index: 6147 method index: 6648
         var _loc2_:* = null as ZNPNode_ZPP_InteractionGroup;
         var _loc3_:* = null as ZNPNode_ZPP_InteractionGroup;
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
         var _loc4_:ZNPNode_ZPP_InteractionGroup = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_InteractionGroup.zpp_pool;
         ZNPNode_ZPP_InteractionGroup.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6148 method index: 6650
         var _loc1_:* = null as ZNPNode_ZPP_InteractionGroup;
         var _loc2_:* = null as ZNPNode_ZPP_InteractionGroup;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_InteractionGroup.zpp_pool;
            ZNPNode_ZPP_InteractionGroup.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_InteractionGroup
      {
         // method body index: 6149 method index: 6652
         var _loc1_:ZNPNode_ZPP_InteractionGroup = head;
         var _loc2_:ZNPNode_ZPP_InteractionGroup = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_InteractionGroup
      {
         // method body index: 6150 method index: 6653
         var _loc2_:ZNPNode_ZPP_InteractionGroup = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_InteractionGroup) : void
      {
         // method body index: 6151 method index: 6654
         var _loc3_:* = null as ZPP_InteractionGroup;
         var _loc2_:ZNPNode_ZPP_InteractionGroup = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_InteractionGroup) : ZPP_InteractionGroup
      {
         // method body index: 6152 method index: 6655
         var _loc3_:* = null as ZNPNode_ZPP_InteractionGroup;
         if(ZNPNode_ZPP_InteractionGroup.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_InteractionGroup();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_InteractionGroup.zpp_pool;
            ZNPNode_ZPP_InteractionGroup.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_InteractionGroup = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

