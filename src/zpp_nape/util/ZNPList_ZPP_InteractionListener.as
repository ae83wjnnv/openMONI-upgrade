package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_InteractionListener;
   
   public class ZNPList_ZPP_InteractionListener
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_InteractionListener;
      
      public function ZNPList_ZPP_InteractionListener()
      {
         // method body index: 5283 method index: 5648
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_InteractionListener) : Boolean
      {
         // method body index: 5260 method index: 5650
         var _loc2_:ZNPNode_ZPP_InteractionListener = null;
         var _loc3_:ZNPNode_ZPP_InteractionListener = head;
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
      
      public function splice(param1:ZNPNode_ZPP_InteractionListener, param2:int) : ZNPNode_ZPP_InteractionListener
      {
         // method body index: 5261 method index: 5651
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 5262 method index: 5652
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 5263 method index: 5654
         var _loc3_:* = null as ZNPNode_ZPP_InteractionListener;
         var _loc1_:ZNPNode_ZPP_InteractionListener = head;
         var _loc2_:ZNPNode_ZPP_InteractionListener = null;
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
      
      public function remove(param1:ZPP_InteractionListener) : void
      {
         // method body index: 5264 method index: 5655
         var _loc5_:* = null as ZNPNode_ZPP_InteractionListener;
         var _loc6_:* = null as ZNPNode_ZPP_InteractionListener;
         var _loc7_:* = null as ZNPNode_ZPP_InteractionListener;
         var _loc2_:ZNPNode_ZPP_InteractionListener = null;
         var _loc3_:ZNPNode_ZPP_InteractionListener = head;
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
               _loc7_.next = ZNPNode_ZPP_InteractionListener.zpp_pool;
               ZNPNode_ZPP_InteractionListener.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_InteractionListener
      {
         // method body index: 5265 method index: 5656
         var _loc1_:ZPP_InteractionListener = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 5266 method index: 5657
         var _loc1_:ZNPNode_ZPP_InteractionListener = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_InteractionListener = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_InteractionListener.zpp_pool;
         ZNPNode_ZPP_InteractionListener.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_InteractionListener
      {
         // method body index: 5267 method index: 5658
         var _loc2_:ZNPNode_ZPP_InteractionListener = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_InteractionListener, param2:ZPP_InteractionListener) : ZNPNode_ZPP_InteractionListener
      {
         // method body index: 5268 method index: 5659
         var _loc4_:* = null as ZNPNode_ZPP_InteractionListener;
         if(ZNPNode_ZPP_InteractionListener.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_InteractionListener();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_InteractionListener.zpp_pool;
            ZNPNode_ZPP_InteractionListener.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_InteractionListener = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_InteractionListener
      {
         // method body index: 5269 method index: 5662
         var _loc1_:ZPP_InteractionListener = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 5270 method index: 5663
         var _loc1_:ZNPNode_ZPP_InteractionListener = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_InteractionListener = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_InteractionListener.zpp_pool;
         ZNPNode_ZPP_InteractionListener.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_InteractionListener, param2:ZPP_InteractionListener) : ZNPNode_ZPP_InteractionListener
      {
         // method body index: 5271 method index: 5664
         var _loc4_:* = null as ZNPNode_ZPP_InteractionListener;
         if(ZNPNode_ZPP_InteractionListener.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_InteractionListener();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_InteractionListener.zpp_pool;
            ZNPNode_ZPP_InteractionListener.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_InteractionListener = _loc4_;
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
      
      public function inlined_has(param1:ZPP_InteractionListener) : Boolean
      {
         // method body index: 5272 method index: 5665
         var _loc4_:* = null as ZPP_InteractionListener;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_InteractionListener = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_InteractionListener) : ZNPNode_ZPP_InteractionListener
      {
         // method body index: 5273 method index: 5666
         var _loc2_:* = null as ZNPNode_ZPP_InteractionListener;
         var _loc3_:* = null as ZNPNode_ZPP_InteractionListener;
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
         var _loc4_:ZNPNode_ZPP_InteractionListener = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_InteractionListener.zpp_pool;
         ZNPNode_ZPP_InteractionListener.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 5274 method index: 5667
         var _loc1_:* = null as ZNPNode_ZPP_InteractionListener;
         var _loc2_:* = null as ZNPNode_ZPP_InteractionListener;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_InteractionListener.zpp_pool;
            ZNPNode_ZPP_InteractionListener.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_InteractionListener) : ZPP_InteractionListener
      {
         // method body index: 5275 method index: 5668
         var _loc3_:* = null as ZNPNode_ZPP_InteractionListener;
         if(ZNPNode_ZPP_InteractionListener.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_InteractionListener();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_InteractionListener.zpp_pool;
            ZNPNode_ZPP_InteractionListener.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_InteractionListener = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_InteractionListener) : Boolean
      {
         // method body index: 5276 method index: 5669
         var _loc4_:* = null as ZPP_InteractionListener;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_InteractionListener = head;
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
      
      public function erase(param1:ZNPNode_ZPP_InteractionListener) : ZNPNode_ZPP_InteractionListener
      {
         // method body index: 5277 method index: 5671
         var _loc2_:* = null as ZNPNode_ZPP_InteractionListener;
         var _loc3_:* = null as ZNPNode_ZPP_InteractionListener;
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
         var _loc4_:ZNPNode_ZPP_InteractionListener = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_InteractionListener.zpp_pool;
         ZNPNode_ZPP_InteractionListener.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 5278 method index: 5673
         var _loc1_:* = null as ZNPNode_ZPP_InteractionListener;
         var _loc2_:* = null as ZNPNode_ZPP_InteractionListener;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_InteractionListener.zpp_pool;
            ZNPNode_ZPP_InteractionListener.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_InteractionListener
      {
         // method body index: 5279 method index: 5675
         var _loc1_:ZNPNode_ZPP_InteractionListener = head;
         var _loc2_:ZNPNode_ZPP_InteractionListener = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_InteractionListener
      {
         // method body index: 5280 method index: 5676
         var _loc2_:ZNPNode_ZPP_InteractionListener = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_InteractionListener) : void
      {
         // method body index: 5281 method index: 5677
         var _loc3_:* = null as ZPP_InteractionListener;
         var _loc2_:ZNPNode_ZPP_InteractionListener = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_InteractionListener) : ZPP_InteractionListener
      {
         // method body index: 5282 method index: 5678
         var _loc3_:* = null as ZNPNode_ZPP_InteractionListener;
         if(ZNPNode_ZPP_InteractionListener.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_InteractionListener();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_InteractionListener.zpp_pool;
            ZNPNode_ZPP_InteractionListener.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_InteractionListener = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

