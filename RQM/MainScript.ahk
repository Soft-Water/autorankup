CoordMode "Mouse", "Screen"
CoordMode "Pixel", "Screen"
SetMouseDelay -1

global Version := "1.0.1"

#Include UWBOCRLib.ahk
#Include Routes.ahk

PositionMap := Map(
  "RewardButton", [1786, 729],
  "ClaimRewardButton", [1780, 637],
  "MiniXTL", [1259, 232],
  "MiniXBR", [1313, 288],
  "MiniX", [1285, 262],
  "XTL", [1442, 231],
  "XBR", [1499, 285],
  "X", [1470, 257],
  "InventoryBackpackButton", [416, 396],
  "InventoryPotionButton", [412, 456],
  "SearchBar", [1292, 258],
  "TopOfGame", [930, 25],
  "ItemMiddle", [523, 411],
  "SearchFieldTL", [1158, 243],
  "SearchFieldBR", [1401, 262],
  "StupidCatBR", [903, 515],
  "StupidCatTL", [1001, 606],
  "TPButton", [169, 395],
  "TPButtonTL", [126, 343],
  "TPButtonBR", [189, 415],
  "TPUIMiddle", [960, 360],
  "EggBuyMax", [1183, 725],
  "SC_OkayButton", [624, 717],
  "SC_OkayButtonTL", [547, 702],
  "SC_OkayButtonBR", [794, 759],
  "UpperSelectionCircle_Pets1", [910, 349],
  "UpperSelectionCircle_Pets2", [1062, 348],
  "UpperSelectionCircle_Items1", [996, 341],
  "UpperSelectionCircle_Items2", [1123, 343],
  "UpperSelectionCircle_Items3", [1250, 343],
  "UpperSelectionCircle_Items4", [1376, 343],
  "SC_GoldenMachine", [1214, 388],
  "SC_RainbowMachine", [1046, 609],
  "SC_Enchants", [540, 592],
  "SC_Potions", [1383, 378],
  "AutoHatchUIToggle", [1116, 383],
  "AutoHatch", [57, 477],
  "AutoHatchBR", [22, 445],
  "AutoHatchTL", [102, 514],
  "AutoFarmTL", [122, 453],
  "AutoFarmBR", [193, 519],
  "AutoFarm", [160, 488],
  "RankRewardsBox", [1140, 565],
  "RewardsTL", [812, 293],
  "RewardsBR", [1471, 783],
  "RankClickSpot", [965, 602],
  "InvPotsTL", [521, 281],
  "InvPotsBR", [1467, 775],
  "DisconnectedBackgroundLeftSide", [777, 444],
  "DisconnectedBackgroundRightSide", [1143, 442],
  "ReconnectButton", [1009, 623]
)

; Lowkey colors ripped from treehousemacro idk if it'll work :) :): ):  :) :) ):
; it didnt
ColorfulNumbers := Map(
  "I", "0xDAD9E4",
  "II", "0xBEFEA7",
  "III", "0x9DEEFE",
  "IV", "0xFFDAA6",
  "V", "0xFFB1BC",
  "VI", "0xFFBAFE",
  "VII", "0xFFF8B9",
)

USC_Numerial := Map(
  "I", 4,
  "II", 2,
  "III", 1,
  "IV", 1,
  "V", 4,
  "VI", 3
)

NumNumericalEVIL := Map(
  1, "I",
  2, "II",
  3, "III",
  4, "IV",
  5, "V",
  6, "VI",
)

NumberValueMap := Map(
  "TpWaitTime", 7000,
  "EggBackwardsDistance", 1835,
  "DistanceIntoFinalZone", 650,
  "QuestReCheckTime", (10 * 1000),
  "AverageEggsPerSecond", 60,
  "TimeOnHatchingRares", 30000,
  "ItemColorGetDelay", 300,
  "FruitEatDelay", (10 * 60 * 1000),
  "FlagDelayDropTime", (20 * 60 * 1000)
)

TogglesMap := Map(
  "Enable2StarQuest", true,
  "UserOwnsAutoFarm", true,
  "UserOwnsVIP", true,
  "AutoFruit", true,
  "AutoFlag_FinalZone", true,
  "AutoFlag_VipZone", true,
  "AutoReconnect", false
)

TextSettingsMap := Map(
  "Flag_FinalZone", "Hasty Flag",
  "Flag_VipZone", "Hasty Flag"
)

QuestOCR := Map(
  "Quest1", {X: 310, Y:52, OffsetX:10, OffsetY:10, Pos:[460, 486]},
  "Quest2", {X: 310, Y:52, OffsetX:10, OffsetY:10, Pos:[460, 537]},
  "Quest3", {X: 310, Y:52, OffsetX:10, OffsetY:10, Pos:[460, 588]},
  "Quest4", {X: 310, Y:52, OffsetX:10, OffsetY:10, Pos:[460, 639]},
  "ClaimRewardsCheck", {X: 310, Y:250, OffsetX:10, OffsetY:10, Pos:[473, 460]}
)

FixItFelix := Map()

Quests := Map(
  "Coin Jars", {
    KeyWords:["Break", "Coin", "Jars", "Jar", "In"], 
    HasNumberAmount:true,
    Type:"Item",
    QuestFunction:QuestFunction_ItemUse,
    QuestArray:{
      Item:"Basic Coin Jar",
      ItemDelay:5500,
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100),
      ItemFailureMethod:"0 Priority", ; or PartyBoxxed
      ItemFailureDownTime:5 ;ItemFailureDownTime ItemFailureDownTime
    }
  },
  "Craft Potions", {
    KeyWords:["Craft", "Potions", "Upgrade"],
    HasNumberAmount:true,
    Type:"Misc",
    QuestFunction:QuestFunction_CraftPotions,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  },
  "Make Golden Pets", {
    KeyWords:["Golden", "pets", "pet"],
    HasNumberAmount:true,
    Type:"Misc",
    QuestFunction:QuestFunction_GoldenPetsical,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  },
  "Make Rainbow Pets", {
    KeyWords:["rainbow", "pets", "pet"],
    HasNumberAmount:true,
    Type:"Misc",
    QuestFunction:QuestFunction_RainbowPetsical,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  },
  "Break Minichests", {
    KeyWords:["Minichests", "Mini", "Chests", "Mini-Chests", "Mini-Chest", "best", "in"],
    HasNumberAmount:false,
    Type:"FinalZone",
    QuestFunction:QuestFunction_FinalZone,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  },
  "Destroy Breakables", {
    KeyWords:["Breakables", "Best", "Area"],
    HasNumberAmount:false,
    Type:"FinalZone",
    QuestFunction:QuestFunction_FinalZone,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  },
  "Destroy Diamond Breakables", {
    KeyWords:["Diamond", "Breakables"],
    HasNumberAmount:false,
    Type:"VipZone",
    QuestFunction:QuestFunction_Diamondical,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  },
  "Break Comets", {
    KeyWords:["Comets", "In", "Comet", "best"],
    HasNumberAmount:true,
    Type:"Item",
    QuestFunction:QuestFunction_ItemUse,
    QuestArray:{
      Item:"Comet",
      ItemDelay:6500,
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100),
      ItemFailureMethod:"0 Priority", ; or PartyBoxxed
      ItemFailureDownTime:5
    }
  },
  "Break Lucky Blocks", {
    KeyWords:["Lucky", "Block", "In", "event"],
    HasNumberAmount:true,
    Type:"Item",
    QuestFunction:QuestFunction_ItemUse,
    QuestArray:{
      Item:"Lucky Block",
      ItemDelay:12000,
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100),
      ItemFailureMethod:"0 Priority", ; or PartyBoxxed
      ItemFailureDownTime:5
    }
  },
  "Break Pinatas", {
    KeyWords:["Pinata", "In", "Pinatas", "best"],
    HasNumberAmount:true,
    Type:"Item",
    QuestFunction:QuestFunction_ItemUse,
    QuestArray:{
      Item:"Piñata",
      ItemDelay:6500,
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100),
      ItemFailureMethod:"0 Priority", ; or PartyBoxxed
      ItemFailureDownTime:5
    }
  },
  "Craft Enchants", {
    KeyWords:["Craft", "Enchants", "Upgrade"],
    HasNumberAmount:true,
    Type:"Misc",
    QuestFunction:QuestFunction_CraftEnchants,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  },
  "Hatch Best Egg", {
    KeyWords:["Best", "Eggs"],
    HasNumberAmount:false,
    Type:"Egg",
    QuestFunction:QuestFunction_Eggical,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  },
  "Hatch Rare Pets", {
    KeyWords:["Rare", "Pets", "Pet", "??"],
    HasNumberAmount:false,
    Type:"Egg",
    QuestFunction:QuestFunction_RareEggical,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  },
  "Earn Diamonds", {
    KeyWords:["Earn", "Diamonds"],
    HasNumberAmount:false,
    Type:"FinalZone",
    QuestFunction:QuestFunction_FinalZone,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  },
  "Use Potions", {
    KeyWords:["Use", "Potions"],
    HasNumberAmount:true,
    Type:"Misc",
    QuestFunction:QuestFunction_UsePotions,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  },
  "Collect Enchants", {
    KeyWords:["Collect", "Enchants"],
    HasNumberAmount:true,
    Type:"Misc",
    QuestFunction:QuestFunction_FinalZone,
    QuestArray:{
      PriorityMap:Map("Slot1", 0, "Slot2", 100, "Slot3", 100, "Slot4", 100)
    }
  }
)

global QuestsToUI := Map()

UserQuests := Map(
  "Quest1", {QuestType:"Nil",QuestAmount:0,ExtraInfo:{},Priority:0},
  "Quest2", {QuestType:"Nil",QuestAmount:0,ExtraInfo:{},Priority:0},
  "Quest3", {QuestType:"Nil",QuestAmount:0,ExtraInfo:{},Priority:0},
  "Quest4", {QuestType:"Nil",QuestAmount:0,ExtraInfo:{},Priority:0}
)


EnchantCraftSelection := Map(
  "Treasure Hunter", true,
  "Strong Pets", true,
  "Tap Power", true,
  "Coins", true,
  "Diamonds", true,
  "Criticals", true,
  "Lucky Eggs", true,
)

PotionSelection := Map(
  "Damage Potion", true,
  "Treasure Hunter Potion", true,
  "Lucky Eggs Potion", true, 
  "Diamonds Potion", true,
  "Coins Potion", true
)

MachinePets := Map(
  "Black Hole Angelus", false,
  "Void Alien", false,
  "Wireframe Dog", true,
  "Wireframe Cat", true,
)

PossibleTiers := [
  "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"
]

MultiTaskMap := Map(
  "Item+FinalZone", true,
  "Egg+FinalZone", true,
  "Egg+Vip", true,
  "FinalZone+Misc", true,
  "Vip+Misc", true,
  "DoubleEggs", true,
  "TwoOrMoreItems", true
)

global CurrentPostionLabel := "nil"
global DebugString := ""
global CurrentZone := 100
global DoRankClaim := false
global AutofarmZone := -100
global MacroEnabled := false
global CurrentLoadedSetting := 1
global EvilGyatKey := "F8"
global GyatKey := "F3"
global MediumGyatKey := "F6"
global DebugGyatKey := "F5"

global LastVIPFlagTime := 0
global LastFinalZoneFlagTime := 0
global LastFruitTime := 0

global Font1 := A_ScriptDir "\RankQuestMacroStorage\font1.ttf" ; Fredoka 1
global Font2 := A_ScriptDir "\RankQuestMacroStorage\font2.ttf" ; Times New Roman


;// Useful / Misc Functions
CleanUI() {
  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]
  MiniX := PositionMap["MiniX"]
  MiniXBR := PositionMap["MiniXBR"]
  MiniXTL := PositionMap["MiniXTL"]

  if PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
    BreakTime := A_TickCount
    loop {
      SendEvent "{Click, " X[1] ", " X[2] ", 1}"

      if A_TickCount - BreakTime >= 5000 {
        break
      }

      if not PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
        break
      }
    }
  }

  if PixelSearch(&u,&u, MiniXTL[1], MiniXTL[2], MiniXBR[1], MiniXBR[2], 0xFF0B4E, 5) {
    BreakTime := A_TickCount
    loop {
      SendEvent "{Click, " MiniX[1] ", " MiniX[2] ", 1}"

      if A_TickCount - BreakTime >= 5000 {
        break
      }

      if not PixelSearch(&u,&u, MiniXTL[1], MiniXTL[2], MiniXBR[1], MiniXBR[2], 0xFF0B4E, 5) {
        break
      }
    }
  }
  Sleep(500)
}

Inv_OpenToItem() {
  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]
  Bpb := PositionMap["InventoryBackpackButton"]

  SendEvent "{F Down}{F Up}"
  BreakTime := A_TickCount
  loop {
    if A_TickCount - BreakTime >= 5000 {
      break
    }

    if PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
      Sleep(400)
      break
    }
  }
  SendEvent "{Click, " Bpb[1] ", " Bpb[2] ", 1}"
  Sleep(500)
}

StupidCatCheck() {
  MiniX := PositionMap["MiniX"]
  MiniXBR := PositionMap["MiniXBR"]
  MiniXTL := PositionMap["MiniXTL"]

  if not PixelSearch(&u,&u, MiniXTL[1], MiniXTL[2], MiniXBR[1], MiniXBR[2], 0xFF0B4E, 5) {
    OutputDebug("`n StupidCat has NOT Been found X VER")
    return false
  }

  if PixelSearch(&u,&u, PositionMap["StupidCatTL"][1], PositionMap["StupidCatTL"][2], PositionMap["StupidCatBR"][1], PositionMap["StupidCatBR"][2], 0x95AACD, 10) {
    OutputDebug("`n StupidCat has Been found")
    return true
  }
  OutputDebug("`n StupidCat has NOT Been found")
  return false
}

TeleportToZone(SpecificName) {
  Tpb := PositionMap["TPButton"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]
  SrB := PositionMap["SearchBar"]
  TpM := PositionMap["TPUIMiddle"]
  MiniX := PositionMap["MiniX"]

  Sleep(400)
  SendEvent "{Click, " Tpb[1] ", " Tpb[2] ", 1}"
  Sleep(400)
  BreakTime := A_TickCount
  SecondaryBreakTime := A_TickCount
  loop {
      if PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xEC0D3A, 10) {
          break
      }
      if A_TickCount - BreakTime >= 6000 {
          SendEvent "{Click, " Tpb[1] ", " Tpb[2] ", 1}"
          BreakTime := A_TickCount
      }
      if A_TickCount - SecondaryBreakTime >= 20000 {
          OutputDebug("Yikes")
          break
      }
      Sleep(100)
  }

  Sleep(300)
  SendEvent "{Click, " SrB[1] ", " SrB[2] ", 1}"
  Sleep(100)
  SendText SpecificName

  Sleep(250)
  SendEvent "{Click, " TpM[1] ", " TpM[2] ", 1}"
  Sleep(NumberValueMap["TpWaitTime"])
  if StupidCatCheck() {
      SendEvent "{Click, " MiniX[1] ", " MiniX[2] ", 1}"
      Sleep(300)
  }
}

