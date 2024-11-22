local JupaHelperFrame = CreateFrame("Frame")

-- Constants for gossip options
local GOSSIP_OPTIONS = {
	46036, -- A Luckydo
	42026, -- Acherus
	46166, -- Aedelas Blackmoore
	46139, -- Alexandros
	45705, -- Aliden
	41674, -- Archdruid
	46108, -- Archmage Antonidas
	111295, -- Argus
	45699, -- Argus Wake
	46206, -- Auberdine
	46073, -- Azshara
	41523, -- Belan shi
	46088, -- Benedictus
	111284, -- Blackrock
	46019, -- Blood Elves
	41711, -- Blue dragonflight
	46134, -- Bolvar Fordragon
	46194, -- Broxigar
	42088, -- Calissa Harrington
	41683, -- Cenarion Circle
	41716, -- Coilfang Reservoir
	46155, -- Copeland
	42169, -- Defective elekk turd
	46094, -- Devilsaur
	45695, -- Devoted Ones
	46225, -- Dioniss aca
	42157, -- Draka's Fury
	41660, -- Frostwolf clan
	111308, -- Fruit of the Arcan'dor
	46185, -- Fruit Vendor
	41676, -- Gelbin Mekkatorque
	41528, -- Giles
	46063, -- Harpy
	46130, -- Hillsbrad Foothills
	42210, -- Holia Sunshield
	45687, -- Jiang
	111287, -- Kairozdormu
	42185, -- K'aresh
	111355, -- Khan
	42176, -- King Terenas Menethil II
	111302, -- Lion's Rest
	46192, -- Liu Lang
	46229, -- Loque'nahak
	41706, -- Mag'har
	111311, -- Magni Bronzebeard
	46146, -- Magtheridon
	46085, -- Maiev Shadowsong
	111346, -- Majordomo Selistra
	46148, -- Majordomo Staghelm
	111351, -- Malygos
	42156, -- Mirador
	42220, -- Mord'rethar
	41544, -- Mueh'zala
	41686, -- Mur'ghouls
	46026, -- Nefarian
	46168, -- Ner'zhul
	42098, -- Nobundo
	42020, -- Nordrassil
	42162, -- Norgannon
	111336, -- Pelagos
	46214, -- Piccolo of the Flaming Fire
	111290, -- Prophet Velen
	42086, -- Queen Mia Greymane
	46004, -- Quillboar
	42192, -- Red pox
	46219, -- Right eye; left arm
	111330, -- Ritual of absolution
	111340, -- Rogue
	41539, -- Sayaad
	46017, -- Sha
	41546, -- Sharp claw
	111300, -- Silithus
	42032, -- Sky'ree
	42025, -- Tainted grain
	41532, -- Talak
	46069, -- Tanaris
	46202, -- Taretha Foxton
	41536, -- Tatai
	42099, -- Tenebron, Vesperon, and Shadron
	42091, -- Teron Gorefiend
	46106, -- The Barrens
	111278, -- The blood of Mannoroth
	111323, -- The Fourth War
	111327, -- The Helm of Domination
	46031, -- the righteous one!
	42184, -- Tiffin Ellerlan Wrynn
	42214, -- Toothgnasher
	46237, -- Tyranastrasz
	46010, -- Vashj
	46159, -- Venture Company
	42166, -- Veranus
	111320, -- Vulpera
	46175, -- War of the Shifting Sands
	46001, -- Warden
	111314, -- Xal'atath
	42179, -- Xavius
	46212, -- You breathe fire
	111342, -- Ysera
}

-- NPC ID for Historian Jupa
local JUPA_NPC_ID = 110035

-- Function to get the NPC ID from gossip
local function GetGossipNPCID()
	local guid = UnitGUID("npc")
	if guid then
		local _, _, _, _, _, npcID = strsplit("-", guid)
		return tonumber(npcID)
	end
	return nil
end

-- Function to select gossip options
local function SelectGossipOptions()
	for _, optionID in ipairs(GOSSIP_OPTIONS) do
		C_GossipInfo.SelectOption(optionID)
	end
end

-- Event handler
JupaHelperFrame:RegisterEvent("GOSSIP_SHOW")
JupaHelperFrame:SetScript("OnEvent", function(_, event, ...)
	if event == "GOSSIP_SHOW" then
		local npcID = GetGossipNPCID()
		if npcID == JUPA_NPC_ID then
			SelectGossipOptions()
		end
	end
end)
