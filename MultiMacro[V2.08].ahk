; Script / Macro or whataver made by:
; A_Basement on Youtube & Discord
; Oliyopi on Roblox
; Happy Macroing!
; Need Help? Join https://discord.com/invite/JrwB6jVxkR

; MultiMacro [V2.08]
; Last update for v2......

CurrentWorld := "World2" ; ONLY USE "World2" or "World1", misspelling will result on defaulting to world 2
TypeOfFlag := "Magnet Flag" ; Type of flag used in AutoFlag

; - Macro Toggles -
; BothWorlds
CycleVendingMachines := False
ClaimFreeGifts := True
CraftKeys := False
CameraSetup := False

; World 2 Specific
FarmZone124 := True
OpenEgg137 := False
UseFruits := True
AutoFlag := True
AutoSprinkler := True
UseUltimate := True

; World 1 Specific
CycleDiamondVendingMachines := False
CycleMerchants := False
CycleUselessMerchants := False
; ----------------

; Auto-Reconnect
AutoReconnect := true
Re_Enable_AutoFarm := true
Re_Enable_AutoHatch := true
Reconnect_Place_Flag := true

; AutoUseItem (REQUIRES FARMZONE124 SET TO TRUE & OpenEgg137 SET TO FALSE)
AutoUseItem := True
ItemsArray := ["Lucky Block"]
DelayBetweenUsingItems := 90000
DelayBetweenUsingIndividualItems := 10000

; Key CraftingSettings
KeyArray := ["Crystal"] ;["Crystal", "Secret", "Tech"]
KeyCraftingTime := 60000
MainKeyPart := "Upper"

; How long it waits before looping
LoopTime :=  600000

; how far you go into Zone124
DistanceIntoZone124 := 500

; How much time it waits before attempting a move after
; hitting the telport button
TeleportWaitTime := 5000

; StupidEggVariable
; Not going far back enough / too far back when trying to route to the egg?
EggBackwardsDistance := 1025

; Main Code Starts here, if you change stuff down here i hope you know what you are doing.
#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Window
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1

; Functions
VendingCheck(RedXCheck_X, RedXCheck_Y, StupidCatCheckX, StupidCatCheckY, VendBuyX, VendBuyY, HalfX, lby1)
{
    VendStartTime := A_TickCount
    loop,
    {
        CheckVar := A_TickCount - VendStartTime
        if (CheckVar >= 4000)
        {
            break
        }

        PixelSearch, XPosition, YPosition, %RedXCheck_X%, %RedXCheck_Y%, %RedXCheck_X%, %RedXCheck_Y%, 0xFF1B69, 10, Fast RGB
        if not ErrorLevel
        {
            VendStartTime := A_TickCount
            SendEvent, {Click, %VendBuyX%, %VendBuyY% Left, 1}
        }
        Sleep, 10

        PixelSearch, XPosition, YPosition, %StupidCatCheckX%, %StupidCatCheckY%, %StupidCatCheckX%, %StupidCatCheckY%, 0x95AACD, 15, Fast RGB
        if not ErrorLevel
        {
          SendEvent, {Click, %HalfX%, %lby1% Left, 1}
          break
        }
        Sleep, 10
    }
}

MerchantItUp(MerchantButton1X, MerchantButton1Y, MerchantButton2X, MerchantButton2Y, MerchantButton3X)
{
    XLoopTime := 0
    Loop
    {
        SendEvent, {Click, %MerchantButton1X%, %MerchantButton1Y% Left, 1}
        Sleep, 200
        SendEvent, {Click, %MerchantButton2X%, %MerchantButton1Y% Left, 1}
        Sleep, 200
        SendEvent, {Click, %MerchantButton3X%, %MerchantButton1Y% Left, 1}
        Sleep, 200
        SendEvent, {Click, %MerchantButton1X%, %MerchantButton2Y% Left, 1}
        Sleep, 200
        SendEvent, {Click, %MerchantButton2X%, %MerchantButton2Y% Left, 1}
        Sleep, 200
        SendEvent, {Click, %MerchantButton3X%, %MerchantButton2Y% Left, 1}
        Sleep, 200
        XLoopTime ++
        If (XLoopTime >= 4)
        {
            Break
        }
    }
}

StupidCatCheck(StupidCatCheckX, StupidCatCheckY, HalfX, lby1)
{
    Loop, 100
    {
        CoordMode, Pixel, Window
        PixelSearch, FoundX, FoundY, %StupidCatCheckX%, %StupidCatCheckY%, %StupidCatCheckX%, %StupidCatCheckY%, 0x95AACD, 15, Fast RGB
    }
    If (ErrorLevel = 0)
    {
        SendEvent, {Click, %HalfX%, %lby1% Left, 1}
        Sleep, 400
    }
}

SetUp(HalfX, scrlY1, scrlY2)
{
    SendEvent, {Click, WheelDown, 200}
    Sleep, 100
    SendEvent, {Click, %HalfX%, %scrlY1%, 0}
    Sleep, 100
    SendEvent, {Click, %HalfX%, %scrlY1%, Right Down}
    Sleep, 10
    SendEvent, {Click, %HalfX%, %scrlY2%, Right Up}

    Sleep, 300
}