ObjToMap(Obj, Depth:=5, IndentLevel:="")
{
	if Type(Obj) = "Object"
		Obj := Obj.OwnProps()
    if Type(Obj) = "String" {
      Obj := [Obj]
    }
	for k,v in Obj
	{
		List.= IndentLevel k
		if (IsObject(v) && Depth>1)
			List.="`n" ObjToMap(v, Depth-1, IndentLevel . "    ")
		Else
			List.=":" v
		List.="/\"
	}
	
  NewMap := Map()
  SplitArray := StrSplit(List, "/\")
  for __ArrayNum, SplitText in SplitArray {
    ValueSplit := StrSplit(SplitText, ":")
    
    if InStr(SplitText, ":") {
      NewMap[ValueSplit[1]] := ValueSplit[2]
      ; OutputDebug('`n' ValueSplit[1] " : " ValueSplit[2])
    }
  }

  return NewMap
}

SpaceOutPositions(PositionArray, ToSpaceBy, ReturnDualArray) {
  ArrayHigher := [(PositionArray[1]-ToSpaceBy), (PositionArray[2]-ToSpaceBy)]
  ArrayLower := [(PositionArray[1]+ToSpaceBy), (PositionArray[2]+ToSpaceBy)]
  BaseSpreadArray := [(PositionArray[1]-ToSpaceBy), (PositionArray[2]-ToSpaceBy), (PositionArray[1]+ToSpaceBy), (PositionArray[2]+ToSpaceBy)]
  if ReturnDualArray {
      return [ArrayHigher, ArrayLower, BaseSpreadArray]
  } else {
      return BaseSpreadArray
  }
}

CloneMap(MapToClone) {
  NewMap := Map()
  for Key, Value in MapToClone {
      NewMap[Key] := Value
  }
  return NewMap
}

;;// Ui Shenanigans
QuestCreationUIFUNCTION(QuestName, QuestInfo, QuestListView) {
  NewString := ""

  for _, Keyword in QuestInfo.KeyWords {
    if not _ = QuestInfo.KeyWords.Length {
      NewString := NewString Keyword ","
    } else {
      NewString := NewString Keyword
    }
  }


  QuestListView.Add("", QuestName, QuestInfo.Type)

  NewQuestUI := Gui()
  UiList.InsertAt(UiList.Length + 1, NewQuestUI)
  NewQuestUI.Opt("+AlwaysOnTop")
  NewQuestUI.AddText("w200 h20 Section", QuestName).SetFont("s12 w700")
  NewQuestUI.AddText("w100 h20 xs", "KeyWords: ").SetFont("s10")
  NewQuestUI.AddEdit("w150 h20 vKeyWords yp xp+140", NewString).SetFont("s9")

  try {
    if QuestInfo.QuestArray.Item {
      NewQuestUI.AddText("w100 h20 xs", "ItemToUse: ").SetFont("s10")
      NewQuestUI.AddEdit("w150 h20 vItem yp xp+140", QuestInfo.QuestArray.Item).SetFont("s9")
    }
  }
  
  try {
    if QuestInfo.QuestArray.ItemDelay {
      NewQuestUI.AddText("w120 h20 xs", "ItemSpawnDelay: ").SetFont("s10")
      NewQuestUI.AddEdit("w150 h20 vItemDelay yp xp+140", QuestInfo.QuestArray.ItemDelay).SetFont("s9")
    }
  }

  try {
    for Slot, Priority in QuestInfo.QuestArray.PriorityMap {
      NewQuestUI.AddText("w120 h20 xs", "Quest " Slot " Priority: ").SetFont("s10")
      NewQuestUI.AddEdit("w150 h20 v" Slot "Priority yp xp+140", Priority).SetFont("s9")
    } 
  }

  try {
    if QuestInfo.QuestArray.ItemFailureMethod {
      TempMap := Map("0 Priority", 1, "PartyBoxxed", 2)
      NewQuestUI.AddText("w120 h20 xs", "ItemFailureMethod: ").SetFont("s10")
      NewQuestUI.AddDropDownList("w150 h20 r2 vItemFailureMethod yp xp+140 Choose" TempMap[QuestInfo.QuestArray.ItemFailureMethod], ["0 Priority", "PartyBox"]) ;.SetFont("s9")
    }
  }

  try {
    if QuestInfo.QuestArray.ItemFailureDownTime {
      NewQuestUI.AddText("w135 h20 xs", "ItemFailureDownTime:").SetFont("s10")
      NewQuestUI.AddEdit("w150 h20 vItemFailureDownTime yp xp+140", QuestInfo.QuestArray.ItemFailureDownTime).SetFont("s9")
    }
  }



  ApplySettingsButton := NewQuestUI.AddButton("w120 h25 xs", "Apply Settings")
  ApplySettingsButton.SetFont("s10 w500")
  ApplySettingsButton.OnEvent("Click", ApplySettings)

  ApplySettings(*) {
    L_Submit := NewQuestUI.Submit()
    R_Submit := ObjToMap(L_Submit)
    Quests[QuestName].KeyWords := StrSplit(L_Submit.KeyWords, ",")

    try { 
      Value := "0 Priority"
      Quests[QuestName].QuestArray.Item := L_Submit.Item
      Quests[QuestName].QuestArray.ItemDelay := L_Submit.ItemDelay

      if L_Submit.ItemFailureMethod != "0 Priority" {
        Value := "PartyBoxxed"
      }

      Quests[QuestName].QuestArray.ItemFailureMethod := Value
      Quests[QuestName].QuestArray.ItemFailureDownTime := L_Submit.ItemFailureDownTime
    }

    for Slot, __Num in QuestInfo.QuestArray.PriorityMap {
      QuestInfo.QuestArray.PriorityMap[Slot] := R_Submit[Slot "Priority"]
    }
  }

  QuestsToUI[QuestName] := NewQuestUI
}

global ExternalUI := Map()

for UI, _ in ExternalUI {
  UI.Opt("+AlwaysOnTop")
}

CreateUIs(MapToEvilize, TypeOfButton, Name) {
  AdditiveUI := Gui()
  DestructiveUI := Gui()
  UiList.InsertAt(UiList.Length + 1, AdditiveUI)
  UiList.InsertAt(UiList.Length + 1, DestructiveUI)

  DestroyArray := []
  for Key,_ in MapToEvilize {
    DestroyArray.InsertAt(DestroyArray.Length + 1, Key)
  }

  AdditiveUI.Opt("+AlwaysOnTop")
  DestructiveUI.Opt("+AlwaysOnTop")

  AdditiveUI.AddText("w300 h20 Section", "Add To Selection | " Name).SetFont("s12 w700")
  DestructiveUI.AddText("w300 h20 Section", "Remove From Selection | " Name).SetFont("s12 w700")

  AdditiveUI.AddEdit("w150 h20 vNewInstance", "New Selection Here").SetFont("s10")
  if TypeOfButton = "toggle" {
    AdditiveUI.AddDropDownList("w80 h20 vBaseValue Choose1 r2 yp xp+160", ["true", "false"]).SetFont("s9")
  }

  DestructiveUI.AddDropDownList("w150 h20 vDestroyValue Choose1 r6", DestroyArray).SetFont("s9")
  DestroyButton := DestructiveUI.AddButton("w120 h30 xs", "Destroy Selection")
  DestroyButton.SetFont("s10")
  AddButton := AdditiveUI.AddButton("w120 h30 xs", "Add Selection")
  AddButton.SetFont("s10")

  return {
    Additive:{
      AddButton:AddButton,
      PhysicalUI:AdditiveUI
    },
    Destructive:{
      DestroyButton:DestroyButton,
      PhsyicalUI:DestructiveUI
    }
  }
}

; CreateUIs(PotionSelection, "toggle", "Potions")

GuiPos1(Name, PositionArray, Num) {
  PositionMapUI.Add("Text","Section xs y" (90 + ((Num - 1) * 30)), Name)
  PositionMapUI.Add("Button", "w25 h25 x220 ys", "S").OnEvent("Click", ButtonClicked)
  Ud1 := PositionMapUI.Add("Edit","ys w60 x250",)
  PositionMapUI.AddUpDown("v" Name "XPos Range1-4000", PositionArray[1])

  ud2 := PositionMapUI.Add("Edit","ys w60 x320",)
  PositionMapUI.AddUpDown("v" Name "YPos Range1-4000", PositionArray[2])

  ButtonClicked(*) {
      global CurrentPostionLabel := [UD1, UD2]
  }
}

GuiPos2(Quest) {
  QuestOCRUI.SetFont("s9 q5 w500", "Arial")
  QuestOCRUI.Add("Text","Section xs y" (90 + ((1- 1) * 30)), "QuestOCRTopLeftPos: ")
  QuestOCRUI.Add("Button", "w25 h25 x220 ys", "S").OnEvent("Click", ButtonClicked)
  Ud1 := QuestOCRUI.Add("Edit","ys w60 x250",)
  QuestOCRUI.AddUpDown("v" Quest "XPos Range1-4000", QuestOCR[Quest].Pos[1])

  ud2 := QuestOCRUI.Add("Edit","ys w60 x320",)
  QuestOCRUI.AddUpDown("v" Quest "YPos Range1-4000", QuestOCR[Quest].Pos[2])

  ButtonClicked(*) {
      global CurrentPostionLabel := [UD1, UD2]
  }
}

GuiPos3(Quest) {
  QuestOCRUI.SetFont("s9 q5 w500", "Arial")
  QuestOCRUI.Add("Text","Section xs y" (90 + ((2 - 1) * 30)), "QuestOcrCheckSize: ")
  Ud1 := QuestOCRUI.Add("Edit","ys w60 x250",)
  QuestOCRUI.AddUpDown("v" Quest "XSize Range1-4000", QuestOCR[Quest].X)

  ud2 := QuestOCRUI.Add("Edit","ys w60 x320",)
  QuestOCRUI.AddUpDown("v" Quest "YSize Range1-4000", QuestOCR[Quest].Y)
}

global RankUI := Gui(,"Ranking Macro | Version " Version)
global ToggleSettingsUI := Gui()
global NumberSettingsUI := Gui()
global PotionSelectionUI := Gui()
global MachinePetsUI := Gui()
global EnchantCraftSelectionUI := Gui()
global MultiTaskMapUI := Gui()
global PositionMapUI := Gui()
global QuestOCRUI := Gui()
global DonateUI := Gui()  
global TextSettingsUI := Gui()
global SaveSettingWindow := Gui()

UIItUp() {
  ExternalUIOrder := [
    ToggleSettingsUI, NumberSettingsUI, TextSettingsUI, PotionSelectionUI,
    MachinePetsUI, EnchantCraftSelectionUI, MultiTaskMapUI,
    PositionMapUI, QuestOCRUI
  ]

  global UiList := [
    ToggleSettingsUI, NumberSettingsUI, PotionSelectionUI,
    MachinePetsUI, EnchantCraftSelectionUI, MultiTaskMapUI,
    PositionMapUI, QuestOCRUI, SaveSettingWindow, RankUI, DonateUI, TextSettingsUI
  ]

  RankUI.Opt("+AlwaysOnTop")
  UTabs := RankUI.AddTab3("", ["Main", "Quests", "Settings", "Extras"])
  ; Main
  
  UTabs.UseTab(2)
  RankUI.AddText("Section w140 h20 x92 y35", "Quest Setup").SetFont("s12 w700")
  QuestListView := RankUI.AddListView("x20 y55 w250 r16 Vis", ["Quest Name", "Quest Type"])
  RankUI.AddText("Section w220 h14 x38 y365", "(Double Click The Quest To Edit It's Settings)").SetFont("s8 w300")
  QuestListView.OnEvent("DoubleClick", QuestInfoFunction)
  
  RankUI.SetFont("",)

  QuestInfoFunction(LV, RowNum) {
    QuestName := LV.GetText(RowNum)
    Position := RankUI.GetPos(&u, &u2, &u3, &u4)

    QuestsToUI[QuestName].Show("X" (u + u3) " Y" u2 "")
  }


  for QuestName, QuestInfo in Quests {
    QuestCreationUIFUNCTION(QuestName, QuestInfo, QuestListView)
  }

  UTabs.UseTab(3)
  RankUI.GetClientPos(&u, &u, &UIWidth, &UIHeight)
  RankUI.AddText("w80 h20 x" (UIWidth/2 + (80*1.5) - RankUI.MarginX)+5 " y35", "Settings").SetFont("s12 w700")
  N_1 := 30

  UiToFunctionMap := Map(
    ToggleSettingsUI, ToggleSettingsUIFunc,
    NumberSettingsUI, NumberSettingsUIFunc, 
    PotionSelectionUI, PotionSelectionFunc,
    MachinePetsUI, MachinePetsUIFunc, 
    EnchantCraftSelectionUI, EnchantCraftSelectionUIFunc, 
    MultiTaskMapUI, MultiTaskMapUIFunc,
    PositionMapUI, PositionMapUIFunc,
    QuestOCRUI, QuestOCRUIFunc,
    TextSettingsUI, TextSettingsUIFunc,
  )

  UItoNAMEmap := Map(
    ToggleSettingsUI, "Toggles Settings",
    NumberSettingsUI, "Number Settings", 
    PotionSelectionUI, "Potion Selection",
    MachinePetsUI, "Pet Selection", 
    EnchantCraftSelectionUI, "Enchant Selection", 
    MultiTaskMapUI, "Multi-Task Settings",
    PositionMapUI, "Positioning Settings",
    QuestOCRUI, "QuestOCR Settings",
    TextSettingsUI, "Text Settings"
  )


  for _GuiNum, GuiD in ExternalUIOrder {    
    N_1 += 35
    NewButton := RankUI.AddButton("w160 h30 x" (UIWidth/2 + 80 - RankUI.MarginX) " y" N_1, UItoNAMEmap[GuiD])
    NewButton.SetFont("s10")
    NewButton.OnEvent("Click", UiToFunctionMap[GuiD])
  } 

  QuestListView.ModifyCol(1, "AutoHdr")
  QuestListView.ModifyCol(2, "AutoHdr")

  UTabs.UseTab(1)
  RankUI.AddText("Section w170 h20 x20 y35", "RankQuestMacro").SetFont("s15 w700")
  RankUI.AddText("w170 h20 x20 yp+20", "Version: " Version).SetFont("s12 w500")
  RankUI.AddLink("w240 h20 x20 yp+20", 'Macro Made By <a href="https://www.youtube.com/channel/UCKOkQGvHO71nqQjwTiJX5Ww">A Basement</a> / <a href="https://www.roblox.com/users/128699642/profile">Oliyopi</a>').SetFont("s10 w500")
  RankUI.AddText("w200 h100 x20 yp+40 Wrap", "Check out the video down below to figure out how to use this, aswell as join the discord if you encounter any issues / bugs").SetFont("s10 w500")

  EMB := RankUI.AddButton("w100 h30 xs y350", "Enable Macro")
  YTB := RankUI.AddButton("w70 h30 xp+100 y350", "YT Video")
  DB := RankUI.AddButton("w75 h30 xp+70 y350", "Discord")

  EMB.SetFont("s10")
  YTB.SetFont("s10")
  DB.SetFont("s10")

  EMB.OnEvent("Click", EnablingEvils)
  DB.OnEvent("Click", DBevent)
  YTB.OnEvent("Click", YTBevent)

  EnablingEvils(*) {
    RankUI.Hide()
    for _, UI in UiList {
      try {
        UI.Hide()
      }
    }

    global MacroEnabled := true
  }

  DBevent(*) {
    Run "https://discord.com/invite/JrwB6jVxkR"
  }

  YTBevent(*) {
    Run "https://www.youtube.com/watch?v=ZSUV_iGsKGM"
  }

  UTabs.UseTab(4)
  RankUI.SetFont("s11")
  RankUI.Add("Button","x15 y270","Save Settings").OnEvent("Click", SaveSettings)
  RankUI.Add("Button","x15 y305","Save Settings As New File").OnEvent("Click", SaveNewSettings)
  RankUI.Add("Button","x15 y30 h30 w200","Set Font To Times New Roman").OnEvent("Click", SetToTimesNewRoman)
  RankUI.Add("Button","x15 y60 h30 w200","Set Font To Fredoka One").OnEvent("Click", SetToFredokaOne)
  RankUI.Add("Button","x15 y90 h30 w100","Donate").OnEvent("Click", DonateUIitUp)
  RankUI.AddText("Section x20 y140", "Start Hotkey")
  GK1 := RankUI.AddHotkey("vStartHotkey w50 Limit128", GyatKey)
  GK1.OnEvent("Change", StartChange)

  RankUI.AddText("xs+90 ys", "Stop Hotkey")
  GK2 := RankUI.AddHotkey("vStopHotkey w50 Limit128", EvilGyatKey)
  GK2.OnEvent("Change", StopChange)

  RankUI.AddText("Section xs", "Pause Hotkey")
  GK3 := RankUI.AddHotkey("vPauseHotkey w50 Limit128", MediumGyatKey)
  GK3.OnEvent("Change", PauseChange)

  RankUI.AddText("xs+90 ys", "Debug Hotkey")
  Gk4 := RankUI.AddHotkey("vDebugHotkey w50 Limit128", DebugGyatKey)
  Gk4.OnEvent("Change", DebugChange)

  PauseChange(*) {
    Hotkey MediumGyatKey, SemiMainFunction, "Off"
    global MediumGyatKey := GK3.Value
    Hotkey MediumGyatKey, SemiMainFunction, "On"
  }

  StartChange(*) {
    Hotkey GyatKey, MainFunction, "Off"
    global GyatKey := GK1.Value
    Hotkey GyatKey, MainFunction, "On"
  }

  StopChange(*) {
    Hotkey EvilGyatKey, UnmainFunction, "Off"
    global EvilGyatKey := GK2.Value
    Hotkey EvilGyatKey, UnmainFunction, "On"
  }

  DebugChange(*) {
    Hotkey DebugGyatKey, DebugMainFunction, "Off"
    global DebugGyatKey := Gk4.Value
    Hotkey DebugGyatKey, DebugMainFunction, "On"
  }

  SetToTimesNewRoman(*) {
    try {
      StringCoolness := WinGetProcessPath("ahk_exe RobloxPlayerBeta.exe")
      FontPath := SubStr(StringCoolness, 1, (StrLen(StringCoolness) - StrLen("RobloxPlayerBeta.exe"))) "content\fonts"
  
      FileCopy(Font2, FontPath "\FredokaOne-Regular.ttf", true)
    } catch as e {
      MsgBox("Roblox aint open you fuhalatoogin`n(" e.Message ")")
    }
  }

  SetToFredokaOne(*) {  
    try {
      StringCoolness := WinGetProcessPath("ahk_exe RobloxPlayerBeta.exe")
      FontPath := SubStr(StringCoolness, 1, (StrLen(StringCoolness) - StrLen("RobloxPlayerBeta.exe"))) "content\fonts"
  
      FileCopy(Font1, FontPath "\FredokaOne-Regular.ttf", true)
    } catch as e {
      MsgBox("Roblox aint open you fuhalatoogin`n(" e.Message ")")
    }
  }

  global SettingsMap := Map()
  global SettingsArray := []

  loop files, A_ScriptDir "\RankQuestMacroSettings\*.ini" {
      SettingsMap[A_LoopFileName] := SettingsArray.Length + 1
      SettingsArray.InsertAt(SettingsArray.Length + 1, A_LoopFileName)
  }

  RankUI.Add("Text", "x15 y335", "↓ Load Setting File ↓")
  SettingDD := RankUI.Add("DropDownList", "w200 x15 y355 vLoadSetting choose" CurrentLoadedSetting, SettingsArray)
  SettingDD.OnEvent("Change", SettingChanged)

  SaveSettingWindow.SetFont("s11 q5 w500", "Arial")
  SaveSettingWindow.Add("Text", "", "Enter File Name`n(Duplicate Named Files Will Overwrite)`n(No Need to add .ini)")
  SaveSettingWindow.Opt("+AlwaysOnTop")
  SSWText := SaveSettingWindow.Add("Edit", "vName w200", "NewSettingFile" SettingsArray.Length + 1)
  SaveSettingWindow.Add("Button", "", "Save").OnEvent("Click", SaveAsNewFile)

  SaveSettings(*) {
    SavedSetting := RankUI.Submit(false)

    if SavedSetting.LoadSetting = "" {
      SaveAsNewFile()
      return
    }

    FileToSaveTo := A_ScriptDir "\RankQuestMacroSettings\" SavedSetting.LoadSetting 

    for Key, Value in TextSettingsMap {
      IniWrite(Value, FileToSaveTo, "TextSettings", Key)
    } 

    for Key, Value in PositionMap {
      IniWrite(Value[1] "|" Value[2], FileToSaveTo, "Positioning", Key)
    }

    for Key, Value in NumberValueMap {
        IniWrite(Value, FileToSaveTo, "NumberValues", Key)
    }

    for Key, Value in TogglesMap {
        IniWrite(Value, FileToSaveTo, "ToggleSettings", Key)
    }

    for Key, StupidArray in QuestOCR {
        IniWrite(StupidArray.X, FileToSaveTo, "QuestOCR", Key "X")
        IniWrite(StupidArray.Y, FileToSaveTo, "QuestOCR", Key "Y")
        IniWrite(StupidArray.Pos[1] "|" StupidArray.Pos[2], FileToSaveTo, "QuestOCR", Key "Pos")
    }

    for Quest, QuestArray in Quests {
      KeywordString := ""
      
      for _, KW in QuestArray.KeyWords {
        if KeywordString = "" {
          KeywordString := KW 
        } else {
          KeywordString := KeywordString "|" KW
        }
      }

      IniWrite(KeywordString, FileToSaveTo, "Keywords", Quest)
      for Slot, Priority in QuestArray.QuestArray.PriorityMap {
        IniWrite(Priority, FileToSaveTo, "SlotPriority", Quest Slot)
      }

      try {
        IniWrite(QuestArray.QuestArray.Item, FileToSaveTo, "Items", Quest)
        IniWrite(QuestArray.QuestArray.ItemDelay, FileToSaveTo, "ItemDelays", Quest)
        IniWrite(QuestArray.QuestArray.ItemFailureMethod, FileToSaveTo, "ItemFailureMethod", Quest)
        IniWrite(QuestArray.QuestArray.ItemFailureDownTime, FileToSaveTo, "ItemFailureDownTime", Quest)
      }
    }

    FireText := ""

    for Pet, Enabled in MachinePets {
      if FireText = "" {
        FireText := Pet ":" Enabled
      } else {
        FireText := FireText "|" Pet ":" Enabled
      }
    }

    IniWrite(FireText, FileToSaveTo, "PetArray", "PetString")

    FireText := ""
    torf := Map(false, "false", true, "true")

    for Pet, Enabled in PotionSelection {
      if FireText = "" {
        FireText := Pet ":" Enabled
      } else {
        FireText := FireText "|" Pet ":" Enabled
      }
    }

    IniWrite(FireText, FileToSaveTo, "PotionArray", "PotionString")

    FireText := ""
    torf := Map(false, "false", true, "true")

    for Pet, Enabled in EnchantCraftSelection {
      if FireText = "" {
        FireText := Pet ":" Enabled
      } else {
        FireText := FireText "|" Pet ":" Enabled
      }
    }

    IniWrite(FireText, FileToSaveTo, "EnchantArray", "EnchantString")
    IniWrite(GyatKey, FileToSaveTo, "HotKeys", "StartKey")
    IniWrite(EvilGyatKey, FileToSaveTo, "HotKeys", "StopKey")
    IniWrite(MediumGyatKey, FileToSaveTo, "HotKeys", "PauseKey")
    IniWrite(DebugGyatKey, FileToSaveTo, "HotKeys", "DebugKey")
  }

  SaveNewSettings(*) {
    SaveSettingWindow.Show()
  }

  SaveAsNewFile(*) {
    FileName := SaveSettingWindow.Submit().Name
    FileToSaveTo := A_ScriptDir "\RankQuestMacroSettings\" FileName ".ini"
    IniWrite(FileName ".ini", "Info.ini", "LastLoadedSetting", "Setting")

    
    for Key, Value in TextSettingsMap {
      IniWrite(Value, FileToSaveTo, "TextSettings", Key)
    } 

    for Key, Value in PositionMap {
      IniWrite(Value[1] "|" Value[2], FileToSaveTo, "Positioning", Key)
    }

    for Key, Value in NumberValueMap {
      IniWrite(Value, FileToSaveTo, "NumberValues", Key)
    }

    for Key, Value in TogglesMap {
      IniWrite(Value, FileToSaveTo, "ToggleSettings", Key)
    }

    for Key, StupidArray in QuestOCR {
      IniWrite(StupidArray.X, FileToSaveTo, "QuestOCR", Key "X")
      IniWrite(StupidArray.Y, FileToSaveTo, "QuestOCR", Key "Y")
      IniWrite(StupidArray.Pos[1] "|" StupidArray.Pos[2], FileToSaveTo, "QuestOCR", Key "Pos")
    }

    for Quest, QuestArray in Quests {
      KeywordString := ""
      
      for _, KW in QuestArray.KeyWords {
        if KeywordString = "" {
          KeywordString := KW 
        } else {
          KeywordString := KeywordString "|" KW
        }
      }

      IniWrite(KeywordString, FileToSaveTo, "Keywords", Quest)
      for Slot, Priority in QuestArray.QuestArray.PriorityMap {
        IniWrite(Priority, FileToSaveTo, "SlotPriority", Quest Slot)
      }

      try {
        IniWrite(QuestArray.QuestArray.Item, FileToSaveTo, "Items", Quest)
        IniWrite(QuestArray.QuestArray.ItemDelay, FileToSaveTo, "ItemDelays", Quest)
        IniWrite(QuestArray.QuestArray.ItemFailureMethod, FileToSaveTo, "ItemFailureMethod", Quest)
        IniWrite(QuestArray.QuestArray.ItemFailureDownTime, FileToSaveTo, "ItemFailureDownTime", Quest)
      }
    }

    FireText := ""
    for Pet, Enabled in MachinePets {
      OutputDebug("`n" Pet " : " Enabled " | " type(Enabled))
      if FireText = "" {
        FireText := Pet ":" Enabled
      } else {
        FireText := FireText "|" Pet ":" Enabled
      }
    }

    IniWrite(FireText, FileToSaveTo, "PetArray", "PetString")

    FireText := ""

    for Pet, Enabled in PotionSelection {
      if FireText = "" {
        FireText := Pet ":" Enabled
      } else {
        FireText := FireText "|" Pet ":" Enabled
      }
    }

    IniWrite(FireText, FileToSaveTo, "PotionArray", "PotionString")

    FireText := ""

    for Pet, Enabled in EnchantCraftSelection {
      if FireText = "" {
        FireText := Pet ":" Enabled
      } else {
        FireText := FireText "|" Pet ":" Enabled
      }
    }

    IniWrite(FireText, FileToSaveTo, "EnchantArray", "EnchantString")
    IniWrite(GyatKey, FileToSaveTo, "HotKeys", "StartKey")
    IniWrite(EvilGyatKey, FileToSaveTo, "HotKeys", "StopKey")
    IniWrite(MediumGyatKey, FileToSaveTo, "HotKeys", "PauseKey")
    IniWrite(DebugGyatKey, FileToSaveTo, "HotKeys", "DebugKey")

    global SettingsMap := Map()
    global SettingsArray := []
    SavedNum := 0

    loop files, A_ScriptDir "\RankQuestMacroSettings\*.ini" {
        SettingsMap[A_LoopFileName] := SettingsArray.Length + 1
        SettingsArray.InsertAt(SettingsArray.Length + 1, A_LoopFileName)

        if A_LoopFileName = FileName ".ini" {
            SavedNum := SettingsArray.Length
            IniWrite(SavedNum, "Info.ini", "LastLoadedSetting", "SettingNum")
        }
    }

    SettingDD.Delete()
    SettingDD.Add(SettingsArray)
    SettingDD.Choose(SavedNum)
    SSWText.Text := "NewSettingFile" SettingsArray.Length + 1
  }

  DonateUIFunc(*) {
    DonateUI.Show()
  }

  ToggleSettingsUIFunc(*) {
    ToggleSettingsUI.Show()
  }

  NumberSettingsUIFunc(*) {
    NumberSettingsUI.Show()
  }

  PotionSelectionFunc(*) {
    PotionSelectionUI.Show()
  }

  MachinePetsUIFunc(*) {
    MachinePetsUI.Show()
  }

  EnchantCraftSelectionUIFunc(*) {
    EnchantCraftSelectionUI.Show()
  }

  MultiTaskMapUIFunc(*) {
    MultiTaskMapUI.Show()
  }

  PositionMapUIFunc(*) {
    PositionMapUI.Show()
  }

  QuestOCRUIFunc(*) {
    QuestOCRUI.Show()
  }

  TextSettingsUIFunc(*) {
    TextSettingsUI.Show()
  }

  ; Donate UI
  DonateUI.Opt("+AlwaysOnTop")
  DonateUI.SetFont("s15 q5 w700", "Arial")
  DonateUI.Add("Text", "Section", "Donation Section")
  DonateUI.SetFont("s11 q5 w700", "Arial")
  DonateUI.Add("Text", "xs Wrap w400", "(Please note that you dont have to donate, but it is very much appreciated)`n`nIf you wish to donate, you can send me items via mailbox, my user is oliyopi!`n`nOr if you wish to donate money, you can send some via paypal with the button below`n(If you donate via paypal make sure to input your discord username so i can give you a role ❤️)")
  DonateUI.Add("Button", "xs y300", "Donate Via Paypal").OnEvent("Click", OpenDonation) 

  ; ToggleSettingsUI
  TSUI() {
    ToggleSettingsUI.AddText("w200 h20 Section", "Toggle Settings").SetFont("s12 w700")
    for Setting, SettingValue in TogglesMap {
      ToggleSettingsUI.AddText("w150 h20 xs", Setting ":").SetFont("s10")
      ToggleSettingsUI.AddCheckbox("w20 h20 v" Setting " yp xp+190 Checked" SettingValue).SetFont("s9")
    }

    FinalizeButton := ToggleSettingsUI.AddButton("w95 h30 xs", "Set Values")
    FinalizeButton.OnEvent("Click", Func53)
    FinalizeButton.SetFont("s10")

    Func53(*) {
      ToggleSettingsUI.Hide()
      SubmitValues := ObjToMap(ToggleSettingsUI.Submit())
      
      ; Have to get it from submit values since there could be new keys
      for Key, Value in SubmitValues {
        TogglesMap[Key] := Value
      }
    }
  
    RankUI.GetPos(&u, &u2, &u3, &u4)
    ToggleSettingsUI.GetPos(&a, &a2, &a3, &a4)
    ToggleSettingsUI.Show("X" (u - a3) " Y" u2 "")
      
    ToggleSettingsUI.GetPos(&a, &a2, &a3, &a4)
    ToggleSettingsUI.Show("X" (u - a3) " Y" u2 "")
    ToggleSettingsUI.Hide()
  }

  ; Number Settings UI
  NSUI() {
    RankUI.GetPos(&u, &u2, &u3, &u4)

    NumberSettingsUI.AddText("w200 h20 Section", "Number Value Settings").SetFont("s12 w700")
    for Setting, SettingValue in NumberValueMap {
      NumberSettingsUI.AddText("w190 h20 xs", Setting ":").SetFont("s10")
      NumberSettingsUI.AddEdit("w120 h20 yp xp+190")
      NumberSettingsUI.AddUpDown("v" Setting " range1-10000000" Setting, SettingValue)
    }
  
    FinalizeButton := NumberSettingsUI.AddButton("w95 h30 xs", "Set Values")
    FinalizeButton.OnEvent("Click", Func5)
    FinalizeButton.SetFont("s10")

    Func5(*) {
      NumberSettingsUI.Hide()
      SubmitValues := ObjToMap(NumberSettingsUI.Submit())
      
      ; Have to get it from submit values since there could be new keys
      for Key, Value in SubmitValues {
        NumberValueMap[Key] := Value
      }
    }

    NumberSettingsUI.GetPos(&a, &a2, &a3, &a4)
    NumberSettingsUI.Show("X" (u - a3) " Y" u2 "")
      
    NumberSettingsUI.GetPos(&a, &a2, &a3, &a4)
    NumberSettingsUI.Show("X" (u - a3) " Y" u2 "")
    NumberSettingsUI.Hide()
  }

  ; Text Settings UI
  TxSUI() {
    RankUI.GetPos(&u, &u2, &u3, &u4)

    TextSettingsUI.AddText("w200 h20 Section", "Text Settings").SetFont("s12 w700")
    for Setting, SettingValue in TextSettingsMap {
      TextSettingsUI.AddText("w190 h20 xs", Setting ":").SetFont("s10")
      TextSettingsUI.AddEdit("w120 h20 yp xp+190 v" Setting, SettingValue)
    }
  
    FinalizeButton := TextSettingsUI.AddButton("w95 h30 xs", "Set Values")
    FinalizeButton.OnEvent("Click", Func5)
    FinalizeButton.SetFont("s10")

    Func5(*) {
      TextSettingsUI.Hide()
      SubmitValues := ObjToMap(TextSettingsUI.Submit())
      
      ; Have to get it from submit values since there could be new keys
      for Key, Value in SubmitValues {
        TextSettingsMap[Key] := Value
      }
    }

    TextSettingsUI.GetPos(&a, &a2, &a3, &a4)
    TextSettingsUI.Show("X" (u - a3) " Y" u2 "")
      
    TextSettingsUI.GetPos(&a, &a2, &a3, &a4)
    TextSettingsUI.Show("X" (u - a3) " Y" u2 "")
    TextSettingsUI.Hide()
  }

  ; Potion Selection UI
  PSUI() {
    RankUI.GetPos(&u, &u2, &u3, &u4)

    PotionSelectionUI.AddText("w200 h20 Section", "Potion Selection").SetFont("s12 w700")
    PotsSpacelessTable := Map()
    for Setting, SettingValue in PotionSelection {
      NewerString := ""
      for _, Text in StrSplit(Setting, " ") {
        NewerString := NewerString Text
      }
      PotsSpacelessTable[NewerString] := Setting
  
      PotionSelectionUI.AddText("w150 h20 xs", Setting ":").SetFont("s10")
      PotionSelectionUI.AddCheckbox("w20 h20 v" NewerString " yp xp+210 Checked" SettingValue).SetFont("s9")
    }
  
  
    PUIObjectTable := CreateUIs(PotionSelection, "toggle", "Potions")
    PAdditiveUI := PUIObjectTable.Additive.PhysicalUI
    PAdditiveButton := PUIObjectTable.Additive.AddButton
    PDestructiveUI := PUIObjectTable.Destructive.PhsyicalUI
    PDestructiveButton := PUIObjectTable.Destructive.DestroyButton
  
    PAUB := PotionSelectionUI.AddButton("w95 h30 xs", "Add Selection")
    PDUB := PotionSelectionUI.AddButton("w125 h30 xs+100 yp", "Remove Selection")
    PFinalizeButton := PotionSelectionUI.AddButton("w95 h30 xs", "Set Values")
    PFinalizeButton.SetFont("s10")
  
    PFunc1(*) {
      PAdditiveUI.Show()
    }
  
    PFunc2(*) {
      PDestructiveUI.Show()
    }
  
    PFunc3(*) {
      global PotionSelectionUI
  
      Values := PAdditiveUI.Submit()
      HitValue := true
      if Values.BaseValue = "false" {
        HitValue := false
      }
  
      PotionSelection[Values.NewInstance] := HitValue
  
      PAdditiveUI.Destroy()
      PDestructiveUI.Destroy()
      PotionSelectionUI.Destroy()
      global PotionSelectionUI := Gui()
      PotionSelectionUI.Opt("+AlwaysOnTop")  

      UiList.InsertAt(UiList.Length + 1, PotionSelectionUI)
      PSUI()
      PotionSelectionFunc()
    }
  
    PFunc4(*) {
      global PotionSelectionUI

  
      Values := PDestructiveUI.Submit()
      PotionSelection.Delete(Values.DestroyValue)
  
      PAdditiveUI.Destroy()
      PDestructiveUI.Destroy()
      PotionSelectionUI.Destroy()
      global PotionSelectionUI := Gui()
      PotionSelectionUI.Opt("+AlwaysOnTop")
  
      UiList.InsertAt(UiList.Length + 1, PotionSelectionUI)
      PSUI()
      PotionSelectionFunc()
    }
  
    PFunc5(*) {
      PAdditiveUI.Hide()
      PDestructiveUI.Hide()
      SubmitValues := ObjToMap(PotionSelectionUI.Submit())
      
      ; Have to get it from submit values since there could be new keys
      for Key, Value in SubmitValues {
        PotionSelection[PotsSpacelessTable[Key]] := Value
      }
    }
  
    PAUB.OnEvent("Click", PFunc1)
    PDUB.OnEvent("Click", PFunc2)
    PAdditiveButton.OnEvent("Click", PFunc3)
    PDestructiveButton.OnEvent("Click", PFunc4)
    PFinalizeButton.OnEvent("Click", PFunc5)
  
    PAUB.SetFont("s10")
    PDUB.SetFont("s10")
  
    PotionSelectionUI.GetPos(&a, &a2, &a3, &a4)
    PotionSelectionUI.Show("X" (u - a3) " Y" u2 "")
      
    PotionSelectionUI.GetPos(&a, &a2, &a3, &a4)
    PotionSelectionUI.Show("X" (u - a3) " Y" u2 "")
    PotionSelectionUI.Hide()
  }

  ; Machine Pets UI
  MPUI() {
    RankUI.GetPos(&u, &u2, &u3, &u4)

    MachinePetsUI.AddText("w200 h20 Section", "Machine Pets Selection").SetFont("s12 w700")
  MPSpacelessTable := Map()
  for Setting, SettingValue in MachinePets {
    NewerString := ""
    for _, Text in StrSplit(Setting, " ") {
      NewerString := NewerString Text
    }
    MPSpacelessTable[NewerString] := Setting

    MachinePetsUI.AddText("w150 h20 xs", Setting ":").SetFont("s10")
    MachinePetsUI.AddCheckbox("w20 h20 v" NewerString " yp xp+210 Checked" SettingValue).SetFont("s9")
  }


  MPUIObjectTable := CreateUIs(MachinePets, "toggle", "Machine Pets")
  MPAdditiveUI := MPUIObjectTable.Additive.PhysicalUI
  MPAdditiveButton := MPUIObjectTable.Additive.AddButton
  MPDestructiveUI := MPUIObjectTable.Destructive.PhsyicalUI
  MPDestructiveButton := MPUIObjectTable.Destructive.DestroyButton

  MPAUB := MachinePetsUI.AddButton("w95 h30 xs", "Add Selection")
  MPDUB := MachinePetsUI.AddButton("w125 h30 xs+100 yp", "Remove Selection")
  MPFinalizeButton := MachinePetsUI.AddButton("w95 h30 xs", "Set Values")
  MPFinalizeButton.SetFont("s10")

  MPFunc1(*) {
    MPAdditiveUI.Show()
  }

  MPFunc2(*) {
    MPDestructiveUI.Show()
  }

  MPFunc3(*) {
    global MachinePetsUI


    Values := MPAdditiveUI.Submit()
    HitValue := true
    if Values.BaseValue = "false" {
      HitValue := false
    }

    MachinePets[Values.NewInstance] := HitValue

    MPAdditiveUI.Destroy()
    MPDestructiveUI.Destroy()
    MachinePetsUI.Destroy()
    global MachinePetsUI := Gui()
    MachinePetsUI.Opt("+AlwaysOnTop")

    UiList.InsertAt(UiList.Length + 1, MachinePetsUI)
    MPUI()
    MachinePetsUIFunc()
  }

  MPFunc4(*) {
    global MachinePetsUI


    Values := MPDestructiveUI.Submit()
    MachinePets.Delete(Values.DestroyValue)

    MPAdditiveUI.Destroy()
    MPDestructiveUI.Destroy()
    MachinePetsUI.Destroy()
    global MachinePetsUI := Gui()
    MachinePetsUI.Opt("+AlwaysOnTop")

    UiList.InsertAt(UiList.Length + 1, MachinePetsUI)
    MPUI()
    MachinePetsUIFunc()
  }

  MPFunc5(*) {
    MPAdditiveUI.Hide()
    MPDestructiveUI.Hide()
    SubmitValues := ObjToMap(MachinePetsUI.Submit())
    
    ; Have to get it from submit values since there could be new keys
    for Key, Value in SubmitValues {
      MachinePets[MPSpacelessTable[Key]] := Value
    }
  }

  MPAUB.OnEvent("Click", MPFunc1)
  MPDUB.OnEvent("Click", MPFunc2)
  MPAdditiveButton.OnEvent("Click", MPFunc3)
  MPDestructiveButton.OnEvent("Click", MPFunc4)
  MPFinalizeButton.OnEvent("Click", MPFunc5)

  MPAUB.SetFont("s10")
  MPDUB.SetFont("s10")

  MachinePetsUI.GetPos(&a, &a2, &a3, &a4)
  MachinePetsUI.Show("X" (u - a3) " Y" u2 "")
    
  MachinePetsUI.GetPos(&a, &a2, &a3, &a4)
  MachinePetsUI.Show("X" (u - a3) " Y" u2 "")
  MachinePetsUI.Hide()
  }

  ; Enchant Selection UI
  ESUI() {
    RankUI.GetPos(&u, &u2, &u3, &u4)

    EnchantCraftSelectionUI.AddText("w200 h20 Section", "Enchants Selection").SetFont("s12 w700")
    PotsSpacelessTable := Map()
    for Setting, SettingValue in EnchantCraftSelection {
      NewerString := ""
      for _, Text in StrSplit(Setting, " ") {
        NewerString := NewerString Text
      }
      PotsSpacelessTable[NewerString] := Setting
  
      EnchantCraftSelectionUI.AddText("w150 h20 xs", Setting ":").SetFont("s10")
      EnchantCraftSelectionUI.AddCheckbox("w20 h20 v" NewerString " yp xp+210 Checked" SettingValue).SetFont("s9")
    }
  
  
    UIObjectTable := CreateUIs(EnchantCraftSelection, "toggle", "Enchant Selection")
    AdditiveUI := UIObjectTable.Additive.PhysicalUI
    AdditiveButton := UIObjectTable.Additive.AddButton
    DestructiveUI := UIObjectTable.Destructive.PhsyicalUI
    DestructiveButton := UIObjectTable.Destructive.DestroyButton
  
    AUB := EnchantCraftSelectionUI.AddButton("w95 h30 xs", "Add Selection")
    DUB := EnchantCraftSelectionUI.AddButton("w125 h30 xs+100 yp", "Remove Selection")
    FinalizeButton := EnchantCraftSelectionUI.AddButton("w95 h30 xs", "Set Values")
    FinalizeButton.SetFont("s10")
  
    Func1(*) {
      AdditiveUI.Show()
    }
  
    Func2(*) {
      DestructiveUI.Show()
    }
  
    Func3(*) {
      global EnchantCraftSelectionUI

  
      Values := AdditiveUI.Submit()
      HitValue := true
      if Values.BaseValue = "false" {
        HitValue := false
      }
  
      EnchantCraftSelection[Values.NewInstance] := HitValue
  
      AdditiveUI.Destroy()
      DestructiveUI.Destroy()
      EnchantCraftSelectionUI.Destroy()
      global EnchantCraftSelectionUI := Gui()
      EnchantCraftSelectionUI.Opt("+AlwaysOnTop")
  
      UiList.InsertAt(UiList.Length + 1, EnchantCraftSelectionUI)
      ESUI()
      EnchantCraftSelectionUIFunc()
    }
  
    Func4(*) {
      global EnchantCraftSelectionUI
  
      Values := DestructiveUI.Submit()
      EnchantCraftSelection.Delete(Values.DestroyValue)
  
      AdditiveUI.Destroy()
      DestructiveUI.Destroy()
      EnchantCraftSelectionUI.Destroy()
      global EnchantCraftSelectionUI := Gui()
      EnchantCraftSelectionUI.Opt("+AlwaysOnTop")
  
      UiList.InsertAt(UiList.Length + 1, PotionSelectionUI)
      ESUI()
      EnchantCraftSelectionUIFunc()
    }
  
    Func5(*) {
      AdditiveUI.Hide()
      DestructiveUI.Hide()
      SubmitValues := ObjToMap(EnchantCraftSelectionUI.Submit())
      
      ; Have to get it from submit values since there could be new keys
      for Key, Value in SubmitValues {
        EnchantCraftSelection[PotsSpacelessTable[Key]] := Value
      }
    }
  
    AUB.OnEvent("Click", Func1)
    DUB.OnEvent("Click", Func2)
    AdditiveButton.OnEvent("Click", Func3)
    DestructiveButton.OnEvent("Click", Func4)
    FinalizeButton.OnEvent("Click", Func5)
  
    AUB.SetFont("s10")
    DUB.SetFont("s10")
  
    ; So stupid that i have to do it twice
    EnchantCraftSelectionUI.GetPos(&a, &a2, &a3, &a4)
    EnchantCraftSelectionUI.Show("X" (u - a3) " Y" u2 "")
      
    EnchantCraftSelectionUI.GetPos(&a, &a2, &a3, &a4)
    EnchantCraftSelectionUI.Show("X" (u - a3) " Y" u2 "")
    EnchantCraftSelectionUI.Hide()
  }

  ; MultiTask Map UI
  MTUI() {
    RankUI.GetPos(&u, &u2, &u3, &u4)

    MultiTaskMapUI.AddText("w200 h20 Section", "MultiTask Selection").SetFont("s12 w700")

    for MTF, ToMulti in MultiTaskMap {
      MultiTaskMapUI.AddText("w150 h20 xs", MTF ":").SetFont("s10")
      MultiTaskMapUI.AddCheckbox("w20 h20 v" MTF " yp xp+210 Checked" ToMulti).SetFont("s9")
    }

    FinalizeButton := MultiTaskMapUI.AddButton("w95 h30 xs", "Set Values")
    FinalizeButton.SetFont("s10")

    Func5(*) {
      SubmitValues := ObjToMap(MultiTaskMapUI.Submit())
      
      for Key, Value in MultiTaskMap {
        MultiTaskMap[Key] := SubmitValues[Key]
      }
    }

    FinalizeButton.OnEvent("Click", Func5)

    MultiTaskMapUI.GetPos(&a, &a2, &a3, &a4)
    MultiTaskMapUI.Show("X" (u - a3) " Y" u2 "")
      
    MultiTaskMapUI.GetPos(&a, &a2, &a3, &a4)
    MultiTaskMapUI.Show("X" (u - a3) " Y" u2 "")
    MultiTaskMapUI.Hide()
  }

  ; Position Map UI
  PMUI() {
    RankUI.GetPos(&u, &u2, &u3, &u4)

    CoordPositions := 0
    PositionsPerTab := 15
  
    for Position, PosIndex in PositionMap {
      CoordPositions += 1
    }
  
    PositionTabs := Ceil(CoordPositions/PositionsPerTab)
    TotalNumberOfPositions := 0
    TabArray := []
  
    loop PositionTabs {
      TotalNumberOfPositions += 1
      TabArray.InsertAt(TabArray.Length + 1, "Pos Section " TotalNumberOfPositions)
    }
  
    
    PTabs := PositionMapUI.AddTab3("",TabArray)
    _LN1 := 0
  
    loop TabArray.Length {
      _LN1 += 1
      PTabs.UseTab(_LN1)
      PositionMapUI.SetFont("s15 q5 w800", "Constantia")
      PositionMapUI.Add("Text", "Section", "Positioning")
      PositionMapUI.Add("Text"," ys+5 x270 c0x000000","X")
      PositionMapUI.Add("Text"," ys+5 x340 c0x000000","Y")
      PositionMapUI.SetFont("s9 q5 w500", "Arial")
    }
  
    PosNum := 0
    PosTab := 1
  
    for Position, PositonArrayOrValue in PositionMap {
      if Type(PositonArrayOrValue) = "Array" {
          PosNum += 1
  
          NewLP := PosNum/PositionsPerTab
          if NewLP > 1 {
              PosNum := 1
              PosTab += 1
          } 
  
          PTabs.UseTab(PosTab)
  
          GuiPos1(Position, PositonArrayOrValue, PosNum)
      }
    }
  
    Func5(*) {
      NewValuesOfEVIL := ObjToMap(PositionMapUI.Submit())
  
      for Key, Value in PositionMap {
        OutputDebug("`n " Key ":"  NewValuesOfEVIL[Key "XPos"])
        PositionMap[Key] := [NewValuesOfEVIL[Key "XPos"], NewValuesOfEVIL[Key "YPos"]]
      }
    }
  
    PTabs.UseTab(1)
    PositionMapUI.Add("Button","xs y540","Update Positions").OnEvent("Click", Func5)
  
    PositionMapUI.GetPos(&a, &a2, &a3, &a4)
    PositionMapUI.Show("X" (u - a3) " Y" u2 "")
      
    PositionMapUI.GetPos(&a, &a2, &a3, &a4)
    PositionMapUI.Show("X" (u - a3) " Y" u2 "")
    PositionMapUI.Hide
  }

  ; Quest OCR UI
  QOUI() {
    RankUI.GetPos(&u, &u2, &u3, &u4)

    QuestOrder := ["Quest1", "Quest2", "Quest3", "Quest4", "ClaimRewardsCheck"]
    QTabs := QuestOCRUI.AddTab3("", QuestOrder)
  
    for _, Quest in QuestOrder {
      QTabs.UseTab(_)
      QuestOCRUI.SetFont("s12 q5 w700", "Arial")
      QuestOCRUI.AddText("Section w120 h40", Quest "OCR").SetFont("s12 w700")
      QuestOCRUI.Add("Text"," ys+5 x270 c0x000000","X")
      QuestOCRUI.Add("Text"," ys+5 x340 c0x000000","Y")
      GuiPos2(Quest)
      GuiPos3(Quest)
    }
  
    Func5(*) {
      Sv := QuestOCRUI.Submit()
  
      QuestOCR["Quest1"].X := Sv.Quest1XSize
      QuestOCR["Quest1"].Y := Sv.Quest1YSize
      QuestOCR["Quest1"].Pos := [Sv.Quest1XPos, Sv.Quest1YPos]
  
      QuestOCR["Quest2"].X := Sv.Quest2XSize
      QuestOCR["Quest2"].Y := Sv.Quest2YSize
      QuestOCR["Quest2"].Pos := [Sv.Quest2XPos, Sv.Quest2YPos]
  
      QuestOCR["Quest3"].X := Sv.Quest3XSize
      QuestOCR["Quest3"].Y := Sv.Quest3YSize
      QuestOCR["Quest3"].Pos := [Sv.Quest3XPos, Sv.Quest3YPos]
  
      QuestOCR["Quest4"].X := Sv.Quest4XSize
      QuestOCR["Quest4"].Y := Sv.Quest4YSize
      QuestOCR["Quest4"].Pos := [Sv.Quest4XPos, Sv.Quest4YPos]

      QuestOCR["ClaimRewardsCheck"].X := Sv.ClaimRewardsCheckXSize
      QuestOCR["ClaimRewardsCheck"].Y := Sv.ClaimRewardsCheckYSize
      QuestOCR["ClaimRewardsCheck"].Pos := [Sv.ClaimRewardsCheckXPos, Sv.ClaimRewardsCheckYPos]
    }
  
    QTabs.UseTab(1)
    QuestOCRUI.Add("Button","xs y240","Update QuestOCR").OnEvent("Click", Func5)
  
    QuestOCRUI.GetPos(&a, &a2, &a3, &a4)
    QuestOCRUI.Show("X" (u - a3) " Y" u2 "")
      
    QuestOCRUI.GetPos(&a, &a2, &a3, &a4)
    QuestOCRUI.Show("X" (u - a3) " Y" u2 "")
    QuestOCRUI.Hide()
  }

  OpenDonation(*) {
    Run "https://paypal.me/JeneneT"
  }

  DonateUIitUp(*) {
    DonateUI.Show()
  }

  SettingChanged(*) {
    global UiList
    TheSumbit := RankUI.Submit(false)
    global CurrentLoadedSetting := SettingsMap[TheSumbit.LoadSetting]
    

    for _, UI in UiList {
      try {
        UI.Submit()
        UI.Destroy()
      }
    }

    global RankUI := Gui(,"Ranking Macro | Version " Version)
    global ToggleSettingsUI := Gui()
    global NumberSettingsUI := Gui()
    global PotionSelectionUI := Gui()
    global MachinePetsUI := Gui()
    global EnchantCraftSelectionUI := Gui()
    global MultiTaskMapUI := Gui()
    global PositionMapUI := Gui()
    global QuestOCRUI := Gui()
    global DonateUI := Gui()  
    global SaveSettingWindow := Gui()
    global TextSettingsUI := Gui()

    
    IniWrite(TheSumbit.LoadSetting, A_ScriptDir "\RankQuestMacroStorage\Info.ini", "LastLoadedSetting", "Setting")
    IniWrite(CurrentLoadedSetting, A_ScriptDir "\RankQuestMacroStorage\Info.ini", "LastLoadedSetting", "SettingNum")

    try {
      LoadSettings()
    }
    UIItUp()
  }

  RankUI.Show()

  TSUI()
  NSUI()
  TxSUI()
  PSUI()
  MPUI()
  ESUI()
  MTUI()
  PMUI()
  QOUI()
}

LoadSettings() {
  if not FileExist(A_ScriptDir "\RankQuestMacroSettings\") {
    DirCreate(A_ScriptDir "\RankQuestMacroSettings")
  } 

  if not FileExist(A_ScriptDir "\RankQuestMacroStorage\") {
    DirCreate(A_ScriptDir "\RankQuestMacroStorage")
    IniWrite("", A_ScriptDir "\RankQuestMacroStorage\Info.ini", "", "")
  }
  LastSettingFile := A_ScriptDir "\RankQuestMacroSettings\" IniRead(A_ScriptDir "\RankQuestMacroStorage\Info.ini", "LastLoadedSetting", "Setting")
  global CurrentLoadedSetting := IniRead(A_ScriptDir "\RankQuestMacroStorage\Info.ini", "LastLoadedSetting", "SettingNum")

  OutputDebug(LastSettingFile)

  for Key, Value in PositionMap {
    try {
      Pos := StrSplit(IniRead(LastSettingFile, "Positioning", Key), "|")
      PositionMap[Key] := [Pos[1], Pos[2]]
    }
  }

  for Key, Value in TextSettingsMap {
    try {
      TextSettingsMap[Key] := IniRead(LastSettingFile, "TextSettings", Key)
    }
  }

  for Key, Value in NumberValueMap {
    try {
      NumberValueMap[Key] := IniRead(LastSettingFile, "NumberValues", Key)
    }
  }

  for Key, Value in TogglesMap {
    try {
      TogglesMap[Key] := IniRead(LastSettingFile, "ToggleSettings", Key)
    }
  }

  for Key, StupidArray in QuestOCR {
    try {
      Pos := StrSplit(IniRead(LastSettingFile, "QuestOCR", Key "Pos"), "|")
      QuestOCR[Key].X := IniRead(LastSettingFile, "QuestOCR", Key "X")
      QuestOCR[Key].Y := IniRead(LastSettingFile, "QuestOCR", Key "Y")
      QuestOCR[Key].Pos := [Pos[1], Pos[2]]
    }
  }

  for Quest, QuestArray in Quests {
    try {
      Quests[Quest].KeyWords := StrSplit(IniRead(LastSettingFile, "KeyWords", Quest), "|")
  
      for Slot, Priority in QuestArray.QuestArray.PriorityMap {
        Quests[Quest].QuestArray.PriorityMap[Slot] := IniRead(LastSettingFile, "SlotPriority", Quest Slot)
      }
  
  
      try {
        Quests[Quest].QuestArray.Item := IniRead(LastSettingFile, "Items", Quest)
        Quests[Quest].QuestArray.ItemDelay := IniRead(LastSettingFile, "ItemDelays", Quest)
        Quests[Quest].QuestArray.ItemFailureMethod := IniRead(LastSettingFile, "ItemFailureMethod", Quest)
        Quests[Quest].QuestArray.ItemFailureDownTime := IniRead(LastSettingFile, "ItemFailureDownTime", Quest)
      } 
    }
  }

  
  MachinePetsBU := MachinePets.Clone()
  PotionSelectionBU := PotionSelection.Clone()
  EnchantCraftSelectionBU := EnchantCraftSelection.Clone()

  global MachinePets := Map()
  global PotionSelection := Map()
  global EnchantCraftSelection := Map()
  
  func6(SectionName, KeyName, MapToUse) {
    torf := Map("false", false, "true", true)
    SplitcalText := []
    try {
      SplitcalText := StrSplit(IniRead(LastSettingFile, SectionName, KeyName), "|")
    }

    if SplitcalText.Length = 0 {
      return false
    }
    
    for _, SplitText in SplitcalText {
      try {
        AnotherSplit := StrSplit(SplitText, ":")
        Key := AnotherSplit[1]
        Value := false
  
        try {
          Value := AnotherSplit[2]
        } catch as E {
          Value := true
        }
        
        MapToUse[Key] := Value
      }
    }
    return true
  }

  if not func6("PetArray", "PetString", MachinePets) {
    MachinePets := MachinePetsBU
  }
  if not func6("PotionArray", "PotionString", PotionSelection) {
    PotionSelection := PotionSelectionBU
  }
  if not func6("EnchantArray", "EnchantString", EnchantCraftSelection) {
    EnchantCraftSelection := EnchantCraftSelectionBU
  }

  Hotkey EvilGyatKey, UnmainFunction, "Off"
  Hotkey GyatKey, MainFunction, "Off"
  Hotkey MediumGyatKey, SemiMainFunction, "Off"
  Hotkey DebugGyatKey, DebugMainFunction, "Off"


  global GyatKey := IniRead(LastSettingFile, "HotKeys", "StartKey")
  global EvilGyatKey := IniRead(LastSettingFile, "HotKeys", "StopKey")
  global MediumGyatKey := IniRead(LastSettingFile, "HotKeys", "PauseKey")
  global DebugGyatKey := IniRead(LastSettingFile, "HotKeys", "DebugKey")


  Hotkey EvilGyatKey, UnmainFunction, "On"
  Hotkey GyatKey, MainFunction, "On"
  Hotkey MediumGyatKey, SemiMainFunction, "On" 
  Hotkey DebugGyatKey, DebugMainFunction, "On"

}

try {
  LoadSettings()
}


UIItUp()

;// More Mainish Functions

; Slightly Modified From : https://www.autohotkey.com/boards/viewtopic.php?t=70402
CircularNonsense(r := 200, degInc := 5, speed := 0, Dist := 36)
{
	radPerDeg := 3.14159265359 / 180
	MouseGetPos(&cx, &cy)
    angle := 0
    cy += r
	loop (Dist / degInc) {
		angle += degInc * radPerDeg
		MouseMove(cx + r * Sin(angle), cy - r * Cos(angle))
		Sleep(speed)
	}
}

GetRankQuests() {
  global DebugString
  RewardButtonPos := PositionMap["RewardButton"]
  ClaimRewardButtonPos := PositionMap["ClaimRewardButton"]
  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]

  if DisconnectedCheck() {
    BreakTime := A_TickCount
    global CurrentZone := 100
    global AutofarmZone := 0
    loop {
        SendEvent "{Click, " PositionMap["ReconnectButton"][1] ", " PositionMap["ReconnectButton"][2] ", 1}"
        Sleep(100)
        if PixelSearch(&A, &A, PositionMap["TPButtonTL"][1],PositionMap["TPButtonTL"][2],PositionMap["TPButtonBR"][1],PositionMap["TPButtonBR"][2], 0xEC0D3A, 12) {
            break
        }
        Sleep(100)
        if A_TickCount - BreakTime >= 45000 {
            Break
        }
    }
  }

  CleanUI()  
  SendEvent "{Click, " RewardButtonPos[1] ", " RewardButtonPos[2] ", 1}"
  Sleep(100)
  SendEvent "{Click, " ClaimRewardButtonPos[1] ", " ClaimRewardButtonPos[2] ", 1}"
  Sleep(500)
  loop 3 {
    if not PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
      BreakTime := A_TickCount 
      loop {
        SendEvent "{Click, " RewardButtonPos[1] ", " RewardButtonPos[2] ", 1}"
        Sleep(1000)

        if A_TickCount - BreakTime >= 4000 {
          break
        }
      }
    } else {
      break
    }
  }

  Cr := QuestOCR["ClaimRewardsCheck"]

  ClaimOCR := Ocr.FromRect(Cr.Pos[1] + Cr.Offsetx, Cr.Pos[2] + Cr.OffsetY, Cr.X, Cr.Y,,5).Text
  if RegExMatch(ClaimOCR, "i)rewa|reward|claim") {
    OutputDebug("Reward it Up")
    global DebugString := DebugString "`n Claiming Rewards from text: " ClaimOCR
    global DoRankClaim := true
    return
  }

  for Quest, QuestSearchArray in QuestOCR {
    if Quest = "ClaimRewardsCheck" {
      continue
    }
    OcrResult := OCR.FromRect(
      QuestSearchArray.Pos[1] + QuestSearchArray.OffsetX,
      QuestSearchArray.Pos[2] + QuestSearchArray.OffsetY,
      QuestSearchArray.X,
      QuestSearchArray.Y,
      , ; Language but english :)
      5
    )

    PossibleQuests := Map()
    QuestValue := 1

    for _, Word in OcrResult.Words {
      for QuestName, QuestArray in Quests {
        for _, Keyword in QuestArray.KeyWords {
          if StrLower(Word.Text) = StrLower(Keyword) {
            try {
              PossibleQuests[QuestName] += 1
            } catch as e {
              PossibleQuests[QuestName] := 1
            }
          }
        }
      }

      TierCheck := "nil"
      for ___, Numeral in PossibleTiers {
        if InStr(OcrResult.Text, " " Numeral " ") {
          TierCheck := Numeral
        }
      }

      if TierCheck = "nil" {
        TierCheck := "VI"
      }

      if IsNumber(Word.Text) {
        QuestValue := Word.Text
      }

      if InStr(Word.Text, "k") {
        SplitString := StrSplit(StrLower(Word.Text), "k")[1]
        if IsNumber(SplitString) {
          QuestValue := (SplitString * 1000)
        }
      }
    }

    HighestQuest := "None"
    HighestQuestValue := 0
    for QuestName, Possiblity in PossibleQuests {
      if Possiblity > HighestQuestValue {
        HighestQuest := QuestName
        HighestQuestValue := Possiblity
      }
    }

    if HighestQuest != "None" {
      OutputDebug("`n" Quest " Complete | Quest Chosen: " HighestQuest " [" QuestValue "] | QuestType: " Quests[HighestQuest].Type " | FROM: " OcrResult.Text)
      DebugString := DebugString "`n`n" Quest " Complete | Quest Chosen: " HighestQuest " [" QuestValue "] | QuestType: " Quests[HighestQuest].Type " | FROM: " OcrResult.Text
      UserQuests[Quest].QuestType := HighestQuest
      UserQuests[Quest].QuestAmount := QuestValue
      UserQuests[Quest].Priority := Quests[HighestQuest].QuestArray.PriorityMap["Slot" StrSplit(Quest, "Quest")[2]]

      if TierCheck != "nil" {
        UserQuests[Quest].ExtraInfo.Tier := TierCheck
      }
    } else {
      UserQuests[Quest].QuestType := "nil"
      UserQuests[Quest].QuestAmount := 0
      UserQuests[Quest].Priority := 0
    }
  }
  CleanUI()
}

