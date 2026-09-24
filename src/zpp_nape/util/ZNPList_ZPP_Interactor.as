package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.phys.ZPP_Interactor;
   
   public class ZNPList_ZPP_Interactor
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_Interactor;
      
      public function ZNPList_ZPP_Interactor()
      {
         // method body index: 5615 method index: 6015
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_Interactor) : Boolean
      {
         // method body index: 5592 method index: 6017
         var _loc2_:ZNPNode_ZPP_Interactor = null;
         var _loc3_:ZNPNode_ZPP_Interactor = head;
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
      
      public function splice(param1:ZNPNode_ZPP_Interactor, param2:int) : ZNPNode_ZPP_Interactor
      {
         // method body index: 5593 method index: 6018
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 5594 method index: 6019
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 5595 method index: 6021
         var _loc3_:* = null as ZNPNode_ZPP_Interactor;
         var _loc1_:ZNPNode_ZPP_Interactor = head;
         var _loc2_:ZNPNode_ZPP_Interactor = null;
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
      
      public function remove(param1:ZPP_Interactor) : void
      {
         // method body index: 5596 method index: 6022
         var _loc5_:* = null as ZNPNode_ZPP_Interactor;
         var _loc6_:* = null as ZNPNode_ZPP_Interactor;
         var _loc7_:* = null as ZNPNode_ZPP_Interactor;
         var _loc2_:ZNPNode_ZPP_Interactor = null;
         var _loc3_:ZNPNode_ZPP_Interactor = head;
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
               _loc7_.next = ZNPNode_ZPP_Interactor.zpp_pool;
               ZNPNode_ZPP_Interactor.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_Interactor
      {
         // method body index: 5597 method index: 6023
         var _loc1_:ZPP_Interactor = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 5598 method index: 6024
         var _loc1_:ZNPNode_ZPP_Interactor = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_Interactor = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_Interactor.zpp_pool;
         ZNPNode_ZPP_Interactor.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_Interactor
      {
         // method body index: 5599 method index: 6025
         var _loc2_:ZNPNode_ZPP_Interactor = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_Interactor, param2:ZPP_Interactor) : ZNPNode_ZPP_Interactor
      {
         // method body index: 5600 method index: 6026
         var _loc4_:* = null as ZNPNode_ZPP_Interactor;
         if(ZNPNode_ZPP_Interactor.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_Interactor();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_Interactor.zpp_pool;
            ZNPNode_ZPP_Interactor.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_Interactor = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_Interactor
      {
         // method body index: 5601 method index: 6029
         var _loc1_:ZPP_Interactor = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 5602 method index: 6030
         var _loc1_:ZNPNode_ZPP_Interactor = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_Interactor = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_Interactor.zpp_pool;
         ZNPNode_ZPP_Interactor.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_Interactor, param2:ZPP_Interactor) : ZNPNode_ZPP_Interactor
      {
         // method body index: 5603 method index: 6031
         var _loc4_:* = null as ZNPNode_ZPP_Interactor;
         if(ZNPNode_ZPP_Interactor.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_Interactor();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_Interactor.zpp_pool;
            ZNPNode_ZPP_Interactor.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_Interactor = _loc4_;
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
      
      public function inlined_has(param1:ZPP_Interactor) : Boolean
      {
         // method body index: 5604 method index: 6032
         var _loc4_:* = null as ZPP_Interactor;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_Interactor = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_Interactor) : ZNPNode_ZPP_Interactor
      {
         // method body index: 5605 method index: 6033
         var _loc2_:* = null as ZNPNode_ZPP_Interactor;
         var _loc3_:* = null as ZNPNode_ZPP_Interactor;
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
         var _loc4_:ZNPNode_ZPP_Interactor = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_Interactor.zpp_pool;
         ZNPNode_ZPP_Interactor.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 5606 method index: 6034
         var _loc1_:* = null as ZNPNode_ZPP_Interactor;
         var _loc2_:* = null as ZNPNode_ZPP_Interactor;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_Interactor.zpp_pool;
            ZNPNode_ZPP_Interactor.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_Interactor) : ZPP_Interactor
      {
         // method body index: 5607 method index: 6035
         var _loc3_:* = null as ZNPNode_ZPP_Interactor;
         if(ZNPNode_ZPP_Interactor.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_Interactor();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_Interactor.zpp_pool;
            ZNPNode_ZPP_Interactor.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_Interactor = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_Interactor) : Boolean
      {
         // method body index: 5608 method index: 6036
         var _loc4_:* = null as ZPP_Interactor;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_Interactor = head;
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
      
      public function erase(param1:ZNPNode_ZPP_Interactor) : ZNPNode_ZPP_Interactor
      {
         // method body index: 5609 method index: 6038
         var _loc2_:* = null as ZNPNode_ZPP_Interactor;
         var _loc3_:* = null as ZNPNode_ZPP_Interactor;
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
         var _loc4_:ZNPNode_ZPP_Interactor = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_Interactor.zpp_pool;
         ZNPNode_ZPP_Interactor.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 5610 method index: 6040
         var _loc1_:* = null as ZNPNode_ZPP_Interactor;
         var _loc2_:* = null as ZNPNode_ZPP_Interactor;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_Interactor.zpp_pool;
            ZNPNode_ZPP_Interactor.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_Interactor
      {
         // method body index: 5611 method index: 6042
         var _loc1_:ZNPNode_ZPP_Interactor = head;
         var _loc2_:ZNPNode_ZPP_Interactor = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_Interactor
      {
         // method body index: 5612 method index: 6043
         var _loc2_:ZNPNode_ZPP_Interactor = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_Interactor) : void
      {
         // method body index: 5613 method index: 6044
         var _loc3_:* = null as ZPP_Interactor;
         var _loc2_:ZNPNode_ZPP_Interactor = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_Interactor) : ZPP_Interactor
      {
         // method body index: 5614 method index: 6045
         var _loc3_:* = null as ZNPNode_ZPP_Interactor;
         if(ZNPNode_ZPP_Interactor.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_Interactor();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_Interactor.zpp_pool;
            ZNPNode_ZPP_Interactor.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_Interactor = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

