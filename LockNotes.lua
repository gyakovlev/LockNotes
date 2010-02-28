function LockNotes_OnLoad()
	this:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
	WarlockArmorActive = true;
	MySpellReflected = false;
end

function LockNotes_OnEvent(event)


------------------------------------------------------------- Friendly Buffs -------------------------------------------------------------
--Hand of Protection or Hand Of Freedom
if (arg2 == "SPELL_CAST_SUCCESS") then
	if bit.band(arg8, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (arg9 == 10278) or (arg9 == 1044) then
			SpellName = arg10
			ZoneTextString:SetText(""..SpellName.." up.");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			ZoneTextString:SetTextColor(0, 1, 0);
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\cling.wav");
		end
	end
end



--Eradication, Molten Core, Decimation
if (arg2 == "SPELL_AURA_APPLIED") then
	if bit.band(arg8, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (arg9 == 64371) or (arg9 == 71165) or (arg9 == 63167) then
			SpellName = arg10
			ZoneTextString:SetText(""..SpellName.." up!");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 2
			ZoneTextFrame.fadeOutTime = 2
				if (arg9 == 64371) then
					ZoneTextString:SetTextColor(0, 1, 0);
				end
				if (arg9 == 71165) then
					ZoneTextString:SetTextColor(1, 0.5, 0);
				end
				if (arg9 == 63167) then
					ZoneTextString:SetTextColor(1, 0.5, 0);
				end
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\bell.wav");
		end
	end
end



--[[Awaits combat log to be fixed
-- Shadow Trance or BackSlash
if (arg2 == "SPELL_AURA_APPLIED") then
	if bit.band(arg8, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (arg9 == 17941) or (arg9 == 34936) then
			ZoneTextString:SetText("Shadow Bolt!");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			if (arg9 == 17941) then
				ZoneTextString:SetTextColor(1, 0, 1);
			end
			if (arg9 == 34936) then
				ZoneTextString:SetTextColor(1, 0.5, 0);
			end
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\ding.wav");
		end
	end
end
]]
------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------- Hostile Spells -------------------------------------------------------------
if (arg2 == "SPELL_CAST_SUCCESS") then
	if bit.band(arg5, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then -- Makes sure it's an enemy player
		if (arg9 == 31224) or (arg9 == 642) or (arg9 == 47891) or (arg9 == 47585) or (arg9 == 23920) or (arg9 == 48707) or (arg9 == 45438) or (arg9 == 49039) or (arg9 == 12292) or (arg9 == 18499) or (arg9 == 59672) or (arg9 == 31687) or (arg9 == 48066) or (arg9 == 34692) or (arg9 == 6346) or (arg9 == 19263) then -- Make sure Shadow Ward and Nether prot use this same event?
			SpellName = arg10
			ZoneTextString:SetText(""..SpellName.." up!");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			ZoneTextString:SetTextColor(1, 0, 0);
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\pulse.wav");
			if (arg9 == 23920) then
				MySpellReflected = false;
			end
		end
	end
end

if (arg2 == "SPELL_AURA_REMOVED") then
	if bit.band(arg8, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then
		if (arg9 == 31224) or (arg9 == 642) or (arg9 == 47891) or (arg9 == 47585) or (arg9 == 23920) or (arg9 == 48707) or (arg9 == 45438) or (arg9 == 49039) or (arg9 == 12292) or (arg9 == 18499) or (arg9 == 59672) or (arg9 == 31687) or (arg9 == 48066) or (arg9 == 34692) or (arg9 == 6346) then
			SpellName = arg10
			ZoneTextString:SetText(""..SpellName.." down.");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			ZoneTextString:SetTextColor(0, 1, 0);
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
		end
	end
end

if (arg2 == "SPELL_AURA_REMOVED") then -- apply same filtering on reflecting for Shadow Ward, and for /deflect?
	if bit.band(arg8, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then
		if (arg9 == 23920) then
			if (not MySpellReflected) then
				SpellName = arg10
				ZoneTextString:SetText(""..SpellName.." down.");
				ZoneTextFrame.startTime = GetTime()
				ZoneTextFrame.fadeInTime = 0
				ZoneTextFrame.holdTime = 1
				ZoneTextFrame.fadeOutTime = 2
				ZoneTextString:SetTextColor(0, 1, 0);
				PVPInfoTextString:SetText("");
				ZoneTextFrame:Show()
			end
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------- Other ----------------------------------------------------------------------
if (arg2 == "SPELL_AURA_DISPELLED") or (arg2 == "SPELL_AURA_STOLEN") then
	if bit.band(arg8, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then -- Makes sure it's my buff only
		if (arg12 == 47893) or (arg12 == 47889) then
			SpellName = arg13
			ZoneTextString:SetText(""..SpellName.." removed.");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			ZoneTextString:SetTextColor(1, 0, 0);
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\buzz.wav");
			WarlockArmorActive = false;
		end
	end
end

if (arg2 == "SPELL_AURA_REMOVED") then
	if bit.band(arg8, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then -- Makes sure it's my buff only
		if (arg9 == 47893) or (arg9 == 47889) or (arg9 == 19028) then
			if (WarlockArmorActive) then -- makes sure buff is still active as to not spam twice when dispelled, since it shows both dispelled and removed events, but the removed event .5sec slower
				SpellName = arg10
				ZoneTextString:SetText(""..SpellName.." removed.");
				ZoneTextFrame.startTime = GetTime()
				ZoneTextFrame.fadeInTime = 0
				ZoneTextFrame.holdTime = 1
				ZoneTextFrame.fadeOutTime = 2
				ZoneTextString:SetTextColor(1, 0, 0);
				PVPInfoTextString:SetText("");
				ZoneTextFrame:Show()
				PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\buzz.wav");
				WarlockArmorActive = false;
			end
		end
	end
end

if (arg2 == "SPELL_CAST_SUCCESS") then
	if bit.band(arg5, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (arg9 == 47893) or (arg9 == 47889) then
			WarlockArmorActive = true;
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------- Resists --------------------------------------------------------------------
if (arg2 == "SPELL_MISSED") then -- need to add: evade, deflect (what is this?), check what happens when debuff is on an evading mob, dont want spam for each dot tick, even tho most evades remove all debuffs on them, not all
	if bit.band(arg5, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then -- Makes sure it's my own spell or my pet's spell
		if (arg9 == 47860) or (arg9 == 5138) or (arg9 == 47857) or (arg9 == 47813) or (arg9 == 47864) or (arg9 == 11719) or (arg9 == 6215) or (arg9 == 47811) or (arg9 == 50511) or (arg9 == 47862) or (arg9 == 47843) or (arg9 == 18223) or (arg9 == 47865) or (arg9 == 18647) or (arg9 == 19647) or (arg9 == 6358) then
			SpellName = arg10
			if (arg7 == "Grounding Totem") or (arg7 == "Тотем заземления") then
				ResistMethod = "Grounded"
			elseif (arg12 == "REFLECT") then
				ResistMethod = "reflected"
				MySpellReflected = true;
			elseif (arg12 == "IMMUNE") then
				ResistMethod = "failed"
			else
				ResistMethod = "resisted"
			end
			if (arg12 ~= "ABSORB") then
				ZoneTextString:SetText(""..SpellName.." "..ResistMethod..".");
				ZoneTextFrame.startTime = GetTime()
				ZoneTextFrame.fadeInTime = 0
				ZoneTextFrame.holdTime = 1
				ZoneTextFrame.fadeOutTime = 2
				ZoneTextString:SetTextColor(1, 1, 1);
				PVPInfoTextString:SetText("");
				ZoneTextFrame:Show()
					if (ResistMethod ~= "failed") then -- only play sound file when you need to instantly recast what you just casted
						PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\thud.wav");
					end
			end	
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------


end