GetSpecficQuestInfo(QuestNumber) {
  RewardButtonPos := PositionMap["RewardButton"]
  ClaimRewardButtonPos := PositionMap["ClaimRewardButton"]
  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]

  if DisconnectedCheck() {
    BreakTime := A_TickCount
    global CurrentZone := 100
    global AutofarmZone := 0
    loop {
        SendEvent "{Click, " PositionMap["ReconnectButton"][1] ", " PositionMap["ReconnectButton"][2] ", 1}"
        Sleep(100)
        if PixelSearch(&A, &A, PositionMap["TPButtonTL"][1],PositionMap["TPButtonTL"][2],PositionMap["TPButtonBR"][1],PositionMap["TPButtonBR"][2], 0xEC0D3A, 12) {
          return {QuestType:"nil",QuestAmount:0}
        }
        Sleep(100)
        if A_TickCount - BreakTime >= 45000 {
          return {QuestType:"nil",QuestAmount:0}
        }
    }
  }

  CleanUI()  
  SendEvent "{Click, " RewardButtonPos[1] ", " RewardButtonPos[2] ", 1}"
  Sleep(100)
  SendEvent "{Click, " ClaimRewardButtonPos[1] ", " ClaimRewardButtonPos[2] ", 1}"
  Sleep(500)
  loop 3 {
    if not PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
      BreakTime := A_TickCount 
      loop {
        SendEvent "{Click, " RewardButtonPos[1] ", " RewardButtonPos[2] ", 1}"
        Sleep(1000)

        if A_TickCount - BreakTime >= 4000 {
          break
        }
      }
    } else {
      break
    }
  }

  
  Cr := QuestOCR["ClaimRewardsCheck"]

  ClaimOCR := Ocr.FromRect(Cr.Pos[1] + Cr.Offsetx, Cr.Pos[2] + Cr.OffsetY, Cr.X, Cr.Y,,5).Text
  if InStr(ClaimOCR, "Rewards") {
    OutputDebug("Reward it Up")
    global DoRankClaim := true
    return {QuestType:"Nil",QuestAmount:0}
  }

  for Quest, QuestSearchArray in QuestOCR {
    if Quest = "ClaimRewardsCheck" {
      continue
    }
    OcrResult := OCR.FromRect(
      QuestSearchArray.Pos[1] + QuestSearchArray.OffsetX,
      QuestSearchArray.Pos[2] + QuestSearchArray.OffsetY,
      QuestSearchArray.X,
      QuestSearchArray.Y,
      , ; Language but english :)
      5
    ).Words

    PossibleQuests := Map()
    QuestValue := 1

    for _, Word in OcrResult {
      for QuestName, QuestArray in Quests {
        for _, Keyword in QuestArray.KeyWords {
          if StrLower(Word.Text) = StrLower(Keyword) {
            try {
              PossibleQuests[QuestName] += 1
            } catch as e {
              PossibleQuests[QuestName] := 1
            }
          }
        }
      }

      if IsNumber(Word.Text) {
        QuestValue := Word.Text
      }

      if InStr(Word.Text, "k") {
        SplitString := StrSplit(StrLower(Word.Text), "k")[1]
        if IsNumber(SplitString) {
          QuestValue := (SplitString * 1000)
        }
      }
    }

    if "Quest" QuestNumber = Quest {
      HighestQuest := ""
      HighestQuestValue := 0

      for QuestName, Possiblity in PossibleQuests {
        if Possiblity > HighestQuestValue {
          HighestQuest := QuestName
          HighestQuestValue := Possiblity
        }
      }

      CleanUI()
      return {QuestType:HighestQuest,QuestAmount:QuestValue}
    }

  }


  CleanUI()
  ; OutputDebug("`n" Quest " Complete | Quest Chosen: " HighestQuest " [" QuestValue "] | QuestType: " Quests[HighestQuest].Type)
}

