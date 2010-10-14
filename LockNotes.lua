local band=bit.band
local function LockNotes_OnEvent(self,event,...)

local timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName = select(1,...)

------------------------------------------------------------- Friendly Buffs -------------------------------------------------------------
--Hand of Protection or Hand Of Freedom or Hand of Salvation or Power Infusion
if (eventType == "SPELL_CAST_SUCCESS") then
	if band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (spellId == 1022) or (spellId == 1044) or (spellId == 1038) or (spellID == 10060) then
			SpellName = spellName
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
if (eventType == "SPELL_AURA_APPLIED") then
	if band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (spellId == 64371) or (spellId == 71165) or (spellId == 63167) then
			SpellName = spellName
			ZoneTextString:SetText(""..SpellName.." up!");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 2
			ZoneTextFrame.fadeOutTime = 2
				if (spellId == 64371) then
					ZoneTextString:SetTextColor(0, 1, 0);
				end
				if (spellId == 71165) then
					ZoneTextString:SetTextColor(1, 0.5, 0);
				end
				if (spellId == 63167) then
					ZoneTextString:SetTextColor(1, 0.5, 0);
				end
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\bell.wav");
		end
	end
end




-- Shadow Trance or BackLash
if (eventType == "SPELL_AURA_APPLIED") then
	if band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (spellId == 17941) or (spellId == 34936) then
			ZoneTextString:SetText("Shadow Bolt!");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			if (spellId == 17941) then
				ZoneTextString:SetTextColor(1, 0, 1);
			end
			if (spellId == 34936) then
				ZoneTextString:SetTextColor(1, 0.5, 0);
			end
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\ding.wav");
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------- Hostile Spells -------------------------------------------------------------
if (eventType == "SPELL_CAST_SUCCESS") then
	if band(sourceFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then -- Makes sure it's an enemy player
		if (spellId == 31224) --CloS
		or (spellId == 642) --Bubble
--		or (spellId == 47891)
		or (spellId == 47585) --Dispersion
		or (spellId == 23920) --Spell Reflection
		or (spellId == 48707) --Anti-Magic Shell
		or (spellId == 45438) --Ice Block
		or (spellId == 49039) --Lichborne
		or (spellId == 12292) --Death Wish
		or (spellId == 18499) --Berserker Rage
		or (spellId == 59672) --Metamorphosis
		or (spellId == 31687) --Summon Water Elemental
--		or (spellId == 48066)
		or (spellId == 34692) --The Beast Within
		or (spellId == 6346)  --Fear Ward
		or (spellId == 19263) --Deterrence
		then -- Make sure Shadow Ward and Nether prot use this same event?
			SpellName = spellName
			ZoneTextString:SetText(""..SpellName.." up!");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			ZoneTextString:SetTextColor(1, 0, 0);
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\pulse.wav");
			if (spellId == 23920) then
				MySpellReflected = false;
			end
		end
	end
end

if (eventType == "SPELL_AURA_REMOVED") then
	if band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then
		if (spellId == 31224) --CloS
		or (spellId == 642) --Bubble
--		or (spellId == 47891)
		or (spellId == 47585) --Dispersion
		or (spellId == 23920) --Spell Reflection
		or (spellId == 48707) --Anti-Magic Shell
		or (spellId == 45438) --Ice Block
		or (spellId == 49039) --Lichborne
		or (spellId == 12292) --Death Wish
		or (spellId == 18499) --Berserker Rage
		or (spellId == 59672) --Metamorphosis
		or (spellId == 31687) --Summon Water Elemental
--		or (spellId == 48066)
		or (spellId == 34692) --The Beast Within
		or (spellId == 6346)  --Fear Ward
		or (spellId == 19263) --Deterrence
		then -- Make sure Shadow Ward and Nether prot use this same event?
		then
			SpellName = spellName
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

if (eventType == "SPELL_AURA_REMOVED") then -- apply same filtering on reflecting for Shadow Ward, and for /deflect?
	if band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then
		if (spellId == 23920) -- Spell Reflect
			then
			if (not MySpellReflected) then
				SpellName = spellName
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
if (eventType == "SPELL_AURA_DISPELLED") or (event == "SPELL_AURA_STOLEN") then
	if band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then -- Makes sure it's my buff only
		local arg12=select(12,...)
		if (arg12 == 28176) or (arg12 == 687) then
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

if (eventType == "SPELL_AURA_REMOVED") then
	if band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then -- Makes sure it's my buff only
		if (spellId == 28176) or (spellId == 687) then
			if (WarlockArmorActive) then -- makes sure buff is still active as to not spam twice when dispelled, since it shows both dispelled and removed events, but the removed event .5sec slower
				SpellName = spellName
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

if (eventType == "SPELL_CAST_SUCCESS") then
	if band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (spellId == 28176) or (spellId == 687) then
			WarlockArmorActive = true;
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------- Resists --------------------------------------------------------------------
if (eventType == "SPELL_MISSED") then -- need to add: evade, deflect (what is this?), check what happens when debuff is on an evading mob, dont want spam for each dot tick, even tho most evades remove all debuffs on them, not all
	if band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then -- Makes sure it's my own spell or my pet's spell
		if (spellId == 47860) or (spellId == 5138) or (spellId == 47857) or (spellId == 47813) or (spellId == 47864) or (spellId == 11719) or (spellId == 6215) or (spellId == 47811) or (spellId == 50511) or (spellId == 47862) or (spellId == 47843) or (spellId == 18223) or (spellId == 47865) or (spellId == 18647) or (spellId == 19647) or (spellId == 6358) then
			local arg12=select(12,...)
			SpellName = spellName
			if (destName == "Grounding Totem") or (destName == "Тотем заземления") then
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


local f=CreateFrame"Frame"
f:SetScript("OnEvent",LockNotes_OnEvent)


local WarlockArmorActive = true;
local MySpellReflected = false;
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

