-- Author      : Matthew DeSantis

local f = CreateFrame("Frame", "ClassicICantCast", UIParent)

local function CheckCastError(self, event, arg1, arg2, ...)
	if event == "UI_ERROR_MESSAGE" then
		if arg1 == 50 then
			if arg2 == SPELL_FAILED_NOT_STANDING then
				DoEmote("STAND")
			elseif arg2 == SPELL_FAILED_NOT_MOUNTED then
				Dismount()
			elseif arg2 == SPELL_FAILED_NOT_SHAPESHIFT then
				CancelShapeshiftForm()
			end
		elseif arg1 == 159 and arg2 == ERR_LOOT_NOTSTANDING then
			DoEmote("STAND")
		elseif arg1 == 198 and arg2 == ERR_ATTACK_MOUNTED then
			Dismount()
		elseif arg1 == 213 and arg2 == ERR_TAXIPLAYERALREADYMOUNTED then
			Dismount()
		elseif arg1 == 416 and arg2 == ERR_CANT_INTERACT_SHAPESHIFTED then
			CancelShapeshiftForm()
		elseif arg1 == 504 and arg2 == ERR_NOT_WHILE_MOUNTED then
			Dismount()
		elseif arg1 == 505 and  ERR_NOT_WHILE_SHAPESHIFTED then
			CancelShapeshiftForm()
		end
	elseif event == "TAXIMAP_OPENED" then
		Dismount()
	end
end

f:Hide()

f:RegisterEvent("UI_ERROR_MESSAGE")
f:RegisterEvent("TAXIMAP_OPENED")
f:SetScript("OnEvent", CheckCastError)