EnableAutoHatch() {
  AHTL := PositionMap["AutoHatchTL"]
  AHBR := PositionMap["AutoHatchBR"]
  AH := PositionMap["AutoHatch"]
  XTL := PositionMap["MiniXTL"]
  XBR := PositionMap["MiniXBR"]

  if PixelSearch(&lll, &ll2, AHTL[1], AHTL[2], AHBR[1], AHBR[2], 0xFF1055, 20) {
      Sleep(100)
      SendEvent "{Click, " AH[1] ", " AH[2] ", 1}"
      Sleep(100)
  }


  BreakTime := A_TickCount
  if PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 10) { 
      Sleep(200)
      SendEvent "{Click, " PositionMap["AutoHatchUIToggle"][1] ", " PositionMap["AutoHatchUIToggle"][2] ", 1}"
      Sleep(400)
  }
  CleanUI()
}

EnableAutofarm() {
  if not TogglesMap["UserOwnsAutoFarm"] {
    return
  }

  AFTL := PositionMap["AutoFarmTL"]
  AFBR := PositionMap["AutoFarmBR"]
  AF := PositionMap["AutoFarm"]
  XTL := PositionMap["MiniXTL"]
  XBR := PositionMap["MiniXBR"]

  if PixelSearch(&lll, &ll2, AFTL[1], AFTL[2], AFBR[1], AFBR[2], 0xFF1055, 20) {
      SendEvent "{Click, " AF[1] ", " AF[2] ", 1}"
      Sleep(200)
  } else if PixelSearch(&lll, &ll2, AFTL[1], AFTL[2], AFBR[1], AFBR[2], 0x82F60F, 20) {
    SendEvent "{Click, " AF[1] ", " AF[2] ", 1}"
    Sleep(500)
    SendEvent "{Click, " AF[1] ", " AF[2] ", 1}"
    Sleep(200)
  }
  global AutofarmZone := CurrentZone
}

