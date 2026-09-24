package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_CbType;
   
   public class ZNPList_ZPP_CbType
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_CbType;
      
      public function ZNPList_ZPP_CbType()
      {
         // method body index: 5309 method index: 5680
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_CbType) : Boolean
      {
         // method body index: 5286 method index: 5682
         var _loc2_:ZNPNode_ZPP_CbType = null;
         var _loc3_:ZNPNode_ZPP_CbType = head;
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
      
      public function splice(param1:ZNPNode_ZPP_CbType, param2:int) : ZNPNode_ZPP_CbType
      {
         // method body index: 5287 method index: 5683
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 5288 method index: 5684
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 5289 method index: 5686
         var _loc3_:* = null as ZNPNode_ZPP_CbType;
         var _loc1_:ZNPNode_ZPP_CbType = head;
         var _loc2_:ZNPNode_ZPP_CbType = null;
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
      
      public function remove(param1:ZPP_CbType) : void
      {
         // method body index: 5290 method index: 5687
         var _loc5_:* = null as ZNPNode_ZPP_CbType;
         var _loc6_:* = null as ZNPNode_ZPP_CbType;
         var _loc7_:* = null as ZNPNode_ZPP_CbType;
         var _loc2_:ZNPNode_ZPP_CbType = null;
         var _loc3_:ZNPNode_ZPP_CbType = head;
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
               _loc7_.next = ZNPNode_ZPP_CbType.zpp_pool;
               ZNPNode_ZPP_CbType.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_CbType
      {
         // method body index: 5291 method index: 5688
         var _loc1_:ZPP_CbType = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 5292 method index: 5689
         var _loc1_:ZNPNode_ZPP_CbType = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_CbType = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_CbType.zpp_pool;
         ZNPNode_ZPP_CbType.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_CbType
      {
         // method body index: 5293 method index: 5690
         var _loc2_:ZNPNode_ZPP_CbType = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_CbType, param2:ZPP_CbType) : ZNPNode_ZPP_CbType
      {
         // method body index: 5294 method index: 5691
         var _loc4_:* = null as ZNPNode_ZPP_CbType;
         if(ZNPNode_ZPP_CbType.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_CbType();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_CbType.zpp_pool;
            ZNPNode_ZPP_CbType.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_CbType = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_CbType
      {
         // method body index: 5295 method index: 5694
         var _loc1_:ZPP_CbType = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 5296 method index: 5695
         var _loc1_:ZNPNode_ZPP_CbType = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_CbType = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_CbType.zpp_pool;
         ZNPNode_ZPP_CbType.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_CbType, param2:ZPP_CbType) : ZNPNode_ZPP_CbType
      {
         // method body index: 5297 method index: 5696
         var _loc4_:* = null as ZNPNode_ZPP_CbType;
         if(ZNPNode_ZPP_CbType.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_CbType();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_CbType.zpp_pool;
            ZNPNode_ZPP_CbType.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_CbType = _loc4_;
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
      
      public function inlined_has(param1:ZPP_CbType) : Boolean
      {
         // method body index: 5298 method index: 5697
         var _loc4_:* = null as ZPP_CbType;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_CbType = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_CbType) : ZNPNode_ZPP_CbType
      {
         // method body index: 5299 method index: 5698
         var _loc2_:* = null as ZNPNode_ZPP_CbType;
         var _loc3_:* = null as ZNPNode_ZPP_CbType;
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
         var _loc4_:ZNPNode_ZPP_CbType = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_CbType.zpp_pool;
         ZNPNode_ZPP_CbType.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 5300 method index: 5699
         var _loc1_:* = null as ZNPNode_ZPP_CbType;
         var _loc2_:* = null as ZNPNode_ZPP_CbType;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_CbType.zpp_pool;
            ZNPNode_ZPP_CbType.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_CbType) : ZPP_CbType
      {
         // method body index: 5301 method index: 5700
         var _loc3_:* = null as ZNPNode_ZPP_CbType;
         if(ZNPNode_ZPP_CbType.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_CbType();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_CbType.zpp_pool;
            ZNPNode_ZPP_CbType.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_CbType = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_CbType) : Boolean
      {
         // method body index: 5302 method index: 5701
         var _loc4_:* = null as ZPP_CbType;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_CbType = head;
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
      
      public function erase(param1:ZNPNode_ZPP_CbType) : ZNPNode_ZPP_CbType
      {
         // method body index: 5303 method index: 5703
         var _loc2_:* = null as ZNPNode_ZPP_CbType;
         var _loc3_:* = null as ZNPNode_ZPP_CbType;
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
         var _loc4_:ZNPNode_ZPP_CbType = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_CbType.zpp_pool;
         ZNPNode_ZPP_CbType.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 5304 method index: 5705
         var _loc1_:* = null as ZNPNode_ZPP_CbType;
         var _loc2_:* = null as ZNPNode_ZPP_CbType;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_CbType.zpp_pool;
            ZNPNode_ZPP_CbType.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_CbType
      {
         // method body index: 5305 method index: 5707
         var _loc1_:ZNPNode_ZPP_CbType = head;
         var _loc2_:ZNPNode_ZPP_CbType = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_CbType
      {
         // method body index: 5306 method index: 5708
         var _loc2_:ZNPNode_ZPP_CbType = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_CbType) : void
      {
         // method body index: 5307 method index: 5709
         var _loc3_:* = null as ZPP_CbType;
         var _loc2_:ZNPNode_ZPP_CbType = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_CbType) : ZPP_CbType
      {
         // method body index: 5308 method index: 5710
         var _loc3_:* = null as ZNPNode_ZPP_CbType;
         if(ZNPNode_ZPP_CbType.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_CbType();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_CbType.zpp_pool;
            ZNPNode_ZPP_CbType.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_CbType = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

