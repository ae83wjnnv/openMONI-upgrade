package zpp_nape.util
{
   import nape.callbacks.CbEvent;
   import nape.callbacks.InteractionType;
   import nape.callbacks.ListenerType;
   import nape.callbacks.PreFlag;
   import nape.dynamics.ArbiterType;
   import nape.geom.Winding;
   import nape.phys.BodyType;
   import nape.phys.GravMassMode;
   import nape.phys.InertiaMode;
   import nape.phys.MassMode;
   import nape.shape.ShapeType;
   import nape.shape.ValidationResult;
   import nape.space.Broadphase;
   
   public class ZPP_Flags
   {
      
      public static var GravMassMode_DEFAULT:GravMassMode;
      
      public static var GravMassMode_FIXED:GravMassMode;
      
      public static var GravMassMode_SCALED:GravMassMode;
      
      public static var InertiaMode_DEFAULT:InertiaMode;
      
      public static var InertiaMode_FIXED:InertiaMode;
      
      public static var MassMode_DEFAULT:MassMode;
      
      public static var MassMode_FIXED:MassMode;
      
      public static var BodyType_STATIC:BodyType;
      
      public static var BodyType_DYNAMIC:BodyType;
      
      public static var BodyType_KINEMATIC:BodyType;
      
      public static var ListenerType_BODY:ListenerType;
      
      public static var ListenerType_CONSTRAINT:ListenerType;
      
      public static var ListenerType_INTERACTION:ListenerType;
      
      public static var PreFlag_ACCEPT:PreFlag;
      
      public static var ListenerType_PRE:ListenerType;
      
      public static var PreFlag_IGNORE:PreFlag;
      
      public static var PreFlag_ACCEPT_ONCE:PreFlag;
      
      public static var CbEvent_BEGIN:CbEvent;
      
      public static var PreFlag_IGNORE_ONCE:PreFlag;
      
      public static var CbEvent_ONGOING:CbEvent;
      
      public static var CbEvent_END:CbEvent;
      
      public static var InteractionType_COLLISION:InteractionType;
      
      public static var CbEvent_WAKE:CbEvent;
      
      public static var InteractionType_SENSOR:InteractionType;
      
      public static var CbEvent_SLEEP:CbEvent;
      
      public static var InteractionType_FLUID:InteractionType;
      
      public static var CbEvent_BREAK:CbEvent;
      
      public static var InteractionType_ANY:InteractionType;
      
      public static var CbEvent_PRE:CbEvent;
      
      public static var Winding_UNDEFINED:Winding;
      
      public static var Winding_CLOCKWISE:Winding;
      
      public static var Winding_ANTICLOCKWISE:Winding;
      
      public static var ValidationResult_VALID:ValidationResult;
      
      public static var ValidationResult_DEGENERATE:ValidationResult;
      
      public static var ValidationResult_CONCAVE:ValidationResult;
      
      public static var ValidationResult_SELF_INTERSECTING:ValidationResult;
      
      public static var ShapeType_CIRCLE:ShapeType;
      
      public static var ShapeType_POLYGON:ShapeType;
      
      public static var Broadphase_DYNAMIC_AABB_TREE:Broadphase;
      
      public static var Broadphase_SWEEP_AND_PRUNE:Broadphase;
      
      public static var ArbiterType_COLLISION:ArbiterType;
      
      public static var ArbiterType_SENSOR:ArbiterType;
      
      public static var ArbiterType_FLUID:ArbiterType;
      
      // method body index: 3156 method index: 3315
      public static var §internal§:Boolean = // method body index: 3158 method index: 3316
      false;
      
      public static var id_ImmState_ACCEPT:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_ImmState_IGNORE:int = // method body index: 3158 method index: 3316
      2;
      
      public static var id_ImmState_ALWAYS:int = // method body index: 3158 method index: 3316
      4;
      
      public static var id_GravMassMode_DEFAULT:int = // method body index: 3158 method index: 3316
      0;
      
      public static var id_GravMassMode_FIXED:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_GravMassMode_SCALED:int = // method body index: 3158 method index: 3316
      2;
      
      public static var id_InertiaMode_DEFAULT:int = // method body index: 3158 method index: 3316
      0;
      
      public static var id_InertiaMode_FIXED:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_MassMode_DEFAULT:int = // method body index: 3158 method index: 3316
      0;
      
      public static var id_MassMode_FIXED:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_BodyType_STATIC:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_BodyType_DYNAMIC:int = // method body index: 3158 method index: 3316
      2;
      
      public static var id_BodyType_KINEMATIC:int = // method body index: 3158 method index: 3316
      3;
      
      public static var id_ListenerType_BODY:int = // method body index: 3158 method index: 3316
      0;
      
      public static var id_ListenerType_CONSTRAINT:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_ListenerType_INTERACTION:int = // method body index: 3158 method index: 3316
      2;
      
      public static var id_PreFlag_ACCEPT:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_ListenerType_PRE:int = // method body index: 3158 method index: 3316
      3;
      
      public static var id_PreFlag_IGNORE:int = // method body index: 3158 method index: 3316
      2;
      
      public static var id_PreFlag_ACCEPT_ONCE:int = // method body index: 3158 method index: 3316
      3;
      
      public static var id_CbEvent_BEGIN:int = // method body index: 3158 method index: 3316
      0;
      
      public static var id_PreFlag_IGNORE_ONCE:int = // method body index: 3158 method index: 3316
      4;
      
      public static var id_CbEvent_ONGOING:int = // method body index: 3158 method index: 3316
      6;
      
      public static var id_CbEvent_END:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_InteractionType_COLLISION:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_CbEvent_WAKE:int = // method body index: 3158 method index: 3316
      2;
      
      public static var id_InteractionType_SENSOR:int = // method body index: 3158 method index: 3316
      2;
      
      public static var id_CbEvent_SLEEP:int = // method body index: 3158 method index: 3316
      3;
      
      public static var id_InteractionType_FLUID:int = // method body index: 3158 method index: 3316
      4;
      
      public static var id_CbEvent_BREAK:int = // method body index: 3158 method index: 3316
      4;
      
      public static var id_InteractionType_ANY:int = // method body index: 3158 method index: 3316
      7;
      
      public static var id_CbEvent_PRE:int = // method body index: 3158 method index: 3316
      5;
      
      public static var id_Winding_UNDEFINED:int = // method body index: 3158 method index: 3316
      0;
      
      public static var id_Winding_CLOCKWISE:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_Winding_ANTICLOCKWISE:int = // method body index: 3158 method index: 3316
      2;
      
      public static var id_ValidationResult_VALID:int = // method body index: 3158 method index: 3316
      0;
      
      public static var id_ValidationResult_DEGENERATE:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_ValidationResult_CONCAVE:int = // method body index: 3158 method index: 3316
      2;
      
      public static var id_ValidationResult_SELF_INTERSECTING:int = // method body index: 3158 method index: 3316
      3;
      
      public static var id_ShapeType_CIRCLE:int = // method body index: 3158 method index: 3316
      0;
      
      public static var id_ShapeType_POLYGON:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_Broadphase_DYNAMIC_AABB_TREE:int = // method body index: 3158 method index: 3316
      0;
      
      public static var id_Broadphase_SWEEP_AND_PRUNE:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_ArbiterType_COLLISION:int = // method body index: 3158 method index: 3316
      1;
      
      public static var id_ArbiterType_SENSOR:int = // method body index: 3158 method index: 3316
      2;
      
      public static var id_ArbiterType_FLUID:int = // method body index: 3158 method index: 3316
      4;
      
      public function ZPP_Flags()
      {
         // method body index: 3157 method index: 3314
      }
   }
}