MultiTaskCheck() {
  QuestNumericalTable := Map(
    "FinalZone", 0,
    "Item", 0,
    "Egg", 0,
    "VipZone", 0,
    "Misc", 0,
  )

  Qm := Map()

  if TogglesMap["Enable2StarQuest"] {
    Qm := Map("Quest1", false, "Quest2", true, "Quest3", true, "Quest4", true)
  } else {
    Qm := Map("Quest1", false, "Quest2", false, "Quest3", true, "Quest4", true)
  }

  for QuestNumber, QuestArray in UserQuests {
    if StrLower(QuestArray.QuestType) != "nil" and Qm[QuestNumber] and Quests[QuestArray.QuestType].QuestArray.PriorityMap["Slot" StrSplit(QuestNumber, "Quest")[2]] > 0 {
      QuestNumericalTable[Quests[QuestArray.QuestType].Type] += 1
    }
  }

  for Key, Value in QuestNumericalTable {
    OutputDebug("`n Key: " Key " | Value: " Value)
  }

  ; If items and Zone
  if QuestNumericalTable["Item"] > 0 and QuestNumericalTable["FinalZone"] > 0 and MultiTaskMap["Item+FinalZone"] {
    if QuestNumericalTable["Item"] = 1 {
      ItemQuest := "nil"
      ItemArray := {}

      for QuestNumber, QuestArray in UserQuests {
        if StrLower(QuestArray.QuestType) != "nil" and Qm[QuestNumber] {
          if Quests[QuestArray.QuestType].Type = "Item" {
           ItemQuest := QuestNumber
           ItemArray := Quests[QuestArray.QuestType].QuestArray
           OutputDebug(QuestArray.QuestType)
           break
          }
        }
      }

      QuestFunction_ItemUse(ItemArray, ItemQuest)
      return true
    } else if QuestNumericalTable["Item"] > 1 {
      ItemMap := Map()

      for QuestNumber, QuestArray in UserQuests {
        if StrLower(QuestArray.QuestType) != "nil" {
          if Quests[QuestArray.QuestType].Type = "Item" {
            ItemMap[QuestNumber] := {
              Item:Quests[QuestArray.QuestType].QuestArray.Item,
              Delay:Quests[QuestArray.QuestType].QuestArray.ItemDelay,
              Amount:QuestArray.QuestAmount,
              QT:QuestArray.QuestType
            }
          }
        }
      }

      MultiQuestFunction_DualItem(ItemMap)
      return true
    }
  }

  ;If Eggs and Zone (D)
  if QuestNumericalTable["Egg"] > 0 and QuestNumericalTable["FinalZone"] > 0 and MultiTaskMap["Egg+FinalZone"] {
    Type := "All"
    EggAmount := 5000
    QuestNumerical := "nil"

    if QuestNumericalTable["Egg"] = 1 {
      for QuestNumber, QuestArray in UserQuests {
        if StrLower(QuestArray.QuestType) != "nil" {
          if Quests[QuestArray.QuestType].Type = "Egg" {
            if QuestArray.QuestType = "Hatch Best Egg" {
              Type := "Best"
            } else if QuestArray.QuestType = "Hatch Rare Pets" {
              Type := "Rare"
            }
            QuestNumerical := QuestNumber
          }
        }
      }
    }

    If Type = "All" {
      for QuestNumber, QuestArray in UserQuests {
        if StrLower(QuestArray.QuestType) != "nil" and Qm[QuestNumber] {
          if Quests[QuestArray.QuestType].Type = "Egg" {
            if QuestArray.QuestType = "Hatch Best Egg" {
              EggAmount := QuestArray.QuestAmount
              QuestNumerical := QuestNumber
            }
          }
        }
      }

      Type := "Best"
    }


    ImprovisedArray := {
      Amount:EggAmount,
      Type:Type,
      Zone:"Final",
      QN:QuestNumerical
    }

    MultiQuestFunction_ZoneEgg(ImprovisedArray)
    return true
  }

  ;If Eggs and VIP Zone (D)
  if QuestNumericalTable["Egg"] > 0 and QuestNumericalTable["VipZone"] > 0 and MultiTaskMap["Egg+Vip"] {
    Type := "All"
    EggAmount := 5000
    QuestNumerical := "nil"

    if QuestNumericalTable["Egg"] = 1 {
      for QuestNumber, QuestArray in UserQuests {
        if StrLower(QuestArray.QuestType) != "nil" and Qm[QuestNumber] {
          if Quests[QuestArray.QuestType].Type = "Egg" {
            if QuestArray.QuestType = "Hatch Best Egg" {
              Type := "Best"
            } else if QuestArray.QuestType = "Hatch Rare Pets" {
              Type := "Rare"
            }
            QuestNumerical := QuestNumber
          }
        }
      }
    }

    If Type = "All" {
      for QuestNumber, QuestArray in UserQuests {
        if StrLower(QuestArray.QuestType) != "nil" {
          if Quests[QuestArray.QuestType].Type = "Egg" {
            if QuestArray.QuestType = "Hatch Best Egg" {
              EggAmount := QuestArray.QuestAmount
              QuestNumerical := QuestNumber
            }
          }
        }
      }

      Type := "Best"
    }


    ImprovisedArray := {
      Amount:EggAmount,
      Type:Type,
      Zone:"Vip",
      QN:QuestNumerical
    }

    MultiQuestFunction_ZoneEgg(ImprovisedArray)
    return true
  }

  ;If Final and misc (Golden pets, Use Potions, Ect.) (D)
  if QuestNumericalTable["FinalZone"] > 0 and QuestNumericalTable["Misc"] > 0 and MultiTaskMap["FinalZone+Misc"] {
    MiscQuest := "nil"

    for QuestNumber, QuestArray in UserQuests {
      if StrLower(QuestArray.QuestType) != "nil" and Qm[QuestNumber] {
        if Quests[QuestArray.QuestType].Type = "Misc" {
          MiscQuest := QuestNumber
          break
        }
      }
    }


    ImprovisedArray := {
      Zone:"Final",
      MiscQuest:MiscQuest
    }

    MultiQuestFunction_ZoneMisc(ImprovisedArray)
    return true
  }

  ; If Vip Zone and Misc (D)
  if QuestNumericalTable["VipZone"] > 0 and QuestNumericalTable["Misc"] > 0 and MultiTaskMap["Vip+Misc"] {
    MiscQuest := "nil"

    for QuestNumber, QuestArray in UserQuests {
      if StrLower(QuestArray.QuestType) != "nil" and Qm[QuestNumber] {
        if Quests[QuestArray.QuestType].Type = "Misc" {
          MiscQuest := QuestNumber
          break
        }
      }
    }


    ImprovisedArray := {
      Zone:"Vip",
      MiscQuest:MiscQuest
    }

    MultiQuestFunction_ZoneMisc(ImprovisedArray)
    return true
  }

  ; If Both Eggs (D)
  if QuestNumericalTable["Egg"] >= 2 and MultiTaskMap["DoubleEggs"] {
    EQN := "nil"

    for QuestNumber, QuestArray in UserQuests {
      if StrLower(QuestArray.QuestType) != "nil" and Qm[QuestNumber] {
        if Quests[QuestArray.QuestType].Type = "Egg" {
          if QuestArray.QuestType = "Hatch Best Egg" {
            EQN := QuestNumber
            break
          }
        }
      }
    }

    QuestFunction_Eggical({}, EQN)
    return true
  }

  ; If Dual Items (D)
  if QuestNumericalTable["Item"] >= 2 and MultiTaskMap["TwoOrMoreItems"] {
    ItemMap := Map()

    for QuestNumber, QuestArray in UserQuests {
      if StrLower(QuestArray.QuestType) != "nil" and Qm[QuestNumber] {
        if Quests[QuestArray.QuestType].Type = "Item" {
          ItemMap[QuestNumber] := {
            Item:Quests[QuestArray.QuestType].QuestArray.Item,
            Delay:Quests[QuestArray.QuestType].QuestArray.ItemDelay,
            Amount:QuestArray.QuestAmount,
            QT:QuestArray.QuestType
          }
        }
      }
    }

    MultiQuestFunction_DualItem(ItemMap)
    return true
  }

  return false
}

