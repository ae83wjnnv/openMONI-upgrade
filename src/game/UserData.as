package game
{
   import flash.geom.Point;
   import flash.net.SharedObject;
   import game.world.PlatformLevel;
   
   public class UserData
   {
      
      // method body index: 1198 method index: 1198
      private static var _gold:int = // method body index: 1198 method index: 1198
      0;
      
      private static var _maxHp:int = // method body index: 1198 method index: 1198
      6;
      
      private static var _weapon:String = // method body index: 1198 method index: 1198
      "";
      
      private static var _key:int = // method body index: 1198 method index: 1198
      0;
      
      private static var _triggers:Vector.<String> = // method body index: 1198 method index: 1198
      new Vector.<String>();
      
      private static var _doors:Vector.<int> = // method body index: 1198 method index: 1198
      new Vector.<int>();
      
      private static var _checkpoint:Point = // method body index: 1198 method index: 1198
      new Point(1,1);
      
      public static var playMusic:Boolean = // method body index: 1198 method index: 1198
      true;
      
      public static var saveData:XML = // method body index: 1198 method index: 1198
      <saveGame></saveGame>;
      
      public static var sharedOBJ:SharedObject = // method body index: 1198 method index: 1198
      SharedObject.getLocal("monica");
      
      public function UserData()
      {
         // method body index: 1224 method index: 1224
         super();
      }
      
      public static function get weapon() : String
      {
         // method body index: 1199 method index: 1199
         return _weapon;
      }
      
      public static function get gold() : int
      {
         // method body index: 1200 method index: 1200
         return _gold;
      }
      
      public static function collectGold(param1:uint) : int
      {
         // method body index: 1201 method index: 1201
         _gold += param1;
         return _gold;
      }
      
      public static function spendGold(param1:int) : void
      {
         // method body index: 1202 method index: 1202
         _gold -= param1;
      }
      
      public static function collectWeapon(param1:String) : void
      {
         // method body index: 1203 method index: 1203
         _weapon = param1;
      }
      
      public static function collectKey() : void
      {
         // method body index: 1204 method index: 1204
         ++_key;
      }
      
      public static function useKey() : void
      {
         // method body index: 1205 method index: 1205
         --_key;
      }
      
      public static function hasKey() : Boolean
      {
         // method body index: 1206 method index: 1206
         return _key > 0;
      }
      
      public static function get keys() : int
      {
         // method body index: 1207 method index: 1207
         return _key;
      }
      
      public static function doorLocked(param1:int) : Boolean
      {
         // method body index: 1208 method index: 1208
         var _loc2_:int = 0;
         for each(_loc2_ in _doors)
         {
            if(_loc2_ == param1)
            {
               return false;
            }
         }
         return true;
      }
      
      public static function unlockDoor(param1:int) : void
      {
         // method body index: 1209 method index: 1209
         if(doorLocked(param1))
         {
            _doors.push(param1);
         }
      }
      
      public static function setTrigger(param1:String) : void
      {
         // method body index: 1210 method index: 1210
         var _loc2_:String = null;
         for each(_loc2_ in _triggers)
         {
            if(_loc2_ == param1)
            {
               return;
            }
         }
         _triggers.push(param1);
      }
      
      public static function getTrigger(param1:String) : Boolean
      {
         // method body index: 1211 method index: 1211
         var _loc2_:String = null;
         for each(_loc2_ in _triggers)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function getMaxHp() : int
      {
         // method body index: 1212 method index: 1212
         return _maxHp;
      }
      
      public static function addMaxHp() : void
      {
         // method body index: 1213 method index: 1213
         _maxHp += 2;
      }
      
      public static function switchMusic() : void
      {
         // method body index: 1214 method index: 1214
         playMusic = !playMusic;
         saveOptions();
      }
      
      public static function setCheckpoint(param1:int, param2:int) : void
      {
         // method body index: 1215 method index: 1215
         _checkpoint = new Point(param1,param2);
         save();
      }
      
      public static function isCheckpoint(param1:PlatformLevel) : Boolean
      {
         // method body index: 1216 method index: 1216
         return _checkpoint != null && param1.x == _checkpoint.x && param1.y == _checkpoint.y;
      }
      
      public static function getCheckpoint() : Point
      {
         // method body index: 1217 method index: 1217
         return _checkpoint;
      }
      
      public static function loadOptions() : void
      {
         // method body index: 1218 method index: 1218
         sharedOBJ = SharedObject.getLocal("monicaOptions");
         if(sharedOBJ.data != null)
         {
            playMusic = sharedOBJ.data.music;
         }
         else
         {
            playMusic = true;
         }
      }
      
      public static function load() : void
      {
         // method body index: 1219 method index: 1219
         var _loc1_:Object = null;
         var _loc2_:Object = null;
         sharedOBJ = SharedObject.getLocal("monica");
         if(sharedOBJ.data != null)
         {
            _gold = sharedOBJ.data.gold;
            _maxHp = sharedOBJ.data.maxHp;
            _weapon = sharedOBJ.data.weapon;
            _key = sharedOBJ.data.key;
            _triggers = new Vector.<String>();
            for each(_loc1_ in sharedOBJ.data.triggers)
            {
               _triggers.push(_loc1_ as String);
            }
            _doors = new Vector.<int>();
            for each(_loc2_ in sharedOBJ.data.doors)
            {
               _doors.push(_loc2_ as int);
            }
            _checkpoint = new Point(sharedOBJ.data.checkpointX,sharedOBJ.data.checkpointY);
         }
         else
         {
            _gold = 0;
            _maxHp = 6;
            _weapon = "";
            _key = 0;
            _triggers = new Vector.<String>();
            _doors = new Vector.<int>();
            _checkpoint = new Point(1,1);
         }
      }
      
      public static function saveOptions() : void
      {
         // method body index: 1220 method index: 1220
         sharedOBJ = SharedObject.getLocal("monicaOptions");
         sharedOBJ.data.music = playMusic;
         sharedOBJ.flush();
      }
      
      public static function save() : void
      {
         // method body index: 1221 method index: 1221
         sharedOBJ = SharedObject.getLocal("monica");
         sharedOBJ.data.gold = _gold;
         sharedOBJ.data.maxHp = _maxHp;
         sharedOBJ.data.weapon = _weapon;
         sharedOBJ.data.key = _key;
         sharedOBJ.data.triggers = _triggers;
         sharedOBJ.data.doors = _doors;
         sharedOBJ.data.checkpointX = _checkpoint.x;
         sharedOBJ.data.checkpointY = _checkpoint.y;
         sharedOBJ.data.music = playMusic;
         sharedOBJ.flush();
      }
      
      public static function resetSave() : void
      {
         // method body index: 1222 method index: 1222
         sharedOBJ = SharedObject.getLocal("monica");
         _gold = 0;
         _maxHp = 6;
         _weapon = "";
         _key = 0;
         _triggers = new Vector.<String>();
         _doors = new Vector.<int>();
         _checkpoint = new Point(1,1);
         sharedOBJ.flush();
      }
      
      public static function hasSave() : Boolean
      {
         // method body index: 1223 method index: 1223
         sharedOBJ = SharedObject.getLocal("monica");
         return sharedOBJ != null && sharedOBJ.data != null && sharedOBJ.data.checkpointX != null;
      }
   }
}

