package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_CutVert;
   
   public class ZNPList_ZPP_CutVert
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_CutVert;
      
      public function ZNPList_ZPP_CutVert()
      {
         // method body index: 6692 method index: 7235
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_CutVert) : Boolean
      {
         // method body index: 6669 method index: 7237
         var _loc2_:ZNPNode_ZPP_CutVert = null;
         var _loc3_:ZNPNode_ZPP_CutVert = head;
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
      
      public function splice(param1:ZNPNode_ZPP_CutVert, param2:int) : ZNPNode_ZPP_CutVert
      {
         // method body index: 6670 method index: 7238
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6671 method index: 7239
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6672 method index: 7241
         var _loc3_:* = null as ZNPNode_ZPP_CutVert;
         var _loc1_:ZNPNode_ZPP_CutVert = head;
         var _loc2_:ZNPNode_ZPP_CutVert = null;
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
      
      public function remove(param1:ZPP_CutVert) : void
      {
         // method body index: 6673 method index: 7242
         var _loc5_:* = null as ZNPNode_ZPP_CutVert;
         var _loc6_:* = null as ZNPNode_ZPP_CutVert;
         var _loc7_:* = null as ZNPNode_ZPP_CutVert;
         var _loc2_:ZNPNode_ZPP_CutVert = null;
         var _loc3_:ZNPNode_ZPP_CutVert = head;
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
               _loc7_.next = ZNPNode_ZPP_CutVert.zpp_pool;
               ZNPNode_ZPP_CutVert.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_CutVert
      {
         // method body index: 6674 method index: 7243
         var _loc1_:ZPP_CutVert = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6675 method index: 7244
         var _loc1_:ZNPNode_ZPP_CutVert = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_CutVert = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_CutVert.zpp_pool;
         ZNPNode_ZPP_CutVert.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_CutVert
      {
         // method body index: 6676 method index: 7245
         var _loc2_:ZNPNode_ZPP_CutVert = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_CutVert, param2:ZPP_CutVert) : ZNPNode_ZPP_CutVert
      {
         // method body index: 6677 method index: 7246
         var _loc4_:* = null as ZNPNode_ZPP_CutVert;
         if(ZNPNode_ZPP_CutVert.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_CutVert();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_CutVert.zpp_pool;
            ZNPNode_ZPP_CutVert.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_CutVert = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_CutVert
      {
         // method body index: 6678 method index: 7249
         var _loc1_:ZPP_CutVert = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6679 method index: 7250
         var _loc1_:ZNPNode_ZPP_CutVert = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_CutVert = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_CutVert.zpp_pool;
         ZNPNode_ZPP_CutVert.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_CutVert, param2:ZPP_CutVert) : ZNPNode_ZPP_CutVert
      {
         // method body index: 6680 method index: 7251
         var _loc4_:* = null as ZNPNode_ZPP_CutVert;
         if(ZNPNode_ZPP_CutVert.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_CutVert();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_CutVert.zpp_pool;
            ZNPNode_ZPP_CutVert.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_CutVert = _loc4_;
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
      
      public function inlined_has(param1:ZPP_CutVert) : Boolean
      {
         // method body index: 6681 method index: 7252
         var _loc4_:* = null as ZPP_CutVert;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_CutVert = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_CutVert) : ZNPNode_ZPP_CutVert
      {
         // method body index: 6682 method index: 7253
         var _loc2_:* = null as ZNPNode_ZPP_CutVert;
         var _loc3_:* = null as ZNPNode_ZPP_CutVert;
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
         var _loc4_:ZNPNode_ZPP_CutVert = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_CutVert.zpp_pool;
         ZNPNode_ZPP_CutVert.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6683 method index: 7254
         var _loc1_:* = null as ZNPNode_ZPP_CutVert;
         var _loc2_:* = null as ZNPNode_ZPP_CutVert;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_CutVert.zpp_pool;
            ZNPNode_ZPP_CutVert.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_CutVert) : ZPP_CutVert
      {
         // method body index: 6684 method index: 7255
         var _loc3_:* = null as ZNPNode_ZPP_CutVert;
         if(ZNPNode_ZPP_CutVert.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_CutVert();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_CutVert.zpp_pool;
            ZNPNode_ZPP_CutVert.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_CutVert = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_CutVert) : Boolean
      {
         // method body index: 6685 method index: 7256
         var _loc4_:* = null as ZPP_CutVert;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_CutVert = head;
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
      
      public function erase(param1:ZNPNode_ZPP_CutVert) : ZNPNode_ZPP_CutVert
      {
         // method body index: 6686 method index: 7258
         var _loc2_:* = null as ZNPNode_ZPP_CutVert;
         var _loc3_:* = null as ZNPNode_ZPP_CutVert;
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
         var _loc4_:ZNPNode_ZPP_CutVert = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_CutVert.zpp_pool;
         ZNPNode_ZPP_CutVert.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6687 method index: 7260
         var _loc1_:* = null as ZNPNode_ZPP_CutVert;
         var _loc2_:* = null as ZNPNode_ZPP_CutVert;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_CutVert.zpp_pool;
            ZNPNode_ZPP_CutVert.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_CutVert
      {
         // method body index: 6688 method index: 7262
         var _loc1_:ZNPNode_ZPP_CutVert = head;
         var _loc2_:ZNPNode_ZPP_CutVert = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_CutVert
      {
         // method body index: 6689 method index: 7263
         var _loc2_:ZNPNode_ZPP_CutVert = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_CutVert) : void
      {
         // method body index: 6690 method index: 7264
         var _loc3_:* = null as ZPP_CutVert;
         var _loc2_:ZNPNode_ZPP_CutVert = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_CutVert) : ZPP_CutVert
      {
         // method body index: 6691 method index: 7265
         var _loc3_:* = null as ZNPNode_ZPP_CutVert;
         if(ZNPNode_ZPP_CutVert.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_CutVert();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_CutVert.zpp_pool;
            ZNPNode_ZPP_CutVert.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_CutVert = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