UseItemTillFailure(BPSearchX, BPSearchY, BackPackX, BackPackY, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, BPPxCY, ItemX, ItemY, MRedXCheck_X, MRedXCheck_Y, ItemName)
{
    SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
    Sleep, 450
    SendRaw, %ItemName%
    Sleep, 600
    PixelGetColor, FPC, %ItemX%, %ItemY%, RGB


    ColorToFind := "" FPC
    ItemCheckTimer := A_TickCount
    LastTimerReCheck := A_TickCount
    MaxLoopTime := A_TickCount
    WhiteOverCheck := 0


    Sleep, 100
    loop
    {
        CheckTimeVariable := A_TickCount - ItemCheckTimer
        MaxCheckTimeVariable := A_tickCount - MaxLoopTime

        if CheckTimeVariable >= 5000
        {
            Break
        }

        if MaxCheckTimeVariable >= 25000
        {
            Break
        }

        PixelSearch, RAHHHHX, RAHHHHY, %MRedXCheck_X%, %MRedXCheck_Y%, %MRedXCheck_X%, %MRedXCheck_Y%, 0xFF0B4D, 10, Fast RGB
        if ErrorLevel
        {
            Sleep, 250
            PixelSearch, FoundX, FoundY, %StupidCatCheckX%, %StupidCatCheckY%, %StupidCatCheckX%, %StupidCatCheckY%, 0x95AACD, 15, Fast RGB
            if not ErrorLevel
            {
                Sleep, 300
                SendEvent, {Click, %HalfX%, %lby1%, 1}
                Sleep, 300
                Break
            }
            if ErrorLevel
            {
                Sleep, 100
                SendEvent, {Click, %HalfX%, %lby2%, 1}
                Sleep, 1000
                SendEvent, {Click, %BackPackX%, %BackPackY%, 1}
                Sleep, 2000
                ItemCheckTimer += 3000
                MaxCheckTimeVariable += 3000
            }
        }

        PixelSearch, RAHHHHX, RAHHHHY, %ItemX%-20, %ItemY%-20, %ItemX%+20, %ItemY%+20, %ColorToFind%, 10, Fast RGB
        if not ErrorLevel
        {
            PixelSearch, RAHHHHX, RAHHHHY, %ItemX%, %ItemY%, %ItemX%, %ItemY%, 0xFFFFFF, 2, Fast RGB
            if ErrorLevel
            {
                SendEvent, {Click, %ItemX%, %ItemY%, 1}
                ItemCheckTimer := A_TickCount
            }
            if not ErrorLevel
            {
                WhiteOverCheck ++

                if (WhiteOverCheck >= 3)
                {
                    SendEvent, {Click, %HalfX%, 40, 1}
                    Break
                }
            }
        }
        if ErrorLevel
        {
            PixelSearch, FoundX, FoundY, %StupidCatCheckX%, %StupidCatCheckY%, %StupidCatCheckX%, %StupidCatCheckY%, 0x95AACD, 15, Fast RGB
            if not ErrorLevel
            {
                Sleep, 300
                SendEvent, {Click, %HalfX%, %lby1%, 1}
                Sleep, 300
                Break
            }

            If ErrorLevel
            {
                ReTypeCheck := A_TickCount - LastTimerReCheck
                if ReTypeCheck >= 1500
                {
                    SendEvent, {Click, %HalfX%, 40, 1}
                    Sleep, 650
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
                    Sleep, 650
                    SendRaw, %ItemName%
                    LastTimerReCheck := A_TickCount
                }
            }
        }
        PixelSearch, FoundX, FoundY, %StupidCatCheckX%, %StupidCatCheckY%, %StupidCatCheckX%, %StupidCatCheckY%, 0x95AACD, 15, Fast RGB
        if not ErrorLevel
        {
            Sleep, 300
            SendEvent, {Click, %HalfX%, %lby1%, 1}
            Sleep, 400
            Break
        }
    }
}

TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
{
    ToReconnect := false
    loop, 1
    {
        PixelSearch, H22, H23, %DcMenuX1%, %DcMenuY1%, %DcMenuX2%, %DcMenuY2%, 0x393B3D, 3, Fast RGB
        if (ErrorLevel = 0)
        {
            PixelSearch, __RCX, __RCY, %RcButtonX%, %RcButtonY%, %RcButtonX%, %RcButtonY%, 0xFFFFFF, 0, Fast RGB
            if (ErrorLevel = 0)
            {
                PixelSearch, Fd2, Fd3, %DcCX%, %DcXY%, %DcCX%, %DcXY%, 0x393B3D, 3, Fast RGB
                if (ErrorLevel = 0)
                {
                    ToReconnect := True
                }
            }
        }
    }

    if ToReconnect
    {
        SendEvent, {Click, %RcButtonX%, %RcButtonY%, 1}
        Loop,
        {
            PixelSearch, FoundX2F, FoundY2F, %TpButtonCheckX1%, %TpButtonCheckY1%, %TpButtonCheckX2%, %TpButtonCheckY2%, 0xEC0D3A, 15, Fast RGB
        }
        Until ErrorLevel = 0
        if Re_Enable_AutoFarm
        {
            Sleep, 500
            SendEvent, {Click, %TpButtonCheckX%, %TpButtonCheckY%, 1}
            Sleep, 750
            SendEvent, {Click, %BPSearchX%, %BPSearchY%}
            Sleep, 150
            SendRaw, Alien Lab
            Sleep, 250
            SendEvent, {Click, %TPX3%, %TPY1%, 1}
            Sleep, %TeleportWaitTime%
            Send, {q Down}{q Up}
            Sleep, 200
            Send, {Space Down}
            Sleep, 100
            Send, {Space Up}{s Down}
            Sleep, %DistanceIntoZone124%
            Send, {s Up}
            Sleep, 200
            Send, {q Down}{q Up}
            Sleep, 200
            SendEvent, {Click, %AutoFarmButtonX%, %AutoFarmButtonY%, 1}
        }
        if Reconnect_Place_Flag
        {
            Sleep, 500
            if not Re_Enable_AutoFarm
            {
                SendEvent, {Click, %TpButtonCheckX%, %TpButtonCheckY%, 1}
                Sleep, 750
                SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                Sleep, 150
                SendRaw, Cyber Base Camp
                Sleep, 250
                SendEvent, {Click, %TPX3%, %TPY1%, 1}
                Sleep, %TeleportWaitTime%
            }
            SendEvent, {Click, %HalfX%, %lby2%, 1}
            Sleep, 10
            Sleep, 1000
            SendEvent, {Click, %BackPackX%, %BackPackY%, 1}
            Sleep, 10
            Sleep, 1500
            UseItemTillFailure(BPSearchX, BPSearchY, BackPackX, BackPackY, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, BPPxCY, ItemX, ItemY, MRedXCheck_X, MRedXCheck_Y, TypeOfFlag)
            Sleep, 200
            SendEvent, {Click, %MRedXCheck_X%, %MRedXCheck_Y%, 1}
            Sleep, 200
        }
        if Re_Enable_AutoHatch
        {
            Sleep, 500
            SendEvent, {Click, %AutoHatchButtonX%, %AutoHatchButtonY%, 1}
        }
        
            Sleep, 500
            SendEvent, {Click, %TpButtonCheckX%, %TpButtonCheckY%, 1}
            Sleep, 750
            SendEvent, {Click, %BPSearchX%, %BPSearchY%}
            Sleep, 150
            SendRaw, Virtual Garden
            Sleep, 250
            SendEvent, {Click, %TPX3%, %TPY1%, 1}
            Sleep, %TeleportWaitTime%
            InZone124 := false
            return True
    }
    if not ToReconnect
    {
        return false
    }
}

