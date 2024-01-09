
local talk = TalkAction("!spells", "!jutsu")
function talk.onSay(player, words, param)
    local text = {}
    local spells = {}
    for _, spell in ipairs(player:getInstantSpells()) do
        if spell.level ~= 0 then
            if spell.manapercent > 0 then
                spell.mana = spell.manapercent .. "%"
            end
            spells[#spells + 1] = spell
        end
    end

    table.sort(spells, function(a, b) return a.level < b.level end)

    local prevLevel = -1
    for i, spell in ipairs(spells) do
        if prevLevel ~= spell.level then
            if i == 1 then
                text[#text == nil and 1 or #text+1] = "Jutsus for Level "
            else
                text[#text+1] = "\nJutsus for Level "
            end
            text[#text+1] = spell.level .. "\n"
            prevLevel = spell.level
        end
		
		local name = spell.name
		
		if name ~= "" then
			text[#text+1] = "[+] " .. spell.name .. "\n"
		end
		
        text[#text+1] = " " .. spell.words .. " - chakra: " .. spell.mana .. "\n"
    end

    player:showTextDialog(2175, table.concat(text))
    return false
end

talk:register()