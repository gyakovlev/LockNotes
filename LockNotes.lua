--[[

LockNotes by affli @ RU-Howling Fjord
All rights reserved.
Thanks Veev-Medivh for original LockNotes, 90% of your core still works) thanks Urgess for some code and ideas.
Big thanks to mihima for spellid ideas.
]]--

local band=bit.band
local function LockNotes_OnEvent(self,event,...)

local timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName = select(1,...)
------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------- Friendly Buffs -------------------------------------------------------------
if (eventType == "SPELL_CAST_SUCCESS") then
	if band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (spellId == 1022) --Hand of Protection
		or (spellId == 1044) -- Hand Of Freedom
		or (spellId == 1038) --Hand of Salvation
		or (spellID == 10060) --Power Infusion
		then
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

------------------------------------------------------------- Procs -------------------------------------------------------------
if (eventType == "SPELL_AURA_APPLIED") then
	if band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (spellId == 64371) --Eradication
		or (spellId == 71165) --Molten Core
		or (spellId == 63167) --Decimation
		or (spellId == 85114) --Improved Soul Fire
		then
			SpellName = spellName
			ZoneTextString:SetText(""..SpellName.." up!");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 2
			ZoneTextFrame.fadeOutTime = 2
				if (spellId == 64371) then
					ZoneTextString:SetTextColor(0, 1, 0);
				else
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
		or (spellId == 642)   --Bubble
		or (spellId == 47585) --Dispersion
		or (spellId == 23920) --Spell Reflection
		or (spellId == 48707) --Anti-Magic Shell
		or (spellId == 45438) --Ice Block
		or (spellId == 49039) --Lichborne
		or (spellId == 18499) --Berserker Rage
		or (spellId == 59672) --Metamorphosis
		or (spellId == 31687) --Summon Water Elemental
		or (spellId == 34692) --The Beast Within
		or (spellId == 6346)  --Fear Ward
		or (spellId == 19263) --Deterrence
		or (spellId == 33206) --Pain Suppression
		or (spellId == 48505) --Starfall
		or (spellId == 871)   --Shield Wall
--		or (spellId == 48066) --Old Power Word: Shield
--		or (spellId == 47891) --Old Shadow Ward?
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
		or (spellId == 642)   --Bubble
		or (spellId == 47585) --Dispersion
		or (spellId == 23920) --Spell Reflection
		or (spellId == 48707) --Anti-Magic Shell
		or (spellId == 45438) --Ice Block
		or (spellId == 49039) --Lichborne
		or (spellId == 12292) --Death Wish
		or (spellId == 18499) --Berserker Rage
		or (spellId == 59672) --Metamorphosis
		or (spellId == 31687) --Summon Water Elemental
		or (spellId == 34692) --The Beast Within
		or (spellId == 6346)  --Fear Ward
		or (spellId == 19263) --Deterrence
--		or (spellId == 48066) --Old Power Word: Shield
--		or (spellId == 47891) --Old Shadow Ward?
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

if (eventType == "SPELL_AURA_REMOVED") then
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


------------------------------------------------------------- Armor check ----------------------------------------------------------------------
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
		if (spellId == 6789)  --Death Coil
		or (spellId == 5138)  --Drain Mana
		or (spellId == 89420) --Drain Life
		or (spellId == 172)   --Corruption
		or (spellId == 980)   --Bane of Agony
		or (spellId == 603)   --Bane of Doom
		or (spellId == 1714)  --Curse of Tongues
		or (spellId == 5782)  --Fear
		or (spellId == 348)   --Immolate
--		or (spellId == 50511) --Old Shadow Embrace? o_O
--		or (spellId == 47862) --Old Siphon Life?
		or (spellId == 30108) --Unstable Affliction
		or (spellId == 18223) --Curse of Exhaustion
		or (spellId == 1490)  --Curse of the Elements
		or (spellId == 702)   --Curse of Weakness
		or (spellId == 710)   --Banish
		or (spellId == 19647) --Spell Lock
		or (spellId == 6358)  --Seduction
		or (spellId == 89766) --Axe Toss
		then
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
				ResistMethod = "missed"
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