UseSingluarItem(BPSearchX, BPSearchY, BackPackX, BackPackY, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, BPPxCY, ItemX, ItemY, MRedXCheck_X, MRedXCheck_Y, ItemName)
{
    SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
    Sleep, 450
    SendRaw, %ItemName%
    Sleep, 600
    PixelGetColor, FPC, %ItemX%, %ItemY%, RGB


    ColorToFind := "" FPC
    ItemCheckTimer := A_TickCount
    LastTimerReCheck := A_TickCount
    WhiteOverCheck := 0

    loop,
    {
        CheckTimer := A_TickCount - ItemCheckTimer
        if CheckTimer >= 6000
        {
            Break
        }
        PixelSearch, RAHHHHX, RAHHHHY, %ItemX%-20, %ItemY%-20, %ItemX%+20, %ItemY%+20, %ColorToFind%, 10, Fast RGB
        if not ErrorLevel
        {
            SendEvent, {Click, %ItemX%, %ItemY%, 1}
            Break
        }
        if ErrorLevel
        {
            PixelSearch, FoundX, FoundY, %StupidCatCheckX%, %StupidCatCheckY%, %StupidCatCheckX%, %StupidCatCheckY%, 0x95AACD, 15, Fast RGB
            if not ErrorLevel
            {
                Sleep, 300
                SendEvent, {Click, %HalfX%, %lby1%, 1}
                Sleep, 300
                Break
            }

            If ErrorLevel
            {
                ReTypeCheck := A_TickCount - LastTimerReCheck
                if ReTypeCheck >= 1500
                {
                    SendEvent, {Click, %HalfX%, 40, 1}
                    Sleep, 650
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
                    Sleep, 650
                    SendRaw, %ItemName%
                    LastTimerReCheck := A_TickCount
                }
            }

            PixelSearch, RAHHHHX, RAHHHHY, %ItemX%, %ItemY%, %ItemX%, %ItemY%, 0xFFFFFF, 2, Fast RGB
            if not ErrorLevel
            {
                WhiteOverCheck ++
                if (WhiteOverCheck >= 3)
                {
                    Break
                }
            }
            if ErrorLevel
            {
            WhiteOverCheck := 0
            }
        }
    }
}

KeyCrafter3000(BPSearchX, BPSearchY, BackPackX, BackPackY, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, lby3, TPX3, TPX2, BPPxCX, BPPxCY, ItemX, ItemY, MRedXCheck_X, MRedXCheck_Y, KeyArray, KeyCraftingTime, MainKeyPart) ; 10/10 Name
{
    KeyAmount := KeyArray.Length()
    TimePerKey := KeyCraftingTime / KeyAmount

    ColorToFind := "" FPC
    ItemCheckTimer := A_TickCount
    LastTimerReCheck := A_TickCount
    MaxLoopTime := A_TickCount
    WhiteOverCheck := 0


    Sleep, 100
    for KeyNum, KeyType in KeyArray
    {
        Sleep, 200
        SendEvent, {Click, %HalfX%, 40, 1}
        Sleep, 400
        SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
        Sleep, 450
        SendRaw, %KeyType% Key: %MainKeyPart% Half
        Sleep, 600
        PixelGetColor, FPC, %ItemX%, %ItemY%, RGB

        ColorToFind := "" FPC
        ItemCheckTimer := A_TickCount
        LastTimerReCheck := A_TickCount
        MaxLoopTime := A_TickCount
        WhiteOverCheck := 0
        loopNumber := 0
        GeekedCycles := 0

        KeyCraftStartTime := A_TickCount
        loop
        {
            loopNumber++
            OutputDebug, | LoopNumber : %loopNumber% 
            KeyTimeCheck := A_TickCount - KeyCraftStartTime
            if (KeyTimeCheck >= TimePerKey)
            {
                Break
            }

            PixelSearch, RAHHHHX, RAHHHHY, %MRedXCheck_X%, %MRedXCheck_Y%, %MRedXCheck_X%, %MRedXCheck_Y%, 0xFF0B4D, 10, Fast RGB
            if ErrorLevel
            {
                Sleep, 250
                PixelSearch, FoundX, FoundY, %StupidCatCheckX%, %StupidCatCheckY%, %StupidCatCheckX%, %StupidCatCheckY%, 0x95AACD, 15, Fast RGB
                if not ErrorLevel
                {
                    Sleep, 300
                    SendEvent, {Click, %HalfX%, %lby1%, 1}
                    Sleep, 300
                    Break
                }
                if ErrorLevel
                {
                    Sleep, 100
                    SendEvent, {Click, %HalfX%, %lby2%, 1}
                    Sleep, 1000
                    SendEvent, {Click, %BackPackX%, %BackPackY%, 1}
                    Sleep, 2000
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
                    Sleep, 450
                    SendRaw, %KeyType% Key: %MainKeyPart% Half
                    Sleep, 100
                }
            }

            PixelSearch, RAHHHHX, RAHHHHY, %ItemX%-20, %ItemY%-20, %ItemX%+20, %ItemY%+20, %ColorToFind%, 15, Fast RGB
            if not ErrorLevel
            {
                PixelSearch, RAHHHHX, RAHHHHY, %ItemX%, %ItemY%, %ItemX%, %ItemY%, 0xFFFFFF, 2, Fast RGB
                if ErrorLevel
                {
                    WhiteOverCheck := 0
                    SendEvent, {Click, %ItemX%, %ItemY%, 1}
                    ToBreak := false
                    SafetyLoop1 := A_TickCount
                    loop,
                    {
                        SafetyTest1 := A_TickCount - SafetyLoop1
                        if (SafetyTest1 >= 5000)
                        {
                            Break
                        }

                        PixelSearch, RAHHHHX, RAHHHHY, %TPX3%, %lby3%, %TPX3%, %lby3%, 0x96FA17, 4, Fast RGB
                        if not ErrorLevel
                        {
                            Sleep, 300
                            SendEvent, {Click, %TPX3%, %lby3%, 1}
                            Sleep, 100
                            ToBreak := true
                            Break
                        }
                        PixelSearch, RAHHHHX, RAHHHHY, %TPX2%, %lby3%, %TPX2%, %lby3%, 0x96FA17, 4, Fast RGB
                        if not ErrorLevel
                        {
                            Sleep, 100
                            SendEvent, {Click, %TPX2%, %lby3%, 1}
                            SafetyLoop2 := A_TickCount
                            SecondaryBreak := false
                            loop,
                            {
                                SafetyTest2 := A_TickCount - SafetyLoop2
                                if (SafetyTest2 >= 5000)
                                {
                                    Break
                                }
                                PixelSearch, ABCX, ABCY, %TPX3%, %lby3%, %TPX3%, %lby3%, 0x96FA17, 4, Fast RGB
                                if not ErrorLevel
                                {
                                    Sleep, 100
                                    SendEvent, {Click, %ABCX%, %ABCY%,1}
                                    Sleep, 200
                                    SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
                                    Sleep, 200
                                    SendRaw, %KeyType% Key: %MainKeyPart% Half

                                    SecondaryBreak := true
                                    Break
                                }
                            }
                            if SecondaryBreak
                            {
                                Break
                            }
                        }
                    }
                    if ToBreak
                    {
                        Break
                    }
                    Sleep, 200
                }
                if not ErrorLevel
                {
                    WhiteOverCheck ++

                    if (WhiteOverCheck >= 3)
                    {
                        SendEvent, {Click, %HalfX%, 40, 1}
                        OutputDebug, Brkoen1
                        Break
                    }
                }
            }
            if ErrorLevel
            {
                PixelSearch, FoundX, FoundY, %StupidCatCheckX%, %StupidCatCheckY%, %StupidCatCheckX%, %StupidCatCheckY%, 0x95AACD, 15, Fast RGB
                if not ErrorLevel
                {
                    Sleep, 300
                    SendEvent, {Click, %HalfX%, %lby1%, 1}
                    Sleep, 300
                    OutputDebug, Brkoen2
                    Break
                }

            If ErrorLevel
            {
                ReTypeCheck := A_TickCount - LastTimerReCheck
                if ReTypeCheck >= 1500
                {
                    SendEvent, {Click, %HalfX%, 40, 1}
                    Sleep, 650
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
                    Sleep, 650
                    SendRaw, %KeyType% Key: %MainKeyPart% Half
                    LastTimerReCheck := A_TickCount
                }
            }
            }
            PixelSearch, FoundX, FoundY, %StupidCatCheckX%, %StupidCatCheckY%, %StupidCatCheckX%, %StupidCatCheckY%, 0x95AACD, 15, Fast RGB
            if not ErrorLevel
            {
                Sleep, 300
                SendEvent, {Click, %HalfX%, %lby1%, 1}
                Sleep, 400
                OutputDebug, Brkoen3
                Break
            }
        }
    }
}

