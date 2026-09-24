package zpp_nape.util
{
   import flash.Boot;
   import nape.geom.Vec2List;
   
   public class ZPP_Vec2List
   {
      
      // method body index: 5843 method index: 6306
      public static var §internal§:Boolean = // method body index: 5850 method index: 6313
      false;
      
      public var zip_length:Boolean;
      
      public var user_length:int;
      
      public var subber:Function;
      
      public var reverse_flag:Boolean;
      
      public var push_ite:ZNPNode_ZPP_Vec2;
      
      public var post_adder:Function;
      
      public var outer:Vec2List;
      
      public var inner:ZNPList_ZPP_Vec2;
      
      public var immutable:Boolean;
      
      public var dontremove:Boolean;
      
      public var at_ite:ZNPNode_ZPP_Vec2;
      
      public var at_index:int;
      
      public var adder:Function;
      
      public var _validate:Function;
      
      public var _modifiable:Function;
      
      public var _invalidated:Boolean;
      
      public var _invalidate:Function;
      
      public function ZPP_Vec2List()
      {
         // method body index: 5849 method index: 6305
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
         inner = new ZNPList_ZPP_Vec2();
         _invalidated = true;
      }
      
      public static function get(param1:ZNPList_ZPP_Vec2, param2:Boolean = false) : Vec2List
      {
         // method body index: 5842 method index: 6312
         var _loc3_:Vec2List = new Vec2List();
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
         // method body index: 5844 method index: 6307
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
         // method body index: 5845 method index: 6308
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
         // method body index: 5846 method index: 6309
         if(_modifiable != null)
         {
            _modifiable();
         }
      }
      
      public function modified() : void
      {
         // method body index: 5847 method index: 6310
         zip_length = true;
         at_ite = null;
         push_ite = null;
      }
      
      public function invalidate() : void
      {
         // method body index: 5848 method index: 6311
         _invalidated = true;
         if(_invalidate != null)
         {
            _invalidate(this);
         }
      }
   }
}

