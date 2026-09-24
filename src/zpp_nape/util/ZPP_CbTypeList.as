package zpp_nape.util
{
   import flash.Boot;
   import nape.callbacks.CbTypeList;
   
   public class ZPP_CbTypeList
   {
      
      // method body index: 5317 method index: 5718
      public static var §internal§:Boolean = // method body index: 5324 method index: 5725
      false;
      
      public var zip_length:Boolean;
      
      public var user_length:int;
      
      public var subber:Function;
      
      public var reverse_flag:Boolean;
      
      public var push_ite:ZNPNode_ZPP_CbType;
      
      public var post_adder:Function;
      
      public var outer:CbTypeList;
      
      public var inner:ZNPList_ZPP_CbType;
      
      public var immutable:Boolean;
      
      public var dontremove:Boolean;
      
      public var at_ite:ZNPNode_ZPP_CbType;
      
      public var at_index:int;
      
      public var adder:Function;
      
      public var _validate:Function;
      
      public var _modifiable:Function;
      
      public var _invalidated:Boolean;
      
      public var _invalidate:Function;
      
      public function ZPP_CbTypeList()
      {
         // method body index: 5323 method index: 5717
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
         inner = new ZNPList_ZPP_CbType();
         _invalidated = true;
      }
      
      public static function get(param1:ZNPList_ZPP_CbType, param2:Boolean = false) : CbTypeList
      {
         // method body index: 5316 method index: 5724
         var _loc3_:CbTypeList = new CbTypeList();
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
         // method body index: 5318 method index: 5719
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
         // method body index: 5319 method index: 5720
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
         // method body index: 5320 method index: 5721
         if(_modifiable != null)
         {
            _modifiable();
         }
      }
      
      public function modified() : void
      {
         // method body index: 5321 method index: 5722
         zip_length = true;
         at_ite = null;
         push_ite = null;
      }
      
      public function invalidate() : void
      {
         // method body index: 5322 method index: 5723
         _invalidated = true;
         if(_invalidate != null)
         {
            _invalidate(this);
         }
      }
   }
}