RankClaimSimulator() {
  RewardButtonPos := PositionMap["RewardButton"]
  ClaimRewardButtonPos := PositionMap["ClaimRewardButton"]
  RM := PositionMap["RankRewardsBox"]
  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]
  RTL := PositionMap["RewardsTL"]
  RBR := PositionMap["RewardsBR"]
  TBr := PositionMap["TPButtonBR"]
  TTL := PositionMap["TPButtonTL"]
  RCS := PositionMap["RankClickSpot"]


  CleanUI()  
  loop 3 {
    SendEvent "{Click, " RewardButtonPos[1] ", " RewardButtonPos[2] ", 1}"
    Sleep(100)
    SendEvent "{Click, " ClaimRewardButtonPos[1] ", " ClaimRewardButtonPos[2] ", 1}"
    Sleep(500)
    loop 3 {
      if not PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
        BreakTime := A_TickCount 
        loop {
          SendEvent "{Click, " RewardButtonPos[1] ", " RewardButtonPos[2] ", 1}"
          Sleep(1000)
  
          if A_TickCount - BreakTime >= 4000 {
            break
          }
        }
      } else {
        break
      }
    }
    Sleep(400)
  
    SendEvent "{Click, " RM[1] ", " RM[2] ", 1}"

    loop 100 {
      SendEvent "{WheelUp}"
      Sleep(15)
    }
  
    NoMore := 1
    EvilBreak := 0
    ToBreakFurther := false
    loop {
      if NoMore >= 25 {
        break
      }
  
      if PixelSearch(&u, &u2, RTL[1], RTL[2], RBR[1], RBR[2], 0x204F00, 0) {
        NoMore := 0
        EvilBreak := 0
        Sleep(30)
        SendEvent "{Click, " u ", " u2 ", 1}"
        Sleep(200)

        if not PixelSearch(&A, &A, TTL[1], TTL[2], TBr[1], TBr[2], 0xEC0D3A, 10) {
          ToBreakFurther := true
          break
        }        
      } else {
        NoMore += 1

        if not PixelSearch(&A, &A, TTL[1], TTL[2], TBr[1], TBr[2], 0xEC0D3A, 10) {
          ToBreakFurther := true
          break
        }      

        SendEvent "{Click, " RM[1] ", " RM[2] ", 1}"
        Sleep(15)
        SendEvent "{WheelDown}"
        Sleep(15)
        Sleep(500/NoMore)
      }
    }

    CleanUI()
    Sleep(2000)
    if not PixelSearch(&A, &A, TTL[1], TTL[2], TBr[1], TBr[2], 0xEC0D3A, 10) or ToBreakFurther {
      break
    }
  }

  loop {
    if PixelSearch(&A, &A, TTL[1], TTL[2], TBr[1], TBr[2], 0xEC0D3A, 10) {
      break
    }

    SendEvent "{Click, " RCS[1] ", " RCS[2] ", 1}"
    Sleep(200)
  }

  OutputDebug("Freedom")
  global DoRankClaim := false
}

YouMustBreakFree() {
  ToG := PositionMap["TopOfGame"]
  OutputDebug("`n I MUST BREAK FREE")


  SendEvent "{W Down}"
  Timical := A_TickCount
  StopMovement := false
  loop {
    SendEvent "{Click, " ToG[1] ", " ToG[2] ", 1}"

    if A_TickCount - Timical >= 6000 and not StopMovement {
      SendEvent "{W Up}"
      StopMovement := true
    }

    if A_TickCount - Timical >= 8000 {
      break
    }

    Sleep(20)
  }

  CleanUI()
  TeleportToZone("Future Beach")
  global CurrentZone := 112
}

ItemUseicalFunctionOfDESTRUCTION(QuestArray) {
  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]
  Bpb := PositionMap["InventoryBackpackButton"]
  SrB := PositionMap["SearchBar"]
  ToG := PositionMap["TopOfGame"]
  ItM := PositionMap["ItemMiddle"]
  STL := PositionMap["SearchFieldTL"]
  SBR := PositionMap["SearchFieldBR"]
  NumericalWhiteout := 0

  Item := QuestArray.Item
  NumericalAmount := QuestArray.Number
  QT := UserQuests[QuestArray.QN].QuestType
  Delay := QuestArray.ItemDelay
  BaseQuestData := Quests[UserQuests[QuestArray.QN].QuestType]

  CleanUI()
  Inv_OpenToItem()
  
  loop {
    if NumericalAmount = 0 {
      break
    }
    ; Check if inventory is still open
    if not PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
      Sleep(200)
      CleanUI()
      Inv_OpenToItem()
    }

    SendEvent "{Click, " ToG[1] ", " ToG[2] ", 1}"
    Sleep(200)
    SendEvent "{Click, " SrB[1] ", " SrB[2] ", 1}"
    Sleep(200)
    SendText Item
    Sleep(400)

    if PixelSearch(&u,&u,STL[1],STL[2],SBR[1],SBR[2], 0x1E1E1E, 3) {
      SendEvent "{Click " ItM[1] ", " ItM[2] ", 1}"
    }

    Sleep(500)
    if StupidCatCheck() {
      NumericalAmount += 1
      CleanUI()
    }

    Sleep(Delay)
    NumericalAmount -= 1
  }

  Qu := GetSpecficQuestInfo(StrSplit(QuestArray.QN, "Quest")[2])
  TypeOfQuest := UserQuests[QuestArray.QN].QuestType
  if (Qu.QuestAmount - QuestArray.Number) = 0 and Qu.QuestType = TypeOfQuest {

    if Quests[TypeOfQuest].QuestArray.ItemFailureMethod = "0 Priority" {
      EvilMap := Map(
        "Delay", Quests[TypeOfQuest].QuestArray.ItemFailureDownTime,
        "Issue", "0 Priority"
      )

      for Key, Value in Quests[TypeOfQuest].QuestArray.PriorityMap {
        EvilMap[Key] := Value
        Quests[TypeOfQuest].QuestArray.PriorityMap[Key] := 0
      }

      OutputDebug("`nIssue : 1")
      FixItFelix[TypeOfQuest] := EvilMap
    } else if Quests[TypeOfQuest].QuestArray.ItemFailureMethod = "PartyBoxxed" {
      EvilMap := Map(
        "Delay", Quests[TypeOfQuest].QuestArray.ItemFailureDownTime,
        "Issue", "PartyBoxxed",
        "PreviousItem", Quests[TypeOfQuest].Item := "Party Box"
      )
  
      OutputDebug("`nIssue : 2")
      FixItFelix[TypeOfQuest] := EvilMap
    }
  }
}

NilFunction() {
  MsgBox("Unset Quest functionf ro thiseioqj ewighaesdigjasidjgoas")
}

CheckForFlag() {
  global CurrentZone 
  global LastVIPFlagTime
  global LastFinalZoneFlagTime

  if CurrentZone = 100 {
    if A_TickCount - LastVIPFlagTime >= NumberValueMap["FlagDelayDropTime"] and TogglesMap["AutoFlag_VipZone"] {
      LastVIPFlagTime := A_TickCount
      MultipleUseItemTillFailure([TextSettingsMap["Flag_VipZone"]])
    }
  } else if CurrentZone = 199 {
    if A_TickCount - LastFinalZoneFlagTime >= NumberValueMap["FlagDelayDropTime"] and TogglesMap["AutoFlag_FinalZone"] {
      LastFinalZoneFlagTime := A_TickCount
      MultipleUseItemTillFailure([TextSettingsMap["Flag_FinalZone"]])
    }
  }
}

; Ported From MMV3
MultipleUseItemTillFailure(ItemArray) {
  TotalRunTime := A_TickCount
  CheckArea := SpaceOutPositions(PositionMap["ItemMiddle"], 5, false)
  IM := PositionMap["ItemMiddle"]
  STL := PositionMap["SearchFieldTL"]
  SBR := PositionMap["SearchFieldBR"]

  for _ItemNum, Item in ItemArray {
      WhiteBGCheck := 0
      StupidCatCheckNum := 0
      FucntionRunTime := A_TickCount
      RetypeCheck := A_TickCount
      RetypeNumCheck := 0 

      if not PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 10) {
          SendEvent "{F Down}{F Up}"
          BreakLoopTime := A_TickCount
          loop {
              if A_TickCount - BreakLoopTime >= 5000 {
                  break
              }
              if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 10) {
                  break
              }
          }
          Sleep(300)
          SendEvent "{Click, " PositionMap["InventoryBackpackButton"][1] ", " PositionMap["InventoryBackpackButton"][2] ", 1}"
          Sleep(400)
      }

      Sleep(200)
      SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
      Sleep(300)
      SendText Item

      Sleep(100)
      if not PixelSearch(&u,&u,STL[1],STL[2],SBR[1],SBR[2], 0x1E1E1E, 3) {
        OutputDebug("Unfound")
          loop 2 {
              SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
              Sleep(100)
          }
          Sleep(100)
          loop 2 {
              SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
              Sleep(100)
          }
          Sleep(200)
          SendText Item
      }

      Sleep(NumberValueMap["ItemColorGetDelay"])

      ItemPixelColor := PixelGetColor(PositionMap["ItemMiddle"][1], PositionMap["ItemMiddle"][2])
      SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"

      loop {
          if A_TickCount - FucntionRunTime >= 30000 {
              break
          }

          if not PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xFF0B4E, 10) {
              Sleep(500)
              if StupidCatCheck() {
                  StupidCatCheckNum += 1
  
                  if StupidCatCheckNum >= 1 {
                      SendEvent "{F Down}{F Up}"
                      Sleep(600)
                      break
                  }
              }
              SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
              SendEvent "{F Down}{F Up}"
              BreakLoopTime := A_TickCount
              loop {
                  if A_TickCount - BreakLoopTime >= 5000 {
                      break
                  }
                  if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xFF0B4E, 10) {
                      break
                  }
              }
              Sleep(300)
              SendEvent "{Click, " PositionMap["InventoryBackpackButton"][1] ", " PositionMap["InventoryBackpackButton"][2] ", 1}"
              Sleep(400)
              SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
              Sleep(200)
              SendText Item
          }
  
          if PixelSearch(&u,&u, CheckArea[1],CheckArea[2],CheckArea[3],CheckArea[4], ItemPixelColor, 12) {
            RandomPositions5 := []
            loop 5 {
              RandomPositions5.InsertAt(RandomPositions5.Length + 1, [Random(CheckArea[1], CheckArea[3]), Random(CheckArea[2], CheckArea[4])])
            }

            WhiteCheckMax := 0

            for _, ItPn in RandomPositions5 {
              if PixelSearch(&u,&u, ItPn[1], ItPn[2], ItPn[1], ItPn[2], 0xFFFFFF, 5) {
                WhiteCheckMax += 1
              }
            }

            if WhiteCheckMax >= 3 {
              WhiteBGCheck += 1
              OutputDebug("White of Evil")

              if WhiteBGCheck >= 3 {
                  SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                  break
              }

              SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
              Sleep(200)
              SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
              Sleep(200)
              SendText Item
            } else {
              SendEvent "{Click, " IM[1] ", " IM[2] ", 0}"
              Sleep(10)
              SendEvent "{Click, " IM[1] ", " IM[2] ", 1}"
            }
          } else {
              FoundItem := false 
              BreakTime := A_TickCount
              loop {
                  if A_TickCount - BreakTime >= 1500 {
                      break
                  }
                  if PixelSearch(&u,&u, CheckArea[1],CheckArea[2],CheckArea[3],CheckArea[4], ItemPixelColor, 12) {
                      FoundItem := true
                      break
                  }
              }
              if FoundItem {
                  SendEvent "{Click, " IM[1] ", " IM[2] ", 0}"
                  Sleep(150)
                  SendEvent "{Click, " IM[1] ", " IM[2] ", 1}"
              } else {
                  Sleep(500)
                  if StupidCatCheck() {
                      StupidCatCheckNum += 1
                      if StupidCatCheckNum >= 1 {
                          SendEvent "{F Down}{F Up}"
                          Sleep(600)
                          break
                      }
                  } else {
                      if A_TickCount - RetypeCheck >= 2500 {
                          RetypeCheck := A_TickCount
                          SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                          Sleep(300)
                          SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
                          Sleep(100)
                          SendText Item
                          Sleep(100)
                          RetypeNumCheck += 1
                          if RetypeNumCheck >= 3 {
                              break
                          }
                      }
                  }
              }
          }
  
          if StupidCatCheck() {
          StupidCatCheckNum += 1
              if StupidCatCheckNum >= 1 {
                  SendEvent "{F Down}{F Up}"
                  Sleep(600)
                  break
              }
          }
      }
  }    
}

DisconnectedCheck() {
  if not TogglesMap["AutoReconnect"] {
    return false
  }

  DCBLS := SpaceOutPositions(PositionMap["DisconnectedBackgroundLeftSide"], 5, false)
  DCBRS := SpaceOutPositions(PositionMap["DisconnectedBackgroundRightSide"], 5, false)
  RCB := SpaceOutPositions(PositionMap["ReconnectButton"], 10, false)

  if PixelSearch(&A,&A, DCBLS[1], DCBLS[2], DCBLS[3], DCBLS[4], 0x393B3D, 2) {
      if PixelSearch(&A, &A, RCB[1], RCB[2], RCB[3], RCB[4], 0xFFFFFF, 0) {
          if PixelSearch(&A,&A, DCBRS[1], DCBRS[2], DCBRS[3], DCBRS[4], 0x393B3D, 2) {
              return true
          }
      }
  }
  return false
}

;// Quest Functions (Non-Multi)
QuestFunction_ItemUse(QuestArray, QuestNumber) {
  CleanUI()

  if not CurrentZone = 199 {
    TeleportToZone("Void Spiral")
    R_Zone199()
    global CurrentZone := 199
    EnableAutofarm()
  }
  CheckForFlag()


  ItemUseicalFunctionOfDESTRUCTION({Item:QuestArray.Item,ItemDelay:QuestArray.ItemDelay,Number:UserQuests[QuestNumber].QuestAmount, QN:QuestNumber})
}

