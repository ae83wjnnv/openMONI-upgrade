package zpp_nape.util
{
   import flash.Boot;
   import zpp_nape.space.ZPP_AABBNode;
   
   public class ZNPList_ZPP_AABBNode
   {
      
      public var pushmod:Boolean;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var head:ZNPNode_ZPP_AABBNode;
      
      public function ZNPList_ZPP_AABBNode()
      {
         // method body index: 6859 method index: 7437
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         pushmod = false;
         modified = false;
         head = null;
      }
      
      public function try_remove(param1:ZPP_AABBNode) : Boolean
      {
         // method body index: 6836 method index: 7439
         var _loc2_:ZNPNode_ZPP_AABBNode = null;
         var _loc3_:ZNPNode_ZPP_AABBNode = head;
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
      
      public function splice(param1:ZNPNode_ZPP_AABBNode, param2:int) : ZNPNode_ZPP_AABBNode
      {
         // method body index: 6837 method index: 7440
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 6838 method index: 7441
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 6839 method index: 7443
         var _loc3_:* = null as ZNPNode_ZPP_AABBNode;
         var _loc1_:ZNPNode_ZPP_AABBNode = head;
         var _loc2_:ZNPNode_ZPP_AABBNode = null;
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
      
      public function remove(param1:ZPP_AABBNode) : void
      {
         // method body index: 6840 method index: 7444
         var _loc5_:* = null as ZNPNode_ZPP_AABBNode;
         var _loc6_:* = null as ZNPNode_ZPP_AABBNode;
         var _loc7_:* = null as ZNPNode_ZPP_AABBNode;
         var _loc2_:ZNPNode_ZPP_AABBNode = null;
         var _loc3_:ZNPNode_ZPP_AABBNode = head;
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
               _loc7_.next = ZNPNode_ZPP_AABBNode.zpp_pool;
               ZNPNode_ZPP_AABBNode.zpp_pool = _loc7_;
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
      
      public function pop_unsafe() : ZPP_AABBNode
      {
         // method body index: 6841 method index: 7445
         var _loc1_:ZPP_AABBNode = head.elt;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 6842 method index: 7446
         var _loc1_:ZNPNode_ZPP_AABBNode = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_AABBNode = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_AABBNode.zpp_pool;
         ZNPNode_ZPP_AABBNode.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZNPNode_ZPP_AABBNode
      {
         // method body index: 6843 method index: 7447
         var _loc2_:ZNPNode_ZPP_AABBNode = head;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZNPNode_ZPP_AABBNode, param2:ZPP_AABBNode) : ZNPNode_ZPP_AABBNode
      {
         // method body index: 6844 method index: 7448
         var _loc4_:* = null as ZNPNode_ZPP_AABBNode;
         if(ZNPNode_ZPP_AABBNode.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_AABBNode();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_AABBNode.zpp_pool;
            ZNPNode_ZPP_AABBNode.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_AABBNode = _loc4_;
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
      
      public function inlined_pop_unsafe() : ZPP_AABBNode
      {
         // method body index: 6845 method index: 7451
         var _loc1_:ZPP_AABBNode = head.elt;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 6846 method index: 7452
         var _loc1_:ZNPNode_ZPP_AABBNode = head;
         head = _loc1_.next;
         var _loc2_:ZNPNode_ZPP_AABBNode = _loc1_;
         _loc2_.elt = null;
         _loc2_.next = ZNPNode_ZPP_AABBNode.zpp_pool;
         ZNPNode_ZPP_AABBNode.zpp_pool = _loc2_;
         if(head == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZNPNode_ZPP_AABBNode, param2:ZPP_AABBNode) : ZNPNode_ZPP_AABBNode
      {
         // method body index: 6847 method index: 7453
         var _loc4_:* = null as ZNPNode_ZPP_AABBNode;
         if(ZNPNode_ZPP_AABBNode.zpp_pool == null)
         {
            _loc4_ = new ZNPNode_ZPP_AABBNode();
         }
         else
         {
            _loc4_ = ZNPNode_ZPP_AABBNode.zpp_pool;
            ZNPNode_ZPP_AABBNode.zpp_pool = _loc4_.next;
            _loc4_.next = null;
         }
         null;
         _loc4_.elt = param2;
         var _loc3_:ZNPNode_ZPP_AABBNode = _loc4_;
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
      
      public function inlined_has(param1:ZPP_AABBNode) : Boolean
      {
         // method body index: 6848 method index: 7454
         var _loc4_:* = null as ZPP_AABBNode;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_AABBNode = head;
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
      
      public function inlined_erase(param1:ZNPNode_ZPP_AABBNode) : ZNPNode_ZPP_AABBNode
      {
         // method body index: 6849 method index: 7455
         var _loc2_:* = null as ZNPNode_ZPP_AABBNode;
         var _loc3_:* = null as ZNPNode_ZPP_AABBNode;
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
         var _loc4_:ZNPNode_ZPP_AABBNode = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_AABBNode.zpp_pool;
         ZNPNode_ZPP_AABBNode.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 6850 method index: 7456
         var _loc1_:* = null as ZNPNode_ZPP_AABBNode;
         var _loc2_:* = null as ZNPNode_ZPP_AABBNode;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_AABBNode.zpp_pool;
            ZNPNode_ZPP_AABBNode.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function inlined_add(param1:ZPP_AABBNode) : ZPP_AABBNode
      {
         // method body index: 6851 method index: 7457
         var _loc3_:* = null as ZNPNode_ZPP_AABBNode;
         if(ZNPNode_ZPP_AABBNode.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_AABBNode();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_AABBNode.zpp_pool;
            ZNPNode_ZPP_AABBNode.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_AABBNode = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_AABBNode) : Boolean
      {
         // method body index: 6852 method index: 7458
         var _loc4_:* = null as ZPP_AABBNode;
         var _loc2_:Boolean = false;
         var _loc3_:ZNPNode_ZPP_AABBNode = head;
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
      
      public function erase(param1:ZNPNode_ZPP_AABBNode) : ZNPNode_ZPP_AABBNode
      {
         // method body index: 6853 method index: 7460
         var _loc2_:* = null as ZNPNode_ZPP_AABBNode;
         var _loc3_:* = null as ZNPNode_ZPP_AABBNode;
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
         var _loc4_:ZNPNode_ZPP_AABBNode = _loc2_;
         _loc4_.elt = null;
         _loc4_.next = ZNPNode_ZPP_AABBNode.zpp_pool;
         ZNPNode_ZPP_AABBNode.zpp_pool = _loc4_;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 6854 method index: 7462
         var _loc1_:* = null as ZNPNode_ZPP_AABBNode;
         var _loc2_:* = null as ZNPNode_ZPP_AABBNode;
         while(head != null)
         {
            _loc1_ = head;
            head = _loc1_.next;
            _loc2_ = _loc1_;
            _loc2_.elt = null;
            _loc2_.next = ZNPNode_ZPP_AABBNode.zpp_pool;
            ZNPNode_ZPP_AABBNode.zpp_pool = _loc2_;
            if(head == null)
            {
               pushmod = true;
            }
            modified = true;
            --length;
         }
         pushmod = true;
      }
      
      public function back() : ZPP_AABBNode
      {
         // method body index: 6855 method index: 7464
         var _loc1_:ZNPNode_ZPP_AABBNode = head;
         var _loc2_:ZNPNode_ZPP_AABBNode = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_.elt;
      }
      
      public function at(param1:int) : ZPP_AABBNode
      {
         // method body index: 6856 method index: 7465
         var _loc2_:ZNPNode_ZPP_AABBNode = iterator_at(param1);
         return _loc2_ != null ? _loc2_.elt : null;
      }
      
      public function addAll(param1:ZNPList_ZPP_AABBNode) : void
      {
         // method body index: 6857 method index: 7466
         var _loc3_:* = null as ZPP_AABBNode;
         var _loc2_:ZNPNode_ZPP_AABBNode = param1.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_AABBNode) : ZPP_AABBNode
      {
         // method body index: 6858 method index: 7467
         var _loc3_:* = null as ZNPNode_ZPP_AABBNode;
         if(ZNPNode_ZPP_AABBNode.zpp_pool == null)
         {
            _loc3_ = new ZNPNode_ZPP_AABBNode();
         }
         else
         {
            _loc3_ = ZNPNode_ZPP_AABBNode.zpp_pool;
            ZNPNode_ZPP_AABBNode.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.elt = param1;
         var _loc2_:ZNPNode_ZPP_AABBNode = _loc3_;
         _loc2_.next = head;
         head = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

