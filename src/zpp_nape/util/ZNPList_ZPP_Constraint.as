package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.constraint.ZPP_Constraint;
   
   public class ZNPList_ZPP_Constraint
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_Constraint;
      
      public function ZNPList_ZPP_Constraint()
      {
         // method body index: 5702 method index: 6120
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_Constraint) : Boolean
      {
         // method body index: 5679 method index: 6122
         var _loc2_:ZNPNode_ZPP_Constraint = null;
         var _loc3_:ZNPNode_ZPP_Constraint = head;
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
      
      public function splice(param1:ZNPNode_ZPP_Constraint, param2:int) : ZNPNode_ZPP_Constraint
      {
         // method body index: 5680 method index: 6123
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 5681 method index: 6124
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 5682 method index: 6126
         var _loc3_:* = null as ZNPNode_ZPP_Constraint;
         var _loc1_:ZNPNode_ZPP_Constraint = head;
         var _loc2_:ZNPNode_ZPP_Constraint = null;
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
      
      public function remove(param1:ZPP_Constraint) : void
      {
         // method body index: 5683 method index: 6127
         var _loc5_:* = null as ZNPNode_ZPP_Constraint;
         var _loc6_:* = null as ZNPNode_ZPP_Constraint;
         var _loc7_:* = null as ZNPNode_ZPP_Constraint;
         var _loc2_:ZNPNode_ZPP_Constraint = null;
         var _loc3_:ZNPNode_ZPP_Constraint = head;
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
               _loc7_.next = ZNPNode_ZPP_Constraint.zpp_pool;
               ZNPNode_ZPP_Constraint.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_Constraint
      {
         // method body index: 5684 method index: 6128
         var _loc1_:ZPP_Constraint = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 5685 method index: 6129
         var _loc1_:ZNPNode_ZPP_Constraint = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_Constraint = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_Constraint.zpp_pool;
         ZNPNode_ZPP_Constraint.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_Constraint
      {
         // method body index: 5686 method index: 6130
         var _loc2_:ZNPNode_ZPP_Constraint = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_Constraint, param2:ZPP_Constraint) : ZNPNode_ZPP_Constraint
      {
         // method body index: 5687 method index: 6131
         var _loc4_:* = null as ZNPNode_ZPP_Constraint;
         if(ZNPNode_ZPP_Constraint.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_Constraint();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_Constraint.zpp_pool;
            ZNPNode_ZPP_Constraint.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_Constraint = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_Constraint
      {
         // method body index: 5688 method index: 6134
         var _loc1_:ZPP_Constraint = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 5689 method index: 6135
         var _loc1_:ZNPNode_ZPP_Constraint = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_Constraint = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_Constraint.zpp_pool;
         ZNPNode_ZPP_Constraint.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_Constraint, param2:ZPP_Constraint) : ZNPNode_ZPP_Constraint
      {
         // method body index: 5690 method index: 6136
         var _loc4_:* = null as ZNPNode_ZPP_Constraint;
         if(ZNPNode_ZPP_Constraint.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_Constraint();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_Constraint.zpp_pool;
            ZNPNode_ZPP_Constraint.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_Constraint = _loc4_;
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
      
      public function inlined_has(param1:ZPP_Constraint) : Boolean
      {
         // method body index: 5691 method index: 6137
         var _loc4_:* = null as ZPP_Constraint;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_Constraint = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_Constraint) : ZNPNode_ZPP_Constraint
      {
         // method body index: 5692 method index: 6138
         var _loc2_:* = null as ZNPNode_ZPP_Constraint;
         var _loc3_:* = null as ZNPNode_ZPP_Constraint;
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
         var _loc4_:ZNPNode_ZPP_Constraint = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_Constraint.zpp_pool;
         ZNPNode_ZPP_Constraint.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 5693 method index: 6139
         var _loc1_:* = null as ZNPNode_ZPP_Constraint;
         var _loc2_:* = null as ZNPNode_ZPP_Constraint;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_Constraint.zpp_pool;
            ZNPNode_ZPP_Constraint.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_Constraint) : ZPP_Constraint
      {
         // method body index: 5694 method index: 6140
         var _loc3_:* = null as ZNPNode_ZPP_Constraint;
         if(ZNPNode_ZPP_Constraint.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_Constraint();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_Constraint.zpp_pool;
            ZNPNode_ZPP_Constraint.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_Constraint = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_Constraint) : Boolean
      {
         // method body index: 5695 method index: 6141
         var _loc4_:* = null as ZPP_Constraint;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_Constraint = head;
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
      
      public function erase(param1:ZNPNode_ZPP_Constraint) : ZNPNode_ZPP_Constraint
      {
         // method body index: 5696 method index: 6143
         var _loc2_:* = null as ZNPNode_ZPP_Constraint;
         var _loc3_:* = null as ZNPNode_ZPP_Constraint;
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
         var _loc4_:ZNPNode_ZPP_Constraint = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_Constraint.zpp_pool;
         ZNPNode_ZPP_Constraint.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 5697 method index: 6145
         var _loc1_:* = null as ZNPNode_ZPP_Constraint;
         var _loc2_:* = null as ZNPNode_ZPP_Constraint;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_Constraint.zpp_pool;
            ZNPNode_ZPP_Constraint.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_Constraint
      {
         // method body index: 5698 method index: 6147
         var _loc1_:ZNPNode_ZPP_Constraint = head;
         var _loc2_:ZNPNode_ZPP_Constraint = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_Constraint
      {
         // method body index: 5699 method index: 6148
         var _loc2_:ZNPNode_ZPP_Constraint = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_Constraint) : void
      {
         // method body index: 5700 method index: 6149
         var _loc3_:* = null as ZPP_Constraint;
         var _loc2_:ZNPNode_ZPP_Constraint = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_Constraint) : ZPP_Constraint
      {
         // method body index: 5701 method index: 6150
         var _loc3_:* = null as ZNPNode_ZPP_Constraint;
         if(ZNPNode_ZPP_Constraint.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_Constraint();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_Constraint.zpp_pool;
            ZNPNode_ZPP_Constraint.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_Constraint = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