QuestFunction_FinalZone(QuestArray, QuestNumber) {
  QuestCheckTime := NumberValueMap["QuestReCheckTime"]
  CleanUI()

  if not CurrentZone = 199 {
    TeleportToZone("Void Spiral")
    R_Zone199()
    global CurrentZone := 199
    EnableAutofarm()
  }
  CheckForFlag()

  CurrentQuestValue := UserQuests[QuestNumber].QuestAmount
  CurrentQuestType := UserQuests[QuestNumber].QuestType

  Timered := A_TickCount
  loop {
    if A_TickCount - Timered >= QuestCheckTime {
      Timered := A_TickCount
      QuestUpdated := GetSpecficQuestInfo(StrSplit(QuestNumber, "Quest")[2])

      ; If new quest is detected
      if QuestUpdated.QuestType != CurrentQuestType {
        break
      }
    }

    Sleep(500)
  }
}

QuestFunction_Eggical(QuestArray, QuestNumber) {
  global CurrentZone
  AEPS := NumberValueMap["AverageEggsPerSecond"]
  EBM := PositionMap["EggBuyMax"]
  ToG := PositionMap["TopOfGame"]
  TBr := PositionMap["TPButtonBR"]
  TTL := PositionMap["TPButtonTL"]

  CleanUI()

  if CurrentZone = 100 {
    TeleportToZone("Mushroom Lab")
    TeleportToZone("Tech Spawn")
    R_Egg212()
  } else {
    TeleportToZone("Tech Spawn")
    R_Egg212()
    global CurrentZone := 100
  }

  EggsNumber := UserQuests[QuestNumber].QuestAmount
  TimeToSpend := Ceil(EggsNumber/AEPS) * 1000

  CurrentQuestType := UserQuests[QuestNumber].QuestType

  Sleep(100)
  Failures := 0
  loop {
    loop 3 {
      SendEvent "{E Down}{E Up}"
      Sleep(400)
      SendEvent "{Click, " EBM[1] ", " EBM[2] ", 1}"
      Sleep(200)
    }
    
    StartTime := A_TickCount
    loop {
      if A_TickCount - StartTime >= TimeToSpend {
        break
      }
  
      SendEvent "{Click, " ToG[1] ", " ToG[2] ", 1}"
      Sleep(20)
    }

    SendEvent "{W Down}"
    Sleep(700)
    SendEvent "{W Up}"

    BreakTime := A_TickCount
    BecomeAEscapee := false
    loop {
        SendEvent "{Click, " ToG[1] ", " ToG[2] ", 1}"
        
        if PixelSearch(&A, &A, TTL[1], TTL[2], TBr[1], TBr[2], 0xEC0D3A, 10) {
          NumericalBreak := 0
          MaxTime := A_TickCount
          loop {
            if NumericalBreak >= 15 {
              break
            }

            if PixelSearch(&A, &A, TTL[1], TTL[2], TBr[1], TBr[2], 0xEC0D3A, 12) {
              NumericalBreak += 1
            } else {
              NumericalBreak := 1
            }

            if A_TickCount - MaxTime >= 30000 {
              YouMustBreakFree()
              BecomeAEscapee := true
              break
            }

            Sleep(100)
          }
        }

        if A_TickCount - BreakTime >= 15000 {
            break
        }
        Sleep(20)
    }

    QuestUpdated := GetSpecficQuestInfo(StrSplit(QuestNumber, "Quest")[2])
    if QuestUpdated.QuestType != CurrentQuestType {
      break
    } else {
      if not BecomeAEscapee {
        SendEvent "{S Down}"
        Sleep(800)
        SendEvent "{S Up}"
        Failures += 1 
        if Failures >= 4 {
          break
        }
      } else {
        break
      }
    }
  }
}

QuestFunction_RareEggical(QuestArray, QuestNumber) {
  global CurrentZone
  AEPS := NumberValueMap["AverageEggsPerSecond"]
  EBM := PositionMap["EggBuyMax"]
  ToG := PositionMap["TopOfGame"]
  TBr := PositionMap["TPButtonBR"]
  TTL := PositionMap["TPButtonTL"]

  CleanUI()

  if CurrentZone = 100 {
    TeleportToZone("Mushroom Lab")
    TeleportToZone("Tech Spawn")
    R_Egg211()
  } else {
    TeleportToZone("Tech Spawn")
    R_Egg211()
    global CurrentZone := 100
  }

  TimeToSpend := NumberValueMap["TimeOnHatchingRares"]
  CurrentQuestType := UserQuests[QuestNumber].QuestType

  Sleep(500)
  Failures := 0
  loop {
    loop 3 {
      SendEvent "{E Down}{E Up}"
      Sleep(400)
      SendEvent "{Click, " EBM[1] ", " EBM[2] ", 1}"
      Sleep(200)
    }
    
    StartTime := A_TickCount
    loop {
      if A_TickCount - StartTime >= TimeToSpend {
        break
      }
  
      SendEvent "{Click, " ToG[1] ", " ToG[2] ", 1}"
      Sleep(20)
    }

    SendEvent "{A Down}"
    Sleep(160)
    SendEvent "{A Up}"
    Sleep(700)
    SendEvent "{W Down}"
    Sleep(700)
    SendEvent "{W Up}"
    Sleep(500)

    BreakTime := A_TickCount
    BecomeAEscapee := false
    loop {
        SendEvent "{Click, " ToG[1] ", " ToG[2] ", 1}"
        
        if PixelSearch(&A, &A, TTL[1], TTL[2], TBr[1], TBr[2], 0xEC0D3A, 10) {
          NumericalBreak := 0
          MaxTime := A_TickCount
          loop {
            if NumericalBreak >= 15 {
              break
            }

            if PixelSearch(&A, &A, TTL[1], TTL[2], TBr[1], TBr[2], 0xEC0D3A, 12) {
              NumericalBreak += 1
            } else {
              NumericalBreak := 1
            }

            if A_TickCount - MaxTime >= 30000 {
              YouMustBreakFree()
              BecomeAEscapee := true
              break
            }

            Sleep(100)
          }
        }

        if A_TickCount - BreakTime >= 15000 {
            break
        }
        Sleep(20)
    }

    QuestUpdated := GetSpecficQuestInfo(StrSplit(QuestNumber, "Quest")[2])
    if QuestUpdated.QuestType != CurrentQuestType {
      break
    } else {
      if not BecomeAEscapee {
        SendEvent "{S Down}"
        Sleep(700)
        SendEvent "{S Up}"
        Sleep(500)
        SendEvent "{D Down}"
        Sleep(160)
        SendEvent "{D Up}"
        Sleep(700)
        Failures += 1

        if Failures >= 4 {
          break
        }
      } else {
        break
      }
    }
  }
}

;Routing is buggy here
QuestFunction_Diamondical(QuestArray, QuestNumber) {
  QuestCheckTime := NumberValueMap["QuestReCheckTime"]
  CleanUI()

  if TogglesMap["UserOwnsVIP"] {
    if CurrentZone = 100 {
      TeleportToZone("Mushroom Lab")
      TeleportToZone("Tech Spawn")
      R_w2VIP()
    } else {
      TeleportToZone("Tech Spawn")
      R_w2VIP()
      global CurrentZone := 100
    }
  } else {
    if not CurrentZone = 199 {
      TeleportToZone("Void Spiral")
      R_Zone199()
      global CurrentZone := 199
      EnableAutofarm()
    }
  }
  CheckForFlag()

  EnableAutofarm()
  CurrentQuestValue := UserQuests[QuestNumber].QuestAmount
  CurrentQuestType := UserQuests[QuestNumber].QuestType

  Timered := A_TickCount
  loop {
    if A_TickCount - Timered >= QuestCheckTime {
      QuestUpdated := GetSpecficQuestInfo(StrSplit(QuestNumber, "Quest")[2])
      Timered := A_TickCount

      ; If new quest is detected
      if QuestUpdated.QuestType != CurrentQuestType {
        break
      }

      if (CurrentQuestValue - QuestUpdated.QuestAmount) < 10 {
        if TogglesMap["UserOwnsVIP"] {
          TeleportToZone("Mushroom Lab")
          TeleportToZone("Tech Spawn")
          R_w2VIP()
          EnableAutofarm()
          Sleep(3000)
        } else {
          TeleportToZone("Mushroom Lab")
          TeleportToZone("Void Spiral")
          R_Zone199()
          EnableAutofarm()
        }
      }
    }

    Sleep(500)
  }
}

QuestFunction_GoldenPetsical(QuestArray, QuestNumber) {
  SrB := PositionMap["SearchBar"]
  SCOB := PositionMap["SC_OkayButton"]
  SCOBTL := PositionMap["SC_OkayButtonTL"]
  SCOBBR := PositionMap["SC_OkayButtonBR"]
  GPM := PositionMap["SC_GoldenMachine"]
  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]
  USCP1 := PositionMap["UpperSelectionCircle_Pets1"]
  USCP2 := PositionMap["UpperSelectionCircle_Pets2"]

  CurrentQuestType := UserQuests[QuestNumber].QuestType

  PossiblePets := []
  for Pet, CanUse in MachinePets {
    if CanUse {
      PossiblePets.InsertAt(PossiblePets.Length + 1, Pet)
    }
  }

  SelectedPet := PossiblePets[Random(1,PossiblePets.Length)]

  if CurrentZone = 100 {
    TeleportToZone("Mushroom Lab")
    TeleportToZone("Tech Spawn")
    R_SuperComputer()
  } else {
    TeleportToZone("Tech Spawn")
    R_SuperComputer()
    global CurrentZone := 100
  }

  BreakTime := A_TickCount
  MoreEvilBreak := A_TickCount
  Failure := false
  loop {
    if PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
      break
    }

    if A_TickCount - BreakTime >= 3000 {
      SendEvent "{D Down}"
      Sleep(700)
      SendEvent "{D Up}"
      Sleep(300)
      SendEvent "{A Down}"
      Sleep(700)
      SendEvent "{A Up}"
      BreakTime := A_TickCount
    }

    if A_TickCount - MoreEvilBreak >= 12500 {
      Failure := true
      break
    }
  }

  if Failure {
    return
  }

  Numericald := 0
  loop 3 {
    Numericald += 10
    Sleep(500)
    SendEvent "{Click, " GPM[1] ", " GPM[2] ", 1}"
    Sleep(500)
    SendEvent "{Click, " SrB[1] ", " SrB[2] ", 1}"
    Sleep(200)
    SendText SelectedPet
    Sleep(100)
  
    SendEvent "{Shift Down}"
    Sleep(100)
    SendEvent "{Click " USCP2[1] ", " USCP2[2] ", 1}"
    Sleep(200)
  
    if PixelSearch(&u, &u, SCOBBR[1], SCOBBR[2], SCOBTL[1], SCOBTL[2], 0x80F60E, 5) {
      SendEvent "{Click " USCP2[1] ", " USCP2[2] ", 1}"
      Sleep(100)
      SendEvent "{Shift Up}"
      Sleep(100)
      SendEvent "{Click " USCP2[1] ", " USCP2[2] ", Down}"
      Sleep(100)
      CircularNonsense(40,1,0,Numericald)
      Sleep(100)
      SendEvent "{Click Up}"
  
      loop {
        if PixelSearch(&u, &u, SCOBBR[1], SCOBBR[2], SCOBTL[1], SCOBTL[2], 0x80F60E, 5) {
          Sleep(200)
          SendEvent "{Click, " SCOB[1] ", " SCOB[2] ", 1}"
          break
        }
    
        if A_TickCount - BreakTime >= 12500 {
          break
        }
      }
    } else {
      SendEvent "{Click " USCP1[1] ", " USCP1[2] ", 1}{Shift Up}"
      Sleep(100)
      SendEvent "{Click " USCP1[1] ", " USCP1[2] ", Down}"
      Sleep(100)
      CircularNonsense(40,1,0,Numericald)
      Sleep(100)
      SendEvent "{Click Up}"
  
      loop {
        if PixelSearch(&u, &u, SCOBBR[1], SCOBBR[2], SCOBTL[1], SCOBTL[2], 0x80F60E, 5) {
          Sleep(200)
          SendEvent "{Click, " SCOB[1] ", " SCOB[2] ", 1}"
          break
        }
    
        if A_TickCount - BreakTime >= 12500 {
          break
        }
      }
    }


  
    Sleep(1000)
    SendEvent "{D Down}"
    Sleep(700)
    SendEvent "{D Up}"
    CleanUI()

    QuestUpdated := GetSpecficQuestInfo(StrSplit(QuestNumber, "Quest")[2])

    if QuestUpdated.QuestType != CurrentQuestType or Numericald = 30 {
      break
    }
    CleanUI()

    SendEvent "{A Down}"
    Sleep(700)
    SendEvent "{A Up}"
  }
}

QuestFunction_RainbowPetsical(QuestArray, QuestNumber) {
  SrB := PositionMap["SearchBar"]
  SCOB := PositionMap["SC_OkayButton"]
  SCOBTL := PositionMap["SC_OkayButtonTL"]
  SCOBBR := PositionMap["SC_OkayButtonBR"]
  RPM := PositionMap["SC_RainbowMachine"]
  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]
  USCP1 := PositionMap["UpperSelectionCircle_Pets1"]
  USCP2 := PositionMap["UpperSelectionCircle_Pets2"]

  CurrentQuestType := UserQuests[QuestNumber].QuestType

  PossiblePets := []
  for Pet, CanUse in MachinePets {
    if CanUse {
      PossiblePets.InsertAt(PossiblePets.Length + 1, Pet)
    }
  }

  SelectedPet := PossiblePets[Random(1,PossiblePets.Length)]

  if CurrentZone = 100 {
    TeleportToZone("Mushroom Lab")
    TeleportToZone("Tech Spawn")
    R_SuperComputer()
  } else {
    TeleportToZone("Tech Spawn")
    R_SuperComputer()
    global CurrentZone := 100
  }

  BreakTime := A_TickCount
  MoreEvilBreak := A_TickCount
  Failure := false
  loop {
    if PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
      break
    }

    if A_TickCount - BreakTime >= 3000 {
      SendEvent "{D Down}"
      Sleep(700)
      SendEvent "{D Up}"
      Sleep(300)
      SendEvent "{A Down}"
      Sleep(700)
      SendEvent "{A Up}"
      BreakTime := A_TickCount
    }

    if A_TickCount - MoreEvilBreak >= 12500 {
      Failure := true
      break
    }
  }

  if Failure {
    return
  }

  Numericald := 0
  loop 3 {
  Numericald += 1
    Sleep(500)
    SendEvent "{Click, " RPM[1] ", " RPM[2] ", 1}"
    Sleep(500)
    SendEvent "{Click, " SrB[1] ", " SrB[2] ", 1}"
    Sleep(200)
    SendText SelectedPet
    Sleep(100)
  
    SendEvent "{Shift Down}"
    Sleep(100)
    SendEvent "{Click " USCP2[1] ", " USCP2[2] ", 1}"
    Sleep(200)
  
    if PixelSearch(&u, &u, SCOBBR[1], SCOBBR[2], SCOBTL[1], SCOBTL[2], 0x80F60E, 5) {
      SendEvent "{Click " USCP2[1] ", " USCP2[2] ", 1}"
      Sleep(100)
      SendEvent "{Shift Up}"
      Sleep(100)
      SendEvent "{Click " USCP2[1] ", " USCP2[2] ", Down}"
      Sleep(100)
      CircularNonsense(40,1,0,Numericald)
      Sleep(100)
      SendEvent "{Click Up}"
  
      loop {
        if PixelSearch(&u, &u, SCOBBR[1], SCOBBR[2], SCOBTL[1], SCOBTL[2], 0x80F60E, 5) {
          Sleep(200)
          SendEvent "{Click, " SCOB[1] ", " SCOB[2] ", 1}"
          break
        }
    
        if A_TickCount - BreakTime >= 12500 {
          break
        }
      }
    } else {
      SendEvent "{Click " USCP1[1] ", " USCP1[2] ", 1}{Shift Up}"
      Sleep(100)
      SendEvent "{Click " USCP1[1] ", " USCP1[2] ", Down}"
      Sleep(100)
      CircularNonsense(40,1,0,Numericald)
      Sleep(100)
      SendEvent "{Click Up}"
  
      loop {
        if PixelSearch(&u, &u, SCOBBR[1], SCOBBR[2], SCOBTL[1], SCOBTL[2], 0x80F60E, 5) {
          Sleep(200)
          SendEvent "{Click, " SCOB[1] ", " SCOB[2] ", 1}"
          break
        }
    
        if A_TickCount - BreakTime >= 12500 {
          break
        }
      }
    }


  
    Sleep(1000)
    SendEvent "{D Down}"
    Sleep(700)
    SendEvent "{D Up}"
    CleanUI()

    QuestUpdated := GetSpecficQuestInfo(StrSplit(QuestNumber, "Quest")[2])

    if QuestUpdated.QuestType != CurrentQuestType {
      break
    }
    CleanUI()

    SendEvent "{A Down}"
    Sleep(700)
    SendEvent "{A Up}"
  }
}

