package zpp_nape.util
{
   import flash.Boot;
   import nape.dynamics.InteractionGroupList;
   
   public class ZPP_InteractionGroupList
   {
      
      // method body index: 5561 method index: 5985
      public static var §internal§:Boolean = // method body index: 5568 method index: 5992
      false;
      
      public var zip_length:Boolean;
      
      public var user_length:int;
      
      public var subber:Function;
      
      public var reverse_flag:Boolean;
      
      public var push_ite:ZNPNode_ZPP_InteractionGroup;
      
      public var post_adder:Function;
      
      public var outer:InteractionGroupList;
      
      public var inner:ZNPList_ZPP_InteractionGroup;
      
      public var immutable:Boolean;
      
      public var dontremove:Boolean;
      
      public var at_ite:ZNPNode_ZPP_InteractionGroup;
      
      public var at_index:int;
      
      public var adder:Function;
      
      public var _validate:Function;
      
      public var _modifiable:Function;
      
      public var _invalidated:Boolean;
      
      public var _invalidate:Function;
      
      public function ZPP_InteractionGroupList()
      {
         // method body index: 5567 method index: 5984
         if(Boot.skip_constructor)
         {
            return;
         }
         user_length = 0;
         zip_length = false;
         push_ite = null;
         at_ite = null;
         at_index = 0;
         reverse_flag = false;
         dontremove = false;
         subber = null;
         post_adder = null;
         adder = null;
         _modifiable = null;
         _validate = null;
         _invalidate = null;
         _invalidated = false;
         immutable = false;
         inner = null;
         outer = null;
         inner = new ZNPList_ZPP_InteractionGroup();
         _invalidated = true;
      }
      
      public static function get(param1:ZNPList_ZPP_InteractionGroup, param2:Boolean = false) : InteractionGroupList
      {
         // method body index: 5560 method index: 5991
         var _loc3_:InteractionGroupList = new InteractionGroupList();
         _loc3_.zpp_inner.inner = param1;
         if(param2)
         {
            _loc3_.zpp_inner.immutable = true;
         }
         _loc3_.zpp_inner.zip_length = true;
         return _loc3_;
      }
      
      public function valmod() : void
      {
         // method body index: 5562 method index: 5986
         validate();
         if(inner.modified)
         {
            if(inner.pushmod)
            {
               push_ite = null;
            }
            at_ite = null;
            inner.modified = false;
            inner.pushmod = false;
            zip_length = true;
         }
      }
      
      public function validate() : void
      {
         // method body index: 5563 method index: 5987
         if(_invalidated)
         {
            _invalidated = false;
            if(_validate != null)
            {
               _validate();
            }
         }
      }
      
      public function modify_test() : void
      {
         // method body index: 5564 method index: 5988
         if(_modifiable != null)
         {
            _modifiable();
         }
      }
      
      public function modified() : void
      {
         // method body index: 5565 method index: 5989
         zip_length = true;
         at_ite = null;
         push_ite = null;
      }
      
      public function invalidate() : void
      {
         // method body index: 5566 method index: 5990
         _invalidated = true;
         if(_invalidate != null)
         {
            _invalidate(this);
         }
      }
   }
}

