package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.geom.ZPP_SimpleVert;
   
   public class ZNPList_ZPP_SimpleVert
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_SimpleVert;
      
      public function ZNPList_ZPP_SimpleVert()
      {
         // method body index: 6788 method index: 7353
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_SimpleVert) : Boolean
      {
         // method body index: 6765 method index: 7355
         var _loc2_:ZNPNode_ZPP_SimpleVert = null;
         var _loc3_:ZNPNode_ZPP_SimpleVert = head;
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
      
      public function splice(param1:ZNPNode_ZPP_SimpleVert, param2:int) : ZNPNode_ZPP_SimpleVert
      {
         // method body index: 6766 method index: 7356
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6767 method index: 7357
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6768 method index: 7359
         var _loc3_:* = null as ZNPNode_ZPP_SimpleVert;
         var _loc1_:ZNPNode_ZPP_SimpleVert = head;
         var _loc2_:ZNPNode_ZPP_SimpleVert = null;
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
      
      public function remove(param1:ZPP_SimpleVert) : void
      {
         // method body index: 6769 method index: 7360
         var _loc5_:* = null as ZNPNode_ZPP_SimpleVert;
         var _loc6_:* = null as ZNPNode_ZPP_SimpleVert;
         var _loc7_:* = null as ZNPNode_ZPP_SimpleVert;
         var _loc2_:ZNPNode_ZPP_SimpleVert = null;
         var _loc3_:ZNPNode_ZPP_SimpleVert = head;
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
               _loc7_.next = ZNPNode_ZPP_SimpleVert.zpp_pool;
               ZNPNode_ZPP_SimpleVert.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_SimpleVert
      {
         // method body index: 6770 method index: 7361
         var _loc1_:ZPP_SimpleVert = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6771 method index: 7362
         var _loc1_:ZNPNode_ZPP_SimpleVert = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_SimpleVert = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_SimpleVert.zpp_pool;
         ZNPNode_ZPP_SimpleVert.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_SimpleVert
      {
         // method body index: 6772 method index: 7363
         var _loc2_:ZNPNode_ZPP_SimpleVert = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_SimpleVert, param2:ZPP_SimpleVert) : ZNPNode_ZPP_SimpleVert
      {
         // method body index: 6773 method index: 7364
         var _loc4_:* = null as ZNPNode_ZPP_SimpleVert;
         if(ZNPNode_ZPP_SimpleVert.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_SimpleVert();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_SimpleVert.zpp_pool;
            ZNPNode_ZPP_SimpleVert.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_SimpleVert = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_SimpleVert
      {
         // method body index: 6774 method index: 7367
         var _loc1_:ZPP_SimpleVert = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6775 method index: 7368
         var _loc1_:ZNPNode_ZPP_SimpleVert = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_SimpleVert = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_SimpleVert.zpp_pool;
         ZNPNode_ZPP_SimpleVert.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_SimpleVert, param2:ZPP_SimpleVert) : ZNPNode_ZPP_SimpleVert
      {
         // method body index: 6776 method index: 7369
         var _loc4_:* = null as ZNPNode_ZPP_SimpleVert;
         if(ZNPNode_ZPP_SimpleVert.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_SimpleVert();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_SimpleVert.zpp_pool;
            ZNPNode_ZPP_SimpleVert.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_SimpleVert = _loc4_;
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
      
      public function inlined_has(param1:ZPP_SimpleVert) : Boolean
      {
         // method body index: 6777 method index: 7370
         var _loc4_:* = null as ZPP_SimpleVert;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_SimpleVert = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_SimpleVert) : ZNPNode_ZPP_SimpleVert
      {
         // method body index: 6778 method index: 7371
         var _loc2_:* = null as ZNPNode_ZPP_SimpleVert;
         var _loc3_:* = null as ZNPNode_ZPP_SimpleVert;
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
         var _loc4_:ZNPNode_ZPP_SimpleVert = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_SimpleVert.zpp_pool;
         ZNPNode_ZPP_SimpleVert.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6779 method index: 7372
         var _loc1_:* = null as ZNPNode_ZPP_SimpleVert;
         var _loc2_:* = null as ZNPNode_ZPP_SimpleVert;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_SimpleVert.zpp_pool;
            ZNPNode_ZPP_SimpleVert.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_SimpleVert) : ZPP_SimpleVert
      {
         // method body index: 6780 method index: 7373
         var _loc3_:* = null as ZNPNode_ZPP_SimpleVert;
         if(ZNPNode_ZPP_SimpleVert.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_SimpleVert();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_SimpleVert.zpp_pool;
            ZNPNode_ZPP_SimpleVert.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_SimpleVert = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_SimpleVert) : Boolean
      {
         // method body index: 6781 method index: 7374
         var _loc4_:* = null as ZPP_SimpleVert;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_SimpleVert = head;
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
      
      public function erase(param1:ZNPNode_ZPP_SimpleVert) : ZNPNode_ZPP_SimpleVert
      {
         // method body index: 6782 method index: 7376
         var _loc2_:* = null as ZNPNode_ZPP_SimpleVert;
         var _loc3_:* = null as ZNPNode_ZPP_SimpleVert;
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
         var _loc4_:ZNPNode_ZPP_SimpleVert = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_SimpleVert.zpp_pool;
         ZNPNode_ZPP_SimpleVert.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6783 method index: 7378
         var _loc1_:* = null as ZNPNode_ZPP_SimpleVert;
         var _loc2_:* = null as ZNPNode_ZPP_SimpleVert;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_SimpleVert.zpp_pool;
            ZNPNode_ZPP_SimpleVert.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_SimpleVert
      {
         // method body index: 6784 method index: 7380
         var _loc1_:ZNPNode_ZPP_SimpleVert = head;
         var _loc2_:ZNPNode_ZPP_SimpleVert = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_SimpleVert
      {
         // method body index: 6785 method index: 7381
         var _loc2_:ZNPNode_ZPP_SimpleVert = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_SimpleVert) : void
      {
         // method body index: 6786 method index: 7382
         var _loc3_:* = null as ZPP_SimpleVert;
         var _loc2_:ZNPNode_ZPP_SimpleVert = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_SimpleVert) : ZPP_SimpleVert
      {
         // method body index: 6787 method index: 7383
         var _loc3_:* = null as ZNPNode_ZPP_SimpleVert;
         if(ZNPNode_ZPP_SimpleVert.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_SimpleVert();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_SimpleVert.zpp_pool;
            ZNPNode_ZPP_SimpleVert.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_SimpleVert = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

