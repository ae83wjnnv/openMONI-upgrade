package zpp_nape.util
{
   import flash.Boot;
   import nape.dynamics.ArbiterList;
   
   public class ZPP_ArbiterList
   {
      
      // method body index: 4178 method index: 4509
      public static var §internal§:Boolean = // method body index: 4185 method index: 4516
      false;
      
      public var zip_length:Boolean;
      
      public var user_length:int;
      
      public var subber:Function;
      
      public var reverse_flag:Boolean;
      
      public var push_ite:ZNPNode_ZPP_Arbiter;
      
      public var post_adder:Function;
      
      public var outer:ArbiterList;
      
      public var inner:ZNPList_ZPP_Arbiter;
      
      public var immutable:Boolean;
      
      public var dontremove:Boolean;
      
      public var at_ite:ZNPNode_ZPP_Arbiter;
      
      public var at_index:int;
      
      public var adder:Function;
      
      public var _validate:Function;
      
      public var _modifiable:Function;
      
      public var _invalidated:Boolean;
      
      public var _invalidate:Function;
      
      public function ZPP_ArbiterList()
      {
         // method body index: 4184 method index: 4508
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
         inner = new ZNPList_ZPP_Arbiter();
         _invalidated = true;
      }
      
      public static function get(param1:ZNPList_ZPP_Arbiter, param2:Boolean = false) : ArbiterList
      {
         // method body index: 4177 method index: 4515
         var _loc3_:ArbiterList = new ArbiterList();
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
         // method body index: 4179 method index: 4510
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
         // method body index: 4180 method index: 4511
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
         // method body index: 4181 method index: 4512
         if(_modifiable != null)
         {
            _modifiable();
         }
      }
      
      public function modified() : void
      {
         // method body index: 4182 method index: 4513
         zip_length = true;
         at_ite = null;
         push_ite = null;
      }
      
      public function invalidate() : void
      {
         // method body index: 4183 method index: 4514
         _invalidated = true;
         if(_invalidate != null)
         {
            _invalidate(this);
         }
      }
   }
}

