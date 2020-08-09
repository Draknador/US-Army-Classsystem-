TEAM_SOLDAT = 1
team.SetUp(TEAM_SOLDAT, "Soldat", Color(9, 117, 9))
TEAM_ZIVILIST = 2
team.SetUp(TEAM_ZIVILIST, "Zivilist", Color(138, 138, 138))

sound.Add({
    name = "ammo_pickup",
    channel = CHAN_STATIC,
    volume = 60.0,
    level = 100,
    pitch = {95, 110},
    sound = "items/ammo_pickup.wav"
})

hook.Add("PlayerSpawn", "zivilist", function(ply)
    timer.Simple(0.1, function()
        ply:SetTeam(2)
        ply:Say("/job Zivilist")
        ply:SetModel("models/player/gman_high.mdl")
        ply:StripWeapons()
        ply:StripAmmo()
        ply:Give("cw_g4p_usp40")
        ply:Give("keys")
        ply:GiveAmmo(50, ".40 S&W", true)
        ply:SetWalkSpeed(350)
    end)
end)

hook.Add("PlayerSay", "infanterist", function(ply, text)
    if string.lower(text) == "!infanterist" then
        ply:Freeze(true)
        PrintMessage(HUD_PRINTCENTER, "Rüstet aus. ")

        timer.Simple(0.1, function()
            ply:SetTeam(1)
            ply:StripWeapons()
            ply:Say("/job Infanterist")
            ply:SetModel("models/player/pmc_1/pmc__06.mdl")
            ply:SetMaxHealth(200)

            if ply:Health() < ply:GetMaxHealth() then
                ply:SetHealth(ply:Health() + 100)
            end

            timer.Simple(1, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus.. ")
                ply:Give("cw_g4p_m16a2")
                ply:Give("keys")
            end)

            timer.Simple(2, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus... ")
                ply:EmitSound("ammo_pickup")
                ply:GiveAmmo(100, "5.56x45MM", true)
            end)

            timer.Simple(3, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus. ")
                ply:EmitSound("ammo_pickup")
                ply:SetAmmo(200, "5.56x45MM")
            end)

            timer.Simple(4, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus.. ")
                ply:EmitSound("ammo_pickup")
                ply:Give("cw_frag_grenade")
                ply:GiveAmmo(2, "Frag Grenades", true)
                ply:SetWalkSpeed(250)
            end)

            timer.Simple(5, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus... ")
                ply:EmitSound("ammo_pickup")
                ply:Give("cw_smoke_grenade")
                ply:GiveAmmo(3, "Smoke Grenades", true)

                timer.Simple(6, function()
                    PrintMessage(HUD_PRINTCENTER, "Laden erfolgreich! ")
                    ply:Freeze(false)

                    timer.Simple(6.15, function()
                        PrintMessage(HUD_PRINTCENTER, "Du erhielst die Ausrüstung zum Infanteristen!")
                    end)
                end)
            end)
        end)

        return ""
    end
end)

hook.Add("PlayerSay", "eod spezialist", function(ply, text)
    if string.lower(text) == "!eod spezialist" then
        PrintMessage(HUD_PRINTCENTER, "Rüstet aus. ")
        ply:Freeze(true)

        timer.Simple(0.1, function()
            ply:StripWeapons()
            ply:Say("/job EOD Spezialist")
            ply:SetModel("models/mark2580/payday2/pd2_bulldozer_player.mdl")
            ply:SetMaxHealth(300)
            ply:SetJumpPower( 0 )

            ply:SetTeam(1)

            if ply:Health() < ply:GetMaxHealth() then
                ply:SetHealth(ply:Health() + 200)
            end

            timer.Simple(1, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus.. ")
                ply:EmitSound("ammo_pickup")
                ply:Give("cw_g4p_ump45")
                ply:Give("keys")
            end)

            timer.Simple(2, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus... ")
                ply:EmitSound("ammo_pickup")
                ply:EmitSound("ammo_pickup")
                ply:GiveAmmo(125, ".45 ACP", true)
            end)

            timer.Simple(3, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus. ")
                ply:EmitSound("ammo_pickup")
                ply:EmitSound("ammo_pickup")
                ply:SetAmmo(250, ".45 ACP", true)
            end)

            timer.Simple(4, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus.. ")
                ply:EmitSound("ammo_pickup")
                ply:Give("weapon_slam")
                ply:GiveAmmo(5, "weapon_slam ammo", true)
                ply:SetWalkSpeed(150)
                ply:SetRunSpeed(240)
            end)

            timer.Simple(5, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus... ")
                ply:EmitSound("ammo_pickup")
                ply:Give("seal6-claymore")
            end)

            timer.Simple(7, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus. ")
                ply:EmitSound("ammo_pickup")
                ply:Give("usm_c4")
            end)

            timer.Simple(8, function()
                PrintMessage(HUD_PRINTCENTER, "Rüstet aus.. ")
                ply:EmitSound("ammo_pickup")
            end)

            timer.Simple(9, function()
                PrintMessage(HUD_PRINTCENTER, "Laden erfolgreich! ")
                ply:Freeze(false)

                timer.Simple(9.15, function()
                    PrintMessage(HUD_PRINTCENTER, "Du erhielst die Ausrüstung zum EOD Spezialisten!")
                end)
            end)
        end)

        return ""
    end
end)