; Move Functions For Each Zone
; W1 Zones
Zone6() ; Vending
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 500
    Send, {w Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 625
    Send, {d Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 200
    Send, {w Up}
}
Zone9() ; Vending
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 450
    Send, {d Up}
    Sleep, 200
    Send, {s Down}
    Sleep, 700
    Send, {s Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 250
    Send, {d Up}
}
Zone14() ; Vending
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 450
    Send, {d Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 700
    Send, {w Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 250
    Send, {d Up}
}
Zone19() ; Merchant
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 450
    Send, {d Up}
    Sleep, 200
    Send, {s Down}
    Sleep, 650
    Send, {s Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 250
    Send, {d Up}
}
Zone26() ; Vending
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 450
    Send, {w Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 1400
    Send, {d Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 250
    Send, {w Up}
}
Zone35() ; Vending
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 550
    Send, {d Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 925
    Send, {w Up}
    Sleep, 250
    Send, {d Down}
    Sleep, 250
    Send, {d Up}
}
Zone39() ; Merchant
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 450
    Send, {d Up}
    Sleep, 200
    Send, {s Down}
    Sleep, 650
    Send, {s Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 250
    Send, {d Up}
}
Zone42() ; Vending
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 450
    Send, {d Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 400
    Send, {w Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 300
    Send, {d Up}
}
Zone47() ; Vending
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 550
    Send, {w Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 625
    Send, {d Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 300
    Send, {w Up}
}
Zone51() ; Vending
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 700
    Send, {w Up}
    Sleep, 300
    Send, {a Down}
    Sleep, 300
    Send, {a Up}
}
Zone54() ; Merchant
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {s Down}
    Sleep, 200
    Send, {s Up}
    Sleep, 200
    Send, {a Down}
    Sleep, 450
    Send, {a Up}
    Sleep, 200
    Send, {s Down}
    Sleep, 350
    Send, {s Up}
    Sleep, 200
    Send, {a Down}
    Sleep, 220
    Send, {a Up}
}
Zone63()
{
    Send, {q Down}{q Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 150
    Send, {w Up}
    Sleep, 200
    Send, {a Down}
    Sleep, 500
    Send, {a Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 1050
    Send, {w Up}
    Sleep, 200
    Send, {d Down}
    Sleep, 275
    Send, {d Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 230
    Send, {w Up}
}
Zone64() ; Vending (Non-Existant)
{
}

; W2 Zones
Zone108() ; Vending
{
    Send, {q Down}{q Up}
    Sleep, 100
    Send, {d Down}
    Sleep, 530
    Send, {d Up}
    Sleep, 40
    Send, {w Down}
    Sleep, 660
    Send, {w Up}
    Sleep, 40
    Send, {d Down}
    Sleep, 200
    Send, {d Up}
}
Zone115() ; Vending
{
    Send, {q Down}{q Up}
    Sleep, 100
    Send, {d Down}
    Sleep, 530
    Send, {d Up}
    Sleep, 40
    Send, {s Down}
    Sleep, 850
    Send, {s Up}
    Sleep, 40
    Send, {d Down}
    Sleep, 200
    Send, {d Up}
}
RouteEgg137(EggBackwardsDistance)
{
    send, {q Down}{q Up}
    Sleep, 200
    Send, {s Down}
    Sleep, 900
    Send, {s Up}
    Sleep, 200
    Send, {a Down}
    Sleep, 1105
    Send, {a Up}
    Sleep, 250
    Send, {s Down}
    Sleep, %EggBackwardsDistance%
    Send, {s Up}
    Sleep, 500
    Send, {d Down}
    Sleep, 1925
    Send, {d Up}
}

; X/Y For TPMENU
TPX1 := 550
TPX2 := 750
TPX3 := 960
TPX4 := 1160
TPX5 := 1370
TPY1 := 350
TPY2 := 535
SpecialTPX1 := 850
SpecialTPX2 := 1060

; Check Positions
TpButtonCheckX1 := (115/1920) * A_ScreenWidth
TpButtonCheckY1 := (355/1080)* A_ScreenHeight
TpButtonCheckX2 := (200/1920) * A_ScreenWidth
TpButtonCheckY2 := (420/1080)* A_ScreenHeight
TpButtonCheckX := (175/1920) * A_ScreenWidth
TpButtonCheckY := (395/1080)* A_ScreenHeight
VendXButtonCheckX := 1300
VendXButtonCheckY := 280
StupidCatCheckX := 965
StupidCatCheckY := 560
ItemX := 520
ItemY := 410

; Other Sh*t idk what to name this lmao
VendBuyX := 1015
VendBuyY := 725
ScrollY1 := 55
ScrollY2 := 800
ScriptStartTime = A_TickCount
HalfY := A_ScreenHeight/2
HalfX := A_ScreenWidth/2
ButtonX := (1030/1920) * A_ScreenWidth
lby1 := (735/1080) * A_ScreenHeight
lby2 := (935/1080) * A_ScreenHeight
lby3 := 690
scrlY2 := (800/1080) * A_ScreenHeight
scrlY1 := (55/1080) * A_ScreenHeight
RedXCheck_X := (1335/1920)* A_ScreenWidth
RedXCheck_Y := (255/1080)* A_ScreenHeight
MRedXCheck_X := (1450/1920)* A_ScreenWidth
MRedXCheck_Y := (280/1080)* A_ScreenHeight
MerchantButton1X := (630/1920)* A_ScreenWidth
MerchantButton2X := (975/1920)* A_ScreenWidth
MerchantButton3X := (1335/1920)* A_ScreenWidth
MerchantButton1Y := (450/1080)* A_ScreenHeight
MerchantButton2Y := (680/1080)* A_ScreenHeight
FreeGiftX1 := (720/1920) * A_ScreenWidth
FreeGiftX2 := (900/1920) * A_ScreenWidth
FreeGiftX3 := (1050/1920) * A_ScreenWidth
FreeGiftX4 := (1220/1920) * A_ScreenWidth
FreeGiftY1 := (360/1080) * A_ScreenHeight
FreeGiftY2 := (500/1080) * A_ScreenHeight
FreeGiftY3 := (650/1080) * A_ScreenHeight
GiftX := (65/1920) * A_ScreenWidth
GiftY := (390/1080) * A_ScreenHeight
GiftXClose := (1295/1920) * A_ScreenWidth
GiftYClose := (265/1080) * A_ScreenHeight
BackPackX := (420/1920) * A_ScreenWidth
BackPackY := (400/1080) * A_ScreenHeight
BPSearchX := (1300/1920) * A_ScreenWidth
BPSearchY := (260/1080) * A_ScreenHeight
BPPxCX := (535/1920) * A_ScreenWidth
BPPxCY := (355/1080) * A_ScreenHeight
DcMenuX1 := 770
DcMenuX2 := 1150
DcMenuY1 := 445
DcMenuY2 := 625
RcButtonX := 1100
RcButtonY := 600
DcCX := 1050
DcXY := 575

AutoFarmButtonX := 165
AutoFarmButtonY := 495
AutoHatchButtonX := 60
AutoHatchButtonY := 485

InZone124 := false
HasMovedinZone := false

; FRUITS RAHHHHHH
FruitsArray := ["Apple", "Banana", "Orange", "Pineapple", "Rainbow Fruit"]

; Main Area
F3::
Loop
{
    IfWinNotExist, Roblox ahk_exe RobloxPlayerBeta.exe
    {
        MsgBox, 16, Error, wheres roblox?
    }
    IfWinExist, ahk_exe RobloxPlayerBeta.exe
    {
        WinActivate, ahk_exe RobloxPlayerBeta.exe
        Sleep, 333
        if AutoReconnect
        {
            ToContinue := TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
            if ToContinue
            {
                Continue
            }
        }
        ForceContinue := false
        Loop
        {
            if  AutoReconnect
            {
                ToContinue := TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
                if ToContinue
                {
                    ForceContinue := true
                    Break
                }
            }
            PixelSearch, FoundX2, FoundY2, %TpButtonCheckX1%, %TpButtonCheckY1%, %TpButtonCheckX2%, %TpButtonCheckY2%, 0xEC0D3A, 15, Fast RGB
        }
        Until ErrorLevel = 0
        if ForceContinue
        {
            Continue
        }
        If (ErrorLevel = 0)
        {
            FoundX2 := TpButtonCheckX
            FoundY2 := TpButtonCheckY
            if (CameraSetup = true)
            {
                SetUp(HalfX, scrlY1, scrlY2)
                Sleep, 400
            }
            If (CycleVendingMachines = true)
            {
                InZone124 := false
                HasMovedinZone := False
                if (CurrentWorld == "World1")
                {
                    SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                    Sleep, 500
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                    Sleep, 40
                    SendRaw, Vending Machine
                    Sleep, 100
                    SendEvent, {Click, %TPX2%, %TPY1%, 1}
                    Sleep, %TeleportWaitTime%
                    Zone6()
                    Sleep, 200
                    VendingCheck(RedXCheck_X, RedXCheck_Y, StupidCatCheckX, StupidCatCheckY, VendBuyX, VendBuyY, HalfX, lby1)
                    Sleep, 200
                    StupidCatCheck(StupidCatCheckX, StupidCatCheckY, HalfX, lby1)
                    Sleep, 200
                    SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                    Sleep, 500
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                    Sleep, 40
                    SendRaw, Vending Machine
                    Sleep, 100
                    SendEvent, {Click, %TPX1%, %TPY1%, 1}
                    Sleep, %TeleportWaitTime%
                    Zone9()
                    Sleep, 200
                    VendingCheck(RedXCheck_X, RedXCheck_Y, StupidCatCheckX, StupidCatCheckY, VendBuyX, VendBuyY, HalfX, lby1)
                    Sleep, 200
                    StupidCatCheck(StupidCatCheckX, StupidCatCheckY, HalfX, lby1)
                    Sleep, 200
                    SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                    Sleep, 500
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                    Sleep, 40
                    SendRaw, Vending Machine
                    Sleep, 100
                    SendEvent, {Click, %TPX3%, %TPY1%, 1}
                    Sleep, %TeleportWaitTime%
                    Zone14()
                    Sleep, 200
                    VendingCheck(RedXCheck_X, RedXCheck_Y, StupidCatCheckX, StupidCatCheckY, VendBuyX, VendBuyY, HalfX, lby1)
                    Sleep, 200
                    StupidCatCheck(StupidCatCheckX, StupidCatCheckY, HalfX, lby1)
                    Sleep, 200
                    SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                    Sleep, 500
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                    Sleep, 40
                    SendRaw, Vending Machine
                    Sleep, 100
                    SendEvent, {Click, %TPX4%, %TPY1%, 1}
                    Sleep, %TeleportWaitTime%
                    Zone26()
                    Sleep, 200
                    VendingCheck(RedXCheck_X, RedXCheck_Y, StupidCatCheckX, StupidCatCheckY, VendBuyX, VendBuyY, HalfX, lby1)
                    Sleep, 200
                    StupidCatCheck(StupidCatCheckX, StupidCatCheckY, HalfX, lby1)
                    Sleep, 200
                    SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                    Sleep, 500
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                    Sleep, 40
                    SendRaw, Vending Machine
                    Sleep, 100
                    SendEvent, {Click, %TPX5%, %TPY1%, 1}
                    Sleep, %TeleportWaitTime%
                    Zone35()
                    Sleep, 200
                    VendingCheck(RedXCheck_X, RedXCheck_Y, StupidCatCheckX, StupidCatCheckY, VendBuyX, VendBuyY, HalfX, lby1)
                    Sleep, 200
                    StupidCatCheck(StupidCatCheckX, StupidCatCheckY, HalfX, lby1)
                    Sleep, 200
                    SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                    Sleep, 500
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                    Sleep, 40
                    SendRaw, Vending Machine
                    Sleep, 100
                    SendEvent, {Click, %TPX1%, %TPY2%, 1}
                    Sleep, %TeleportWaitTime%
                    Zone42()
                    Sleep, 200
                    VendingCheck(RedXCheck_X, RedXCheck_Y, StupidCatCheckX, StupidCatCheckY, VendBuyX, VendBuyY, HalfX, lby1)
                    Sleep, 200
                }

                if (CurrentWorld != "World1")
                {
                    SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                    Sleep, 750
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                    Sleep, 150
                    SendRaw, Vending Machine
                    Sleep, 200
                    SendEvent, {Click, %TPX1%, %TPY1%, 1}
                    Sleep, %TeleportWaitTime%
                    Zone108()
                    Sleep, 200
                    VendingCheck(RedXCheck_X, RedXCheck_Y, StupidCatCheckX, StupidCatCheckY, VendBuyX, VendBuyY, HalfX, lby1)
                    Sleep, 200
                    StupidCatCheck(StupidCatCheckX, StupidCatCheckY, HalfX, lby1)
                    Sleep, 200
                    SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                    Sleep, 750
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                    Sleep, 150
                    SendRaw, Vending Machine
                    Sleep, 200
                    SendEvent, {Click, %TPX2%, %TPY1%, 1}
                    Sleep, %TeleportWaitTime%
                    Zone115()
                    Sleep, 200
                    VendingCheck(RedXCheck_X, RedXCheck_Y, StupidCatCheckX, StupidCatCheckY, VendBuyX, VendBuyY, HalfX, lby1)
                    Sleep, 200
                }
                If (CycleDiamondVendingMachines = true)
                {
                    if (CurrentWorld == "World1")
                    {
                        StupidCatCheck(StupidCatCheckX, StupidCatCheckY, HalfX, lby1)
                        Sleep, 200
                        SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                        Sleep, 500
                        SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                        Sleep, 40
                        SendRaw, Vending Machine
                        Sleep, 100
                        SendEvent, {Click, %TPX2%, %TPY2%, 1}
                        Sleep, %TeleportWaitTime%
                        Zone47()
                        Sleep, 200
                        VendingCheck(RedXCheck_X, RedXCheck_Y, StupidCatCheckX, StupidCatCheckY, VendBuyX, VendBuyY, HalfX, lby1)
                        Sleep, 200
                        StupidCatCheck(StupidCatCheckX, StupidCatCheckY, HalfX, lby1)
                        Sleep, 200
                        SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                        Sleep, 500
                        SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                        Sleep, 40
                        SendRaw, Vending Machine
                        Sleep, 100
                        SendEvent, {Click, %TPX3%, %TPY2%, 1}
                        Sleep, %TeleportWaitTime%
                        Zone51()
                        Sleep, 200
                        VendingCheck(RedXCheck_X, RedXCheck_Y, StupidCatCheckX, StupidCatCheckY, VendBuyX, VendBuyY, HalfX, lby1)
                        Sleep, 200
                    }

                    if (CurrentWorld != "World1")
                    {
                        
                    }
                    
                }
                Sleep, 400
            }
            if AutoReconnect
            {
                ToContinue := TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
                if ToContinue
                {
                    Continue
                }
                Sleep, 400
            }
            If (CycleMerchants = true)
            {
                InZone124 := false
                HasMovedinZone := false
                if (CurrentWorld == "World1")
                {
                    SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                    Sleep, 500
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                    Sleep, 40
                    SendRaw, Merchant
                    Sleep, 100
                    SendEvent, {Click, %TPX3%, %TPY1%, 1}
                    Sleep, %TeleportWaitTime%
                    Zone19()
                    Sleep, 200
                    MerchantItUp(MerchantButton1X, MerchantButton1Y, MerchantButton2X, MerchantButton2Y, MerchantButton3X)
                    Sleep, 200
                    SendEvent, {Click, %MRedXCheck_X%, %MRedXCheck_Y%, 1}
                    Sleep, 400
                    SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                    Sleep, 500
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                    Sleep, 40
                    SendRaw, Merchant
                    Sleep, 100
                    SendEvent, {Click, %TPX4%, %TPY1%, 1}
                    Sleep, %TeleportWaitTime%
                    Zone39()
                    Sleep, 200
                    MerchantItUp(MerchantButton1X, MerchantButton1Y, MerchantButton2X, MerchantButton2Y, MerchantButton3X)
                    Sleep, 200
                    SendEvent, {Click, %MRedXCheck_X%, %MRedXCheck_Y%, 1}
                    Sleep, 400
                }

                if (CurrentWorld != "World1")
                {

                }

                If (CycleUselessMerchants = true)
                {
                    if (CurrentWorld == "World1")
                    {
                        SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                        Sleep, 500
                        SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                        Sleep, 40
                        SendRaw, Merchant
                        Sleep, 100
                        SendEvent, {Click, %TPX5%, %TPY1%, 1}
                        Sleep, %TeleportWaitTime%
                        Zone54()
                        Sleep, 200
                        MerchantItUp(MerchantButton1X, MerchantButton1Y, MerchantButton2X, MerchantButton2Y, MerchantButton3X)
                        Sleep, 200
                        SendEvent, {Click, %MRedXCheck_X%, %MRedXCheck_Y%, 1}
                        Sleep, 400
                        SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                        Sleep, 500
                        SendEvent, {Click, %BPSearchX%, %BPSearchY%}
                        Sleep, 40
                        SendRaw, Merchant
                        Sleep, 100
                        SendEvent, {Click, %TPX1%, %TPY2%, 1}
                        Sleep, %TeleportWaitTime%
                        Zone63()
                        Sleep, 200
                        MerchantItUp(MerchantButton3X, MerchantButton1Y, MerchantButton2X, MerchantButton2Y, MerchantButton3X)
                        Sleep, 200
                        SendEvent, {Click, %MRedXCheck_X%, %MRedXCheck_Y%, 1}
                        Sleep, 400
                    }
                    if (CurrentWorld != "World1")
                    {

                    }
                }
                Sleep, 400
            }
            if AutoReconnect
            {
                ToContinue := TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
                if ToContinue
                {
                    Continue
                }
                Sleep, 400
            }
            If (ClaimFreeGifts = true)
            {

                Sleep, 300
                SendEvent, {Click, %GiftX%, %GiftY% Left, 1}
                Sleep, 10
                Sleep, 600
                SendEvent, {Click, %FreeGiftX1%, %FreeGiftY1% Left, 1}
                Sleep, 10
                Sleep, 200
                SendEvent, {Click, %FreeGiftX2%, %FreeGiftY1% Left, 1}
                Sleep, 10
                Sleep, 200
                SendEvent, {Click, %FreeGiftX3%, %FreeGiftY1% Left, 1}
                Sleep, 10
                Sleep, 200
                SendEvent, {Click, %FreeGiftX4%, %FreeGiftY1% Left, 1}
                Sleep, 10
                Sleep, 200
                SendEvent, {Click, %FreeGiftX1%, %FreeGiftY2% Left, 1}
                Sleep, 10
                Sleep, 200
                SendEvent, {Click, %FreeGiftX2%, %FreeGiftY2% Left, 1}
                Sleep, 10
                Sleep, 200
                SendEvent, {Click, %FreeGiftX3%, %FreeGiftY2% Left, 1}
                Sleep, 10
                Sleep, 200
                SendEvent, {Click, %FreeGiftX4%, %FreeGiftY2% Left, 1}
                Sleep, 10
                Sleep, 200
                SendEvent, {Click, %FreeGiftX1%, %FreeGiftY3% Left, 1}
                Sleep, 10
                Sleep, 200
                SendEvent, {Click, %FreeGiftX2%, %FreeGiftY3% Left, 1}
                Sleep, 10
                Sleep, 200
                SendEvent, {Click, %FreeGiftX3%, %FreeGiftY3% Left, 1}
                Sleep, 10
                Sleep, 200
                SendEvent, {Click, %FreeGiftX4%, %FreeGiftY3% Left, 1}
                Sleep, 10
                Sleep, 800
                SendEvent, {Click, %GiftXClose%, %GiftYClose% Left, 1}
                Sleep, 10
                Sleep, 1200
            }
            if AutoReconnect
            {
                ToContinue := TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
                if ToContinue
                {
                    Continue
                }
                Sleep, 400
            }
            If (CraftKeys = true)
            {
                Sleep, 300
                SendEvent, {Click, %HalfX%, %lby2%, 1}
                Sleep, 1000
                SendEvent, {Click, %BackPackX%, %BackPackY%, 1}
                Sleep, 1500
                KeyCrafter3000(BPSearchX, BPSearchY, BackPackX, BackPackY, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, lby3, TPX3, TPX2, BPPxCX, BPPxCY, ItemX, ItemY, MRedXCheck_X, MRedXCheck_Y, KeyArray, KeyCraftingTime, MainKeyPart)
                Sleep, 300
                SendEvent, {Click, %MRedXCheck_X%, %MRedXCheck_Y%, 1}
                Sleep, 600
            }
            if AutoReconnect
            {
                ToContinue := TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
                if ToContinue
                {
                    Continue
                }
                Sleep, 400
            }
            If (UseFruits = true) and (CurrentWorld != "World1")
            {
                Sleep, 300
                SendEvent, {Click, %HalfX%, %lby2%, 1}
                Sleep, 1000
                SendEvent, {Click, %BackPackX%, %BackPackY%, 1}
                Sleep, 1500
                For FruitNum, FruitName in FruitsArray
                {
                    UseItemTillFailure(BPSearchX, BPSearchY, BackPackX, BackPackY, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, BPPxCY, ItemX, ItemY, MRedXCheck_X, MRedXCheck_Y, FruitName)
                }
                Sleep, 400
                SendEvent, {Click, %MRedXCheck_X%, %MRedXCheck_Y%, 1}
                Sleep, 600
            }
            if AutoReconnect
            {
                ToContinue := TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
                if ToContinue
                {
                    Continue
                }
                Sleep, 400
            }
            if (AutoFlag = true) and (CurrentWorld != "World1")
            {
                if not InZone124
                {
                    InZone124 := True
                    HasMovedinZone := True
                    Sleep, 300
                    SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                    Sleep, 500
                    SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
                    Sleep, 40
                    SendRaw, Alien Lab
                    Sleep, 100
                    SendEvent, {Click, %TPX3%, %TPY1%, 1}
                    Sleep, 200
                    StupidCatCheck(StupidCatCheckX, StupidCatCheckY, RedXCheck_X-20, RedXCheck_Y)
                    Sleep, %TeleportWaitTime%
                    Send, {q Down}{q Up}
                    Sleep, 200
                    Send, {Space Down}
                    Sleep, 100
                    Send, {Space Up}{s Down}
                    Sleep, %DistanceIntoZone124%
                    Send, {s Up}
                    Sleep, 200
                    Send, {q Down}{q Up}
                }
                Sleep, 300
                SendEvent, {Click, %HalfX%, %lby2%, 1}
                Sleep, 1000
                SendEvent, {Click, %BackPackX%, %BackPackY%, 1}
                Sleep, 1500
                UseItemTillFailure(BPSearchX, BPSearchY, BackPackX, BackPackY, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, BPPxCY, ItemX, ItemY, MRedXCheck_X, MRedXCheck_Y, TypeOfFlag)
                if (AutoSprinkler = true)
                {
                    Sleep, 650
                    UseItemTillFailure(BPSearchX, BPSearchY, BackPackX, BackPackY, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, BPPxCY, ItemX, ItemY, MRedXCheck_X, MRedXCheck_Y, "Sprinkler")
                }
                Sleep, 650
                SendEvent, {Click, %MRedXCheck_X%, %MRedXCheck_Y%, 1}
                Sleep, 800
            }
            if AutoReconnect
            {
                ToContinue := TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
                if ToContinue
                {
                    Continue
                }
                Sleep, 400
            }
            if (AutoSprinkler = true) and (CurrentWorld != "World1")
            {
                if (AutoFlag = false)
                {
                    ; wtf weirdo
                    if not InZone124
                    {
                        InZone124 := true
                        HasMovedinZone := True
                        Sleep, 300
                        SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                        Sleep, 500
                        SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
                        Sleep, 40
                        SendRaw, Alien Lab
                        Sleep, 100
                        SendEvent, {Click, %TPX3%, %TPY1%, 1}
                        Sleep, 200
                        StupidCatCheck(StupidCatCheckX, StupidCatCheckY, RedXCheck_X-20, RedXCheck_Y)
                        Sleep, %TeleportWaitTime%
                        Send, {q Down}{q Up}
                    Sleep, 200
                    Send, {Space Down}
                    Sleep, 100
                    Send, {Space Up}{s Down}
                    Sleep, %DistanceIntoZone124%
                    Send, {s Up}
                    Sleep, 200
                    Send, {q Down}{q Up}
                    }
                    Sleep, 300
                    SendEvent, {Click, %HalfX%, %lby2%, 1}
                    Sleep, 10
                    Sleep, 1000
                    SendEvent, {Click, %BackPackX%, %BackPackY%, 1}
                    Sleep, 10
                    Sleep, 1500
                    UseItemTillFailure(BPSearchX, BPSearchY, BackPackX, BackPackY, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, BPPxCY, ItemX, ItemY, MRedXCheck_X, MRedXCheck_Y, "Sprinkler")
                    Sleep, 650
                    SendEvent, {Click, %MRedXCheck_X%, %MRedXCheck_Y%, 1}
                    Sleep, 800
                }
            }
            if AutoReconnect
            {
                ToContinue := TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
                if ToContinue
                {
                    Continue
                }
                Sleep, 400
            }
            If (FarmZone124 = true) and (CurrentWorld != "World1")
            {
               if not InZone124
               {
                InZone124 := true
                HasMovedinZone := False
                SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                Sleep, 750
                SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
                Sleep, 200
                SendRaw, Alien Lab
                Sleep, 200
                SendEvent, {Click, %TPX3%, %TPY1%, 1}
                Sleep, 200
                StupidCatCheck(StupidCatCheckX, StupidCatCheckY, RedXCheck_X-20, RedXCheck_Y)
                Sleep, %TeleportWaitTime%
               }
               if InZone124 and not HasMovedinZone
               {
                HasMovedinZone := true
                Send, {q Down}{q Up}
                Sleep, 200
                Send, {Space Down}
                Sleep, 100
                Send, {Space Up}{s Down}
                Sleep, %DistanceIntoZone124%
                Send, {s Up}
                Sleep, 200
                Send, {q Down}{q Up}
               }
               Sleep, 400
            }
            if AutoReconnect
            {
                ToContinue := TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
                if ToContinue
                {
                    Continue
                }
                Sleep, 400
            }
            if (OpenEgg137 = true) and (CurrentWorld != "World1")
            {
                SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                Sleep, 500
                SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
                Sleep, 200
                SendRaw, Futuristic City
                Sleep, 100
                SendEvent, {Click, %TPX3%, %TPY1%, 1}
                Sleep, 4000
                SendEvent, {Click, %FoundX2%, %FoundY2%, 1}
                Sleep, 500
                SendEvent, {Click, %BPSearchX%, %BPSearchY%, 1}
                Sleep, 200
                SendRaw, Tech Spawn
                Sleep, 100
                SendEvent, {Click, %TPX3%, %TPY1%, 1}
                Sleep, %TeleportWaitTime%
                RouteEgg137(EggBackwardsDistance)
                Sleep, 1200
                Send, {E Down}
                Sleep, 30
                Send, {E Up}
                Sleep, 500
                SendEvent, {Click, %TPX4%, %lby1%, 1}
                Sleep, 200
                SendEvent, {Click, %TPX4%, %lby1%, 1}
                Sleep, 200
                SendEvent, {Click, %TPX4%, %lby1%, 1}
                Sleep, 400
            }
            if AutoReconnect
            {
                ToContinue := TestForReconnect(Re_Enable_AutoFarm, Re_Enable_AutoHatch, Reconnect_Place_Flag, DcMenuX1, DcMenuX2, DcMenuY1, DcMenuY2, RcButtonX, RcButtonY, DcCX, DcXY, AutoFarmButtonX, AutoFarmButtonY, AutoHatchButtonX, AutoHatchButtonY, TpButtonCheckX1, TpButtonCheckX2, TpButtonCheckY1, TpButtonCheckY2, BPSearchX, BPSearchY, BackPackX, BackPackY, TpButtonCheckX, TpButtonCheckY, TeleportWaitTime, DistanceIntoZone124, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, MRedXCheck_X, MRedXCheck_Y, BPPxCY, TPX3, TPY1, TypeOfFlag) 
                if ToContinue
                {
                    Continue
                }
            }
        }
    }
    ScriptEndTime := A_TickCount
    LoopItemTime := 0
    Loop, 
    {
        ScriptRestartCheck := A_TickCount - ScriptEndTime
        if (ScriptRestartCheck >= LoopTime)
        {
            if (OpenEgg137 = true)
            {
                Send, {w Down}
                Sleep, 1000
                Send, {W Up}
                Sleep, 100
                loop, 100
                {
                    SendEvent, {Click, %HalfX%, %lby1%, 1}
                    Sleep, 45
                }
            }
            break
        }
        if (OpenEgg137 = true)
        {
            SendEvent, {Click, %HalfX%, %lby1%, 1}
            Sleep, 10
        }
        if AutoUseItem and FarmZone124 and not OpenEgg137
        {
            IdkCheck := A_TickCount - LoopItemTime
            if (IdkCheck >= DelayBetweenUsingItems)
            {
                Sleep, 300
                SendEvent, {Click, %HalfX%, %lby2%, 1}
                Sleep, 1000
                SendEvent, {Click, %BackPackX%, %BackPackY%, 1}
                Sleep, 1500
                For ItemNum, ItemToUse in ItemsArray
                {
                    UseSingluarItem(BPSearchX, BPSearchY, BackPackX, BackPackY, StupidCatCheckX, StupidCatCheckY, HalfX, lby1, lby2, BPPxCX, BPPxCY, ItemX, ItemY, MRedXCheck_X, MRedXCheck_Y, ItemToUse)
                    Sleep, 500
                    StupidCatCheck(StupidCatCheckX, StupidCatCheckY, HalfX, lby1)
                    Sleep, %DelayBetweenUsingIndividualItems%
                }
                Sleep, 400
                SendEvent, {Click, %MRedXCheck_X%, %MRedXCheck_Y%, 1}
                Sleep, 400
                LoopItemTime := A_TickCount
            }
        }
        if UseUltimate
        {
            Sleep, 25
            SendEvent, {R Down}
            Sleep, 25
            SendEvent, {R Up}
        }
    }
}
return
F8::ExitApp
F6::Pause