QuestFunction_CraftEnchants(QuestArray, QuestNumber) {
  SrB := PositionMap["SearchBar"]
  SCOB := PositionMap["SC_OkayButton"]
  SCOBTL := PositionMap["SC_OkayButtonTL"]
  SCOBBR := PositionMap["SC_OkayButtonBR"]
  EMB := PositionMap["SC_Enchants"]
  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]

  QuestInfo := UserQuests[QuestNumber]
  NeededTier := QuestInfo.ExtraInfo.Tier

  PossibleEnchants := []
  for Enchant, CanUse in EnchantCraftSelection {
    if CanUse {
      PossibleEnchants.InsertAt(PossibleEnchants.Length + 1, Enchant)
    }
  }

  SelectedEnchant := PossibleEnchants[Random(1,PossibleEnchants.Length)] " " NeededTier
  PtU := PositionMap["UpperSelectionCircle_Items" USC_Numerial[NeededTier]]

  if CurrentZone = 100 {
    TeleportToZone("Mushroom Lab")
    TeleportToZone("Tech Spawn")
    R_SuperComputer()
  } else {
    TeleportToZone("Tech Spawn")
    R_SuperComputer()
    global CurrentZone := 100
  }

  BreakTime := A_TickCount
  MoreEvilBreak := A_TickCount
  Failure := false
  loop {
    if PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
      break
    }

    if A_TickCount - BreakTime >= 3000 {
      SendEvent "{D Down}"
      Sleep(700)
      SendEvent "{D Up}"
      Sleep(300)
      SendEvent "{A Down}"
      Sleep(700)
      SendEvent "{A Up}"
      BreakTime := A_TickCount
    }

    if A_TickCount - MoreEvilBreak >= 12500 {
      Failure := true
      break
    }
  }

  if Failure {
    return
  }

  Sleep(100)
  SendEvent "{Click, " EMB[1] ", " EMB[2] ", 1}"
  Sleep(500)
  SendEvent "{Click, " SrB[1] ", " SrB[2] ", 1}"
  Sleep(200)
  SendText SelectedEnchant
  Sleep(100)
  SendEvent "{Click, " PtU[1] ", " PtU[2] ", Down}"
  Sleep(200)
  CircularNonsense(40,1,0,18)
  Sleep(200)
  SendEvent "{Click Up}"

  BreakTime := A_TickCount
  MoreEvilBreak := A_TickCount

  loop {
    if PixelSearch(&u, &u, SCOBBR[1], SCOBBR[2], SCOBTL[1], SCOBTL[2], 0x80F60E, 5) {
      SendEvent "{Click, " SCOB[1] ", " SCOB[2] ", 1}"
      break
    }

    if A_TickCount - MoreEvilBreak >= 12500 {
      break
    }

    if A_TickCount - BreakTime >= 2500 {
      Sleep(100)
      SendEvent "{Click, " SrB[1] ", " SrB[2] ", 1}"
      Sleep(200)
      SendText SelectedEnchant
      Sleep(100)
      SendEvent "{Click, " PtU[1] ", " PtU[2] ", Down}"
      Sleep(200)
      CircularNonsense(40,1,0,18)
      Sleep(200)
      SendEvent "{Click Up}"
      BreakTime := A_TickCount
    }
  }
  Sleep(1000)
  SendEvent "{D Down}"
  Sleep(700)
  SendEvent "{D Up}"
  CleanUI()
}

QuestFunction_CraftPotions(QuestArray, QuestNumber) {
  SrB := PositionMap["SearchBar"]
  SCOB := PositionMap["SC_OkayButton"]
  SCOBTL := PositionMap["SC_OkayButtonTL"]
  SCOBBR := PositionMap["SC_OkayButtonBR"]
  PMB := PositionMap["SC_Potions"]
  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]

  QuestInfo := UserQuests[QuestNumber]
  NeededTier := QuestInfo.ExtraInfo.Tier

  PossiblePotions := []
  for Potion, CanUse in PotionSelection {
    if CanUse {
      PossiblePotions.InsertAt(PossiblePotions.Length + 1, Potion)
    }
  }

  SelectedPotion := PossiblePotions[Random(1,PossiblePotions.Length)] " VI"
  PtU := PositionMap["UpperSelectionCircle_Items" USC_Numerial[NeededTier]]

  if CurrentZone = 100 {
    TeleportToZone("Mushroom Lab")
    TeleportToZone("Tech Spawn")
    R_SuperComputer()
  } else {
    TeleportToZone("Tech Spawn")
    R_SuperComputer()
    global CurrentZone := 100
  }

  BreakTime := A_TickCount
  MoreEvilBreak := A_TickCount
  Failure := false
  loop {
    if PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
      break
    }

    if A_TickCount - BreakTime >= 3000 {
      SendEvent "{D Down}"
      Sleep(700)
      SendEvent "{D Up}"
      Sleep(300)
      SendEvent "{A Down}"
      Sleep(700)
      SendEvent "{A Up}"
      BreakTime := A_TickCount
    }

    if A_TickCount - MoreEvilBreak >= 12500 {
      Failure := true
      break
    }
  }

  if Failure {
    return
  }

  Sleep(100)
  SendEvent "{Click, " PMB[1] ", " PMB[2] ", 1}"
  Sleep(500)
  SendEvent "{Click, " SrB[1] ", " SrB[2] ", 1}"
  Sleep(200)
  SendText SelectedPotion
  Sleep(100)
  SendEvent "{Click, " PtU[1] ", " PtU[2] ", Down}"
  Sleep(200)
  CircularNonsense(40,1,0,18)
  Sleep(200)
  SendEvent "{Click Up}"

  BreakTime := A_TickCount
  MoreEvilBreak := A_TickCount

  loop {
    if PixelSearch(&u, &u, SCOBBR[1], SCOBBR[2], SCOBTL[1], SCOBTL[2], 0x80F60E, 5) {
      SendEvent "{Click, " SCOB[1] ", " SCOB[2] ", 1}"
      break
    }

    if A_TickCount - MoreEvilBreak >= 12500 {
      break
    }

    if A_TickCount - BreakTime >= 2500 {
      Sleep(100)
      SendEvent "{Click, " SrB[1] ", " SrB[2] ", 1}"
      Sleep(200)
      SendText SelectedPotion
      Sleep(100)
      SendEvent "{Click, " PtU[1] ", " PtU[2] ", Down}"
      Sleep(200)
      CircularNonsense(40,1,0,18)
      Sleep(200)
      SendEvent "{Click Up}"
      BreakTime := A_TickCount
    }
  }
  Sleep(1000)
  SendEvent "{D Down}"
  Sleep(700)
  SendEvent "{D Up}"
  CleanUI()
}

QuestFunction_UsePotions(QuestArray, QuestNumber) {
  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]
  Ppb := PositionMap["InventoryPotionButton"]
  SrB := PositionMap["SearchBar"]
  ItL := PositionMap["InvPotsTL"]
  ItR := PositionMap["InvPotsBR"]
  Amount := UserQuests[QuestNumber].QuestAmount
  Tier := UserQuests[QuestNumber].ExtraInfo.Tier
  ColorToSearch := ColorfulNumbers[Tier]
  OutputDebug(ColorToSearch)
  OutputDebug(Tier)
  OutputDebug(Amount)

  PossiblePotions := []
  for Potion, CanUse in PotionSelection {
    if CanUse {
      PossiblePotions.InsertAt(PossiblePotions.Length + 1, Potion)
    }
  }

  SelectedPotion := PossiblePotions[Random(1,PossiblePotions.Length)]

  SendEvent "{F Down}{F Up}"
  BreakTime := A_TickCount
  loop {
    if A_TickCount - BreakTime >= 5000 {
      break
    }

    if PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
      Sleep(400)
      break
    }
  }
  SendEvent "{Click, " Ppb[1] ", " Ppb[2] ", 1}"
  Sleep(500)
  SendEvent "{Click, " SrB[1] ", " SrB[2] ", 1}"
  Sleep(100)
  SendText SelectedPotion " " Tier
  Sleep(300)

  loop (Amount + 1) {
    if PixelSearch(&ppos1, &ppos2, ItL[1], ItL[2], ItR[1], ItR[2], ColorToSearch, 1) {
      SendEvent "{Click, " ppos1 ", " ppos2 ", 1}"
      Sleep(200)
    } else {
      Sleep(100)
    }
  }

  CleanUI()
}

;// Quest Functions (Multi)
; Map(["Item#"] = {Item:"", DelayTime:#, Amount:#})
MultiQuestFunction_DualItem(ImprovisedArray) {
  if not CurrentZone = 199 {
    TeleportToZone("Void Spiral")
    R_Zone199()
    global CurrentZone := 199
    EnableAutofarm()
  }
  CheckForFlag()

  X :=  PositionMap["X"]
  XBR := PositionMap["XBR"]
  XTL := PositionMap["XTL"]
  Bpb := PositionMap["InventoryBackpackButton"]
  SrB := PositionMap["SearchBar"]
  ToG := PositionMap["TopOfGame"]
  ItM := PositionMap["ItemMiddle"]
  STL := PositionMap["SearchFieldTL"]
  SBR := PositionMap["SearchFieldBR"]
  NumericalWhiteout := 0

  CleanUI()
  Inv_OpenToItem()
  MapLength := 0

  for _, __ in ImprovisedArray {
    MapLength += 1
  }

  loop {
    FinalizedItems := 0

    for Key, ItemArray in ImprovisedArray {
      if ItemArray.Amount <= 0 {
        FinalizedItems += 1
        continue
      }

      if not PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
        Sleep(200)
        CleanUI()
        Inv_OpenToItem()
      }

      SendEvent "{Click, " ToG[1] ", " ToG[2] ", 1}"
      Sleep(200)
      SendEvent "{Click, " SrB[1] ", " SrB[2] ", 1}"
      Sleep(200)
      SendText ImprovisedArray[Key].Item
      Sleep(400)

      if PixelSearch(&u,&u,STL[1],STL[2],SBR[1],SBR[2], 0x1E1E1E, 3) {
        SendEvent "{Click " ItM[1] ", " ItM[2] ", 1}"
      }
  
      Sleep(500)
      if StupidCatCheck() {
        ItemArray.Amount += 1
        CleanUI()
      }

      Sleep(ImprovisedArray[Key].Delay)
      ItemArray.Amount -= 1
    }

    if FinalizedItems >= MapLength {
      break
    }
  }

  for QuestNumber, QuestArray in ImprovisedArray {
    Qu := GetSpecficQuestInfo(StrSplit(QuestNumber, "Quest")[2])

    if not QuestArray.QT = Qu.QuestType {
      continue
    }

    if (Qu.QuestAmount - QuestArray.Amount) = 0 {
      TypeOfQuest := UserQuests[QuestArray.QN].QuestType
  
  
      if Quests[TypeOfQuest].QuestArray.ItemFailureMethod := "0 Priority" {
        EvilMap := Map(
          "Delay", Quests[TypeOfQuest].QuestArray.ItemFailureDownTime,
          "Issue", "0 Priority"
        )
  
        for Key, Value in Quests[TypeOfQuest].QuestArray.PriorityMap {
          EvilMap[Key] := Value
          Quests[TypeOfQuest].QuestArray.PriorityMap[Key] := 0
        }
  
      OutputDebug("`nIssue : 3")
        FixItFelix[TypeOfQuest] := EvilMap
      } else if Quests[TypeOfQuest].QuestArray.ItemFailureMethod = "PartyBoxxed" {
        EvilMap := Map(
          "Delay", Quests[TypeOfQuest].QuestArray.ItemFailureDownTime,
          "Issue", "PartyBoxxed",
          "PreviousItem", Quests[TypeOfQuest].Item := "Party Box"
        )
    
        OutputDebug("`nIssue : 4")
        FixItFelix[TypeOfQuest] := EvilMap
      }

    } 
  }
}

; {Amount:(NUMBER),Type:(TypeOfEgg[RareORBest]),Zone:("Final" OR "Vip"), QN:QuestNumber}
MultiQuestFunction_ZoneEgg(ImprovisedArray) {
  global CurrentZone

  if ImprovisedArray.Zone = "Final" {
    if AutofarmZone != 199 {

      if not CurrentZone = 199 {
        TeleportToZone("Void Spiral")
        R_Zone199()
        global CurrentZone := 199
        EnableAutofarm()
      }

    }
  } else if ImprovisedArray.Zone = "Vip" {

    if TogglesMap["UserOwnsVIP"] {
      if AutofarmZone != 100 {
        if CurrentZone = 100 {
          TeleportToZone("Mushroom Lab")
          TeleportToZone("Tech Spawn")
          R_w2VIP()
          EnableAutofarm()
        } else {
          TeleportToZone("Tech Spawn")
          R_w2VIP()
          EnableAutofarm()
          global CurrentZone := 100
        }

      }
    } else {
      if AutofarmZone != 199 {
        if not CurrentZone = 199 {
          TeleportToZone("Void Spiral")
          R_Zone199()
          global CurrentZone := 199
          EnableAutofarm()
        }
  
      }
    }

  }
  CheckForFlag()


  if ImprovisedArray.Type = "Rare" {
    QuestFunction_RareEggical({}, ImprovisedArray.QN)
  } else if ImprovisedArray.type = "Best" {
    QuestFunction_Eggical({}, ImprovisedArray.QN)
  }
}

; {Zone:"Final" or "Vip", MiscQuest: Quest# With the misc etc Quest4"}
MultiQuestFunction_ZoneMisc(ImprovisedArray) {
  global CurrentZone

  if ImprovisedArray.Zone = "Final" {
    if AutofarmZone != 199 {

      if not CurrentZone = 199 {
        TeleportToZone("Void Spiral")
        R_Zone199()
        global CurrentZone := 199
        EnableAutofarm()
      }

    }
  } else if ImprovisedArray.Zone = "Vip" {

    if TogglesMap["UserOwnsVIP"] {
      if AutofarmZone != 100 {

        if CurrentZone = 100 {
          TeleportToZone("Mushroom Lab")
          TeleportToZone("Tech Spawn")
          R_w2VIP()
          EnableAutofarm()
        } else {
          TeleportToZone("Tech Spawn")
          R_w2VIP()
          EnableAutofarm()
          global CurrentZone := 100
        }

      }
    } else {
      if AutofarmZone != 199 {

        if not CurrentZone = 199 {
          TeleportToZone("Void Spiral")
          R_Zone199()
          global CurrentZone := 199
          EnableAutofarm()
        }
  
      }
    }

  }
  CheckForFlag()


  Param1 := Quests[UserQuests[ImprovisedArray.MiscQuest].QuestType].QuestArray
  Param2 := ImprovisedArray.MiscQuest
  QuestFunction := Quests[UserQuests[ImprovisedArray.MiscQuest].QuestType].QuestFunction
  QuestFunction(Param1, Param2)
}

;// Main Functions (OF EVIL RAHH)
Evilize(*) {
  global LastFruitTime
  global CurrentZone
  OutputDebug(TogglesMap["UserOwnsVIP"])

  EnableAutoHatch()
  EnableAutoHatch()

  loop {
    for Quest, IssueMap in FixItFelix {
      IssueMap["Delay"] -= 1

      if IssueMap["Delay"] <= 0 {
      OutputDebug("`nUnIssue : 1")
        if IssueMap["Issue"] = "0 Priority" {
          for Key, Value in Quests[Quest].QuestArray.PriorityMap {
            Quests[Quest].QuestArray.PriorityMap[Key] = IssueMap[Key]
          }
        } else if IssueMap["Issue"] = "PartyBoxxed" {
          Quests[Quest].QuestArray.Item := IssueMap["PreviousItem"]
        }
      }
    }

    GetRankQuests()

    if DoRankClaim {
      RankClaimSimulator()
    }

    DidMulti := MultiTaskCheck()

    if DidMulti {
      continue
    }

    ChosenQuest := "nil"
    Order := []
    if TogglesMap["Enable2StarQuest"] {
      Order := ["Quest2", "Quest3", "Quest4"]
    } else {
      Order := ["Quest3", "Quest4"] ; "Quest3", 
    }

    TotalAmount := 0
    ChosenNumber := 0

    for ___IDK, QuestNumericator in Order {
      TotalAmount += UserQuests[QuestNumericator].Priority
    }
    ChosenNumber := Random(0,TotalAmount)
    
    for ___IDK, QuestNumericator in Order {
      ChosenNumber -= UserQuests[QuestNumericator].Priority
      if ChosenNumber <= 0 {
        ChosenQuest := QuestNumericator
        break
      }
    }

    if InStr(ChosenQuest, "Quest") and UserQuests[ChosenQuest].QuestType != "nil" {
      OutputDebug("`nChosenQuest : " ChosenQuest " | " UserQuests[ChosenQuest].QuestType " |")
      Param1 := Quests[UserQuests[ChosenQuest].QuestType].QuestArray
      Param2 := ChosenQuest
      QuestFunction := Quests[UserQuests[ChosenQuest].QuestType].QuestFunction
      QuestFunction(Param1, Param2)
      Sleep(1000)
    }

    if A_TickCount - LastFruitTime >= NumberValueMap["FruitEatDelay"] and TogglesMap["AutoFruit"] and CurrentZone = 100 {
      LastFruitTime := A_TickCount
      MultipleUseItemTillFailure(["Apple", "Banana", "Watermelon", "Pineapple", "Orange", "Rainbow Fruit"])
    }
  }
}

MainFunction(*) {
  if not MacroEnabled {
    return
  }

  Evilize()
}

UnmainFunction(*) {
  try {
    ExitApp
  }
}

SemiMainFunction(*) {
  Pause -1
}

DebugMainFunction(*) {
  MsgBox(DebugString)
}

^LButton::{
  try {
      OutputDebug(Type(CurrentPostionLabel))
      if Type(CurrentPostionLabel) = "Array" {
          if Type(CurrentPostionLabel[2]) = "String" {
              if CurrentPostionLabel[2] = "X" {
                  MouseGetPos(&u,&u2)
                  CurrentPostionLabel[1].Text := u
                  global CurrentPostionLabel := ""
              } else {
                  MouseGetPos(&u,&u2)
                  CurrentPostionLabel[1].Text := u2
                  global CurrentPostionLabel := ""
              }
          } else {
              MouseGetPos(&u,&u2)
              CurrentPostionLabel[1].Text := u
              CurrentPostionLabel[2].Text := u2
              global CurrentPostionLabel := ""
          } 
      }
  }
}

try {
  Hotkey EvilGyatKey, UnmainFunction, "On"
  Hotkey GyatKey, MainFunction, "On"
  Hotkey MediumGyatKey, SemiMainFunction, "On"
  Hotkey DebugGyatKey, DebugMainFunction, "On"
}