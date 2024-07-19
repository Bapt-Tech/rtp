
-- Nom du mod
local modname = minetest.get_current_modname()

-- Liste des coordonnées de téléportation possibles
local teleport_locations = {
    {x = 100, y = 64, z = 200},
    {x = -50, y = 70, z = -150},
    {x = 200, y = 65, z = -100},
    {x = -100, y = 60, z = 100},
    {x = 50, y = 75, z = 50},
}

-- Fonction de téléportation
local function teleport_to_random_location(player)
    local location = teleport_locations[math.random(1, #teleport_locations)]
    player:set_pos(location)
    minetest.chat_send_player(player:get_player_name(), "Teleported at the position " .. minetest.pos_to_string(location))
end

-- Enregistrement de la commande /rtp
minetest.register_chatcommand("rtp", {
    description = "Teleport to a random position",
    privs = {shout = true},
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if player then
            teleport_to_random_location(player)
        end
    end,
})

-- Log pour confirmer le chargement du mod
minetest.log("action", "<RTP>[" .. modname .. "] Mod charged Succesfully. NGGYU")

