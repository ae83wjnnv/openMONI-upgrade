package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_SimplifyP;
   
   public class ZNPList_ZPP_SimplifyP
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_SimplifyP;
      
      public function ZNPList_ZPP_SimplifyP()
      {
         // method body index: 6666 method index: 7203
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_SimplifyP) : Boolean
      {
         // method body index: 6643 method index: 7205
         var _loc2_:ZNPNode_ZPP_SimplifyP = null;
         var _loc3_:ZNPNode_ZPP_SimplifyP = head;
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
      
      public function splice(param1:ZNPNode_ZPP_SimplifyP, param2:int) : ZNPNode_ZPP_SimplifyP
      {
         // method body index: 6644 method index: 7206
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6645 method index: 7207
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6646 method index: 7209
         var _loc3_:* = null as ZNPNode_ZPP_SimplifyP;
         var _loc1_:ZNPNode_ZPP_SimplifyP = head;
         var _loc2_:ZNPNode_ZPP_SimplifyP = null;
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
      
      public function remove(param1:ZPP_SimplifyP) : void
      {
         // method body index: 6647 method index: 7210
         var _loc5_:* = null as ZNPNode_ZPP_SimplifyP;
         var _loc6_:* = null as ZNPNode_ZPP_SimplifyP;
         var _loc7_:* = null as ZNPNode_ZPP_SimplifyP;
         var _loc2_:ZNPNode_ZPP_SimplifyP = null;
         var _loc3_:ZNPNode_ZPP_SimplifyP = head;
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
               _loc7_.next = ZNPNode_ZPP_SimplifyP.zpp_pool;
               ZNPNode_ZPP_SimplifyP.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_SimplifyP
      {
         // method body index: 6648 method index: 7211
         var _loc1_:ZPP_SimplifyP = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6649 method index: 7212
         var _loc1_:ZNPNode_ZPP_SimplifyP = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_SimplifyP = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_SimplifyP.zpp_pool;
         ZNPNode_ZPP_SimplifyP.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_SimplifyP
      {
         // method body index: 6650 method index: 7213
         var _loc2_:ZNPNode_ZPP_SimplifyP = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_SimplifyP, param2:ZPP_SimplifyP) : ZNPNode_ZPP_SimplifyP
      {
         // method body index: 6651 method index: 7214
         var _loc4_:* = null as ZNPNode_ZPP_SimplifyP;
         if(ZNPNode_ZPP_SimplifyP.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_SimplifyP();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_SimplifyP.zpp_pool;
            ZNPNode_ZPP_SimplifyP.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_SimplifyP = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_SimplifyP
      {
         // method body index: 6652 method index: 7217
         var _loc1_:ZPP_SimplifyP = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6653 method index: 7218
         var _loc1_:ZNPNode_ZPP_SimplifyP = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_SimplifyP = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_SimplifyP.zpp_pool;
         ZNPNode_ZPP_SimplifyP.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_SimplifyP, param2:ZPP_SimplifyP) : ZNPNode_ZPP_SimplifyP
      {
         // method body index: 6654 method index: 7219
         var _loc4_:* = null as ZNPNode_ZPP_SimplifyP;
         if(ZNPNode_ZPP_SimplifyP.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_SimplifyP();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_SimplifyP.zpp_pool;
            ZNPNode_ZPP_SimplifyP.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_SimplifyP = _loc4_;
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
      
      public function inlined_has(param1:ZPP_SimplifyP) : Boolean
      {
         // method body index: 6655 method index: 7220
         var _loc4_:* = null as ZPP_SimplifyP;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_SimplifyP = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_SimplifyP) : ZNPNode_ZPP_SimplifyP
      {
         // method body index: 6656 method index: 7221
         var _loc2_:* = null as ZNPNode_ZPP_SimplifyP;
         var _loc3_:* = null as ZNPNode_ZPP_SimplifyP;
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
         var _loc4_:ZNPNode_ZPP_SimplifyP = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_SimplifyP.zpp_pool;
         ZNPNode_ZPP_SimplifyP.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6657 method index: 7222
         var _loc1_:* = null as ZNPNode_ZPP_SimplifyP;
         var _loc2_:* = null as ZNPNode_ZPP_SimplifyP;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_SimplifyP.zpp_pool;
            ZNPNode_ZPP_SimplifyP.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_SimplifyP) : ZPP_SimplifyP
      {
         // method body index: 6658 method index: 7223
         var _loc3_:* = null as ZNPNode_ZPP_SimplifyP;
         if(ZNPNode_ZPP_SimplifyP.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_SimplifyP();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_SimplifyP.zpp_pool;
            ZNPNode_ZPP_SimplifyP.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_SimplifyP = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_SimplifyP) : Boolean
      {
         // method body index: 6659 method index: 7224
         var _loc4_:* = null as ZPP_SimplifyP;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_SimplifyP = head;
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
      
      public function erase(param1:ZNPNode_ZPP_SimplifyP) : ZNPNode_ZPP_SimplifyP
      {
         // method body index: 6660 method index: 7226
         var _loc2_:* = null as ZNPNode_ZPP_SimplifyP;
         var _loc3_:* = null as ZNPNode_ZPP_SimplifyP;
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
         var _loc4_:ZNPNode_ZPP_SimplifyP = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_SimplifyP.zpp_pool;
         ZNPNode_ZPP_SimplifyP.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6661 method index: 7228
         var _loc1_:* = null as ZNPNode_ZPP_SimplifyP;
         var _loc2_:* = null as ZNPNode_ZPP_SimplifyP;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_SimplifyP.zpp_pool;
            ZNPNode_ZPP_SimplifyP.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_SimplifyP
      {
         // method body index: 6662 method index: 7230
         var _loc1_:ZNPNode_ZPP_SimplifyP = head;
         var _loc2_:ZNPNode_ZPP_SimplifyP = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_SimplifyP
      {
         // method body index: 6663 method index: 7231
         var _loc2_:ZNPNode_ZPP_SimplifyP = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_SimplifyP) : void
      {
         // method body index: 6664 method index: 7232
         var _loc3_:* = null as ZPP_SimplifyP;
         var _loc2_:ZNPNode_ZPP_SimplifyP = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_SimplifyP) : ZPP_SimplifyP
      {
         // method body index: 6665 method index: 7233
         var _loc3_:* = null as ZNPNode_ZPP_SimplifyP;
         if(ZNPNode_ZPP_SimplifyP.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_SimplifyP();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_SimplifyP.zpp_pool;
            ZNPNode_ZPP_SimplifyP.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_SimplifyP = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

