-- ============================================================================
-- METHANE DIGESTER MOD per Luanti MineClonia
-- Digestore anaerobico per produzione biogas da materiali organici
-- ============================================================================

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

-- Inizializza la tabella globale
if not methane_digester then
    methane_digester = {}
end

-- ============================================================================
-- CONFIGURAZIONE MATERIALI ORGANICI
-- ============================================================================

-- Tabella dei materiali organici con tempo decomposizione (secondi) e energia prodotta (RF)
methane_digester.organic_materials = {
    -- Verdure e Frutti
    ["mcl_farming:carrot_item"] = {decompose_time = 300, energy = 50, name = "Carota"},
    ["mcl_farming:potato_item"] = {decompose_time = 400, energy = 60, name = "Patata"},
    ["mcl_farming:beetroot_item"] = {decompose_time = 250, energy = 40, name = "Barbabietola"},
    ["mcl_farming:wheat_item"] = {decompose_time = 200, energy = 30, name = "Grano"},
    ["mcl_farming:melon_item"] = {decompose_time = 180, energy = 25, name = "Fetta di Anguria"},
    ["mcl_farming:pumpkin"] = {decompose_time = 600, energy = 100, name = "Zucca"},
    ["mcl_core:apple"] = {decompose_time = 250, energy = 45, name = "Mela"},
    
    -- Carne e Pesce
    ["mcl_mobitems:cooked_porkchop"] = {decompose_time = 800, energy = 150, name = "Braciola di Maiale"},
    ["mcl_mobitems:cooked_chicken"] = {decompose_time = 600, energy = 120, name = "Pollo Cotto"},
    ["mcl_mobitems:rotten_flesh"] = {decompose_time = 100, energy = 20, name = "Carne Marcia"},
    ["mcl_fishing:fish_cooked"] = {decompose_time = 400, energy = 80, name = "Pesce Cotto"},
    ["mcl_fishing:fish_raw"] = {decompose_time = 300, energy = 60, name = "Pesce Crudo"},
    ["mcl_fishing:salmon_cooked"] = {decompose_time = 450, energy = 90, name = "Salmone Cotto"},
    ["mcl_fishing:salmon_raw"] = {decompose_time = 350, energy = 70, name = "Salmone Crudo"},
    
    -- Fiori e Piante
    ["mcl_flowers:tallgrass"] = {decompose_time = 120, energy = 15, name = "Erba Alta"},
    ["mcl_flowers:fern"] = {decompose_time = 150, energy = 20, name = "Felce"},
    ["mcl_flowers:allium"] = {decompose_time = 200, energy = 25, name = "Allium"},
    ["mcl_flowers:oxeye_daisy"] = {decompose_time = 180, energy = 22, name = "Margherita"},
    ["mcl_flowers:peony"] = {decompose_time = 220, energy = 30, name = "Peonia"},
    ["mcl_core:vine"] = {decompose_time = 300, energy = 35, name = "Rampicante"},
    
    -- Foglie
    ["mcl_core:leaves"] = {decompose_time = 250, energy = 35, name = "Foglie di Quercia"},
    ["mcl_core:birchleaves"] = {decompose_time = 240, energy = 33, name = "Foglie di Betulla"},
    ["mcl_core:spruceleaves"] = {decompose_time = 280, energy = 38, name = "Foglie di Abete"},
    ["mcl_core:jungleleaves"] = {decompose_time = 260, energy = 36, name = "Foglie Tropicali"},
    ["mcl_core:acacialeaves"] = {decompose_time = 255, energy = 34, name = "Foglie di Acacia"},
    ["mcl_core:darkleaves"] = {decompose_time = 270, energy = 37, name = "Foglie Scure"},
    
    -- Funghi
    ["mcl_mushrooms:mushroom_brown"] = {decompose_time = 180, energy = 40, name = "Fungo Marrone"},
    ["mcl_mushrooms:mushroom_red"] = {decompose_time = 180, energy = 40, name = "Fungo Rosso"},
    
    -- Semi e Altri
    ["mcl_farming:pumpkin_seeds"] = {decompose_time = 150, energy = 20, name = "Semi di Zucca"},
    ["mcl_farming:melon_seeds"] = {decompose_time = 140, energy = 18, name = "Semi di Anguria"},
    ["mcl_farming:beetroot_seeds"] = {decompose_time = 120, energy = 15, name = "Semi di Barbabietola"},
    
    -- Pane e Cibi Cotti
    ["mcl_farming:bread"] = {decompose_time = 350, energy = 55, name = "Pane"},
    ["mcl_farming:cookie"] = {decompose_time = 200, energy = 35, name = "Biscotto"},
    ["mcl_farming:pumpkin_pie"] = {decompose_time = 400, energy = 70, name = "Torta di Zucca"},
    ["mcl_mushrooms:mushroom_stew"] = {decompose_time = 300, energy = 65, name = "Zuppa di Funghi"},
    
    -- Materiali aggiuntivi
    ["mcl_core:deadbush"] = {decompose_time = 90, energy = 12, name = "Cespuglio Secco"},
    ["mcl_core:reeds"] = {decompose_time = 160, energy = 22, name = "Canne da Zucchero"},
    ["mcl_cocoas:cocoa_beans"] = {decompose_time = 180, energy = 28, name = "Fave di Cacao"}
}

-- ============================================================================
-- FUNZIONI UTILITY
-- ============================================================================

-- Verifica se un oggetto è materiale organico
function methane_digester.is_organic_material(itemname)
    return methane_digester.organic_materials[itemname] ~= nil
end

-- Ottieni informazioni su materiale organico
function methane_digester.get_organic_info(itemname)
    return methane_digester.organic_materials[itemname]
end

-- Calcola energia totale da inventario
function methane_digester.calculate_total_energy(inventory_list)
    local total_energy = 0
    for _, itemstack in ipairs(inventory_list) do
        if not itemstack:is_empty() then
            local itemname = itemstack:get_name()
            local count = itemstack:get_count()
            local info = methane_digester.get_organic_info(itemname)
            if info then
                total_energy = total_energy + (info.energy * count)
            end
        end
    end
    return total_energy
end

-- ============================================================================
-- DEFINIZIONE NODO METHANE DIGESTER
-- ============================================================================

minetest.register_node("methane_digester:digester", {
    description = "Digestore di Metano\nConverte materiali organici in biogas",
    
    -- Forma 3D realistica del digestore
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    
    -- Design 3D di un digestore anaerobico
    node_box = {
        type = "fixed",
        fixed = {
            -- Base cilindrica principale (tank)
            {-0.4, -0.5, -0.4, 0.4, 0.2, 0.4},   -- Cilindro principale
            {-0.35, 0.2, -0.35, 0.35, 0.3, 0.35}, -- Coperchio superiore
            
            -- Cupola di gas superiore
            {-0.3, 0.3, -0.3, 0.3, 0.4, 0.3},     -- Cupola gas
            {-0.25, 0.4, -0.25, 0.25, 0.45, 0.25}, -- Punta cupola
            
            -- Tubo di ingresso (sinistra)
            {-0.5, 0.1, -0.1, -0.4, 0.2, 0.1},    -- Tubo orizzontale
            {-0.45, 0.2, -0.05, -0.42, 0.35, 0.05}, -- Tubo verticale
            
            -- Tubo di uscita gas (destra)
            {0.4, 0.25, -0.05, 0.5, 0.3, 0.05},   -- Tubo uscita
            
            -- Valvola di sicurezza (sopra)
            {-0.05, 0.45, -0.05, 0.05, 0.5, 0.05}, -- Valvola
            
            -- Supporti base
            {-0.45, -0.5, -0.1, -0.4, -0.3, 0.1}, -- Supporto sx
            {0.4, -0.5, -0.1, 0.45, -0.3, 0.1},   -- Supporto dx
            {-0.1, -0.5, -0.45, 0.1, -0.3, -0.4}, -- Supporto front
            {-0.1, -0.5, 0.4, 0.1, -0.3, 0.45},   -- Supporto back
            
            -- Pannello di controllo (fronte)
            {-0.2, -0.1, -0.45, 0.2, 0.15, -0.4}, -- Pannello
            {-0.05, 0.0, -0.46, 0.05, 0.05, -0.39}, -- Display
        }
    },
    
    selection_box = {
        type = "fixed",
        fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
    },
    
    tiles = {
        "methane_digester_top.png",      -- Top
        "methane_digester_bottom.png",   -- Bottom  
        "methane_digester_side.png",     -- Sides
        "methane_digester_side.png",
        "methane_digester_back.png",     -- Back
        "methane_digester_front.png"     -- Front (con pannello controllo)
    },
    
    groups = {cracky = 2, oddly_breakable_by_hand = 1},
    sounds = mcl_sounds and mcl_sounds.node_sound_metal_defaults() or {},
    
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()
        
        -- Setup inventario
        inv:set_size("input", 9)      -- 3x3 slot per materiali organici
        inv:set_size("biogas", 1)     -- 1 slot per biogas accumulato
        inv:set_size("bottles", 4)    -- 4 slot per bottiglie vuote/piene
        
        -- Inizializza dati
        meta:set_int("biogas_stored", 0)           -- Biogas accumulato (RF)
        meta:set_int("decompose_progress", 0)      -- Progresso decomposizione
        meta:set_int("total_decompose_time", 0)    -- Tempo totale necessario
        meta:set_string("current_material", "")    -- Materiale in decomposizione
        meta:set_int("material_count", 0)          -- Quantità materiale
        
        -- Setup formspec iniziale
        methane_digester.update_formspec(pos)
        
        meta:set_string("infotext", "Digestore di Metano (Inattivo)")
        minetest.log("action", "[Methane Digester] Digestore costruito a " .. minetest.pos_to_string(pos))
    end,
    
    on_destruct = function(pos)
        minetest.log("action", "[Methane Digester] Digestore rimosso da " .. minetest.pos_to_string(pos))
    end,
    
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if not clicker then return end
        methane_digester.update_formspec(pos)
    end,
    
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
        if listname == "input" then
            -- Solo materiali organici nell'input
            if methane_digester.is_organic_material(stack:get_name()) then
                return stack:get_count()
            end
            return 0
        elseif listname == "bottles" then
            -- Solo bottiglie vuote/piene nei bottles
            local itemname = stack:get_name()
            if itemname == "mcl_potions:glass_bottle" or itemname == "methane_digester:biogas_bottle" then
                return stack:get_count()
            end
            return 0
        end
        return 0 -- biogas slot è solo output
    end,
    
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
        return stack:get_count()
    end,
    
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
        if listname == "input" then
            methane_digester.update_formspec(pos)
            methane_digester.start_decomposition(pos)
        end
    end,
    
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        methane_digester.update_formspec(pos)
    end
})

-- ============================================================================
-- SISTEMA DI DECOMPOSIZIONE
-- ============================================================================

-- Avvia processo di decomposizione
function methane_digester.start_decomposition(pos)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    
    -- Se già in decomposizione, non fare nulla
    if meta:get_int("decompose_progress") > 0 then
        return
    end
    
    -- Trova il primo materiale organico
    local input_list = inv:get_list("input")
    for i, itemstack in ipairs(input_list) do
        if not itemstack:is_empty() then
            local itemname = itemstack:get_name()
            local info = methane_digester.get_organic_info(itemname)
            if info then
                -- Inizia decomposizione
                meta:set_string("current_material", itemname)
                meta:set_int("material_count", 1)
                meta:set_int("total_decompose_time", info.decompose_time)
                meta:set_int("decompose_progress", 1)
                
                -- Rimuovi un item dall'inventario
                itemstack:take_item(1)
                inv:set_stack("input", i, itemstack)
                
                meta:set_string("infotext", 
                    string.format("🍃 (Decomponendo: %s)", info.name))
                
                minetest.log("action", "[Methane Digester] Iniziata decomposizione " .. 
                    info.name .. " a " .. minetest.pos_to_string(pos))
                break
            end
        end
    end
end

-- Continua processo di decomposizione
function methane_digester.continue_decomposition(pos)
    local meta = minetest.get_meta(pos)
    
    local progress = meta:get_int("decompose_progress")
    local total_time = meta:get_int("total_decompose_time")
    local current_material = meta:get_string("current_material")
    
    if progress <= 0 or progress >= total_time or current_material == "" then
        return false
    end
    
    -- Incrementa progresso
    progress = progress + 1
    meta:set_int("decompose_progress", progress)
    
    local info = methane_digester.get_organic_info(current_material)
    if info then
        local percentage = math.floor((progress / total_time) * 100)
        meta:set_string("infotext", 
            string.format("🍃 (Decomponendo: %s %d%%)", info.name, percentage))
    end
    
    -- Verifica se completato
    if progress >= total_time then
        methane_digester.complete_decomposition(pos)
    end
    
    return true
end

-- Completa decomposizione e produce biogas
function methane_digester.complete_decomposition(pos)
    local meta = minetest.get_meta(pos)
    local current_material = meta:get_string("current_material")
    
    local info = methane_digester.get_organic_info(current_material)
    if info then
        -- Aggiungi energia prodotta
        local current_biogas = meta:get_int("biogas_stored")
        local new_biogas = current_biogas + info.energy
        meta:set_int("biogas_stored", new_biogas)
        
        minetest.log("action", string.format("[Methane Digester] %s decomposto a %s. Energia: +%d RF (Totale: %d RF)", 
            info.name, minetest.pos_to_string(pos), info.energy, new_biogas))
    end
    
    -- Reset stato decomposizione
    meta:set_int("decompose_progress", 0)
    meta:set_int("total_decompose_time", 0)
    meta:set_string("current_material", "")
    meta:set_int("material_count", 0)
    
    -- Aggiorna display
    local biogas_stored = meta:get_int("biogas_stored")
    meta:set_string("infotext", 
        string.format("Digestore di Metano (%d RF biogas)", biogas_stored))
    
    -- Cerca nuovo materiale da decomporre
    methane_digester.start_decomposition(pos)
    
    -- Aggiorna formspec
    methane_digester.update_formspec(pos)
    
    -- Alimenta fornaci adiacenti
    methane_digester.power_adjacent_furnaces(pos)
end

-- ============================================================================
-- FORMSPEC (GUI) 
-- ============================================================================

function methane_digester.update_formspec(pos)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    
    local biogas_stored = meta:get_int("biogas_stored")
    local progress = meta:get_int("decompose_progress")
    local total_time = meta:get_int("total_decompose_time")
    local current_material = meta:get_string("current_material")
    
    -- Calcola energia potenziale dai materiali in input
    local input_list = inv:get_list("input")
    local potential_energy = methane_digester.calculate_total_energy(input_list)
    
    -- Calcola progresso percentuale
    local progress_bar = ""
    local progress_percent = 0
    if total_time > 0 and progress > 0 then
        progress_percent = math.floor((progress / total_time) * 100)
        local bar_length = math.floor((progress / total_time) * 20)
        progress_bar = string.rep("█", bar_length) .. string.rep("░", 20 - bar_length)
    else
        progress_bar = string.rep("░", 20)
    end
    
    -- Informazioni materiale corrente
    local material_info = ""
    if current_material ~= "" then
        local info = methane_digester.get_organic_info(current_material)
        if info then
            material_info = string.format("Decomponendo: %s (%d%%)", info.name, progress_percent)
        end
    else
        material_info = "Standby..."
    end
    
    local formspec = {
        "formspec_version[6]",
        "size[12,10]",
        
        -- Titolo
        "label[0.5,0.5;🧫 Digestore di Metano]",
        
        -- Sezione Input Materiali
        "label[0.5,1.2;📥 Materiali:]",
        "list[context;input;0.5,1.5;3,3;]",
        
        -- Info energia potenziale
        string.format("label[0.5,4.8;⚡ Stima: %d RF]", potential_energy),
        
        -- Sezione Decomposizione
        "label[4.5,1.2;🔄 Decomposizione:]",
        string.format("label[4.5,1.5;%s]", material_info),
        string.format("label[4.5,2.0;🍃: [%s] %d%%]", progress_bar, progress_percent),
        
        -- Sezione Biogas
        "label[4.5,3.0;⚡ ACCUMULO:]",
        string.format("label[4.5,3.3;%d RF ]", biogas_stored),
        
        -- Sezione Bottling
        "label[9,1.2;🍶 Sistema Imbottigliamento:]",
        "label[9,1.5;Bottiglie Vuote:]",
        "list[context;bottles;9,1.8;2,2;]",
        "button[9,4.0;2,0.8;bottle_gas;Imbottiglia Gas]",
        
        -- Inventario giocatore
        "label[0.5,5.5;🎒 Inventario:]",
        "list[current_player;main;0.5,6;9,3;9]",
        "list[current_player;main;0.5,9.2;9,1;0]",
        
        -- Informazioni sistema
        "label[0.5,5.0;📊 Stato Sistema:]",
        string.format("label[0.5,5.2;Alimentazione Fornaci: %s]", 
            biogas_stored > 0 and "🟢 ATTIVA" or "🔴 INATTIVA"),
    }
    
    meta:set_string("formspec", table.concat(formspec))
end

-- ============================================================================
-- SISTEMA ALIMENTAZIONE FORNACI ADIACENTI
-- ============================================================================

function methane_digester.power_adjacent_furnaces(pos)
    local meta = minetest.get_meta(pos)
    local biogas_stored = meta:get_int("biogas_stored")
    
    if biogas_stored <= 0 then
        return
    end
    
    local adjacent_positions = {
        {x = pos.x + 1, y = pos.y, z = pos.z},
        {x = pos.x - 1, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y + 1, z = pos.z},
        {x = pos.x, y = pos.y - 1, z = pos.z},
        {x = pos.x, y = pos.y, z = pos.z + 1},
        {x = pos.x, y = pos.y, z = pos.z - 1}
    }
    
    local fuel_per_operation = 40 -- RF necessari per 1 operazione fornace
    local powered_furnaces = 0
    
    for _, adj_pos in ipairs(adjacent_positions) do
        local node = minetest.get_node(adj_pos)
        local is_furnace = false
        
        -- Verifica se è una fornace, forno fusorio o affumicatore
        if node.name == "mcl_furnaces:furnace" or 
           node.name == "mcl_blast_furnace:blast_furnace" or
           node.name == "mcl_smoker:smoker" then
            is_furnace = true
        end
        
        if is_furnace and biogas_stored >= fuel_per_operation then
            local furnace_meta = minetest.get_meta(adj_pos)
            local furnace_inv = furnace_meta:get_inventory()
            
            -- Verifica se la fornace ha qualcosa da cuocere
            local src_list = furnace_inv:get_list("src")
            if src_list and not src_list[1]:is_empty() then
                -- Aggiungi "combustibile virtuale" alla fornace
                local fuel_list = furnace_inv:get_list("fuel")
                if fuel_list then
                    -- Crea uno stack di carbone virtuale per alimentare la fornace
                    local virtual_fuel = ItemStack("mcl_core:coal_lump 1")
                    
                    -- Se c'è spazio nel fuel slot, aggiungi combustibile
                    if fuel_list[1]:is_empty() or 
                       (fuel_list[1]:get_name() == "mcl_core:coal_lump" and 
                        fuel_list[1]:get_count() < fuel_list[1]:get_stack_max()) then
                        
                        if fuel_list[1]:is_empty() then
                            furnace_inv:set_stack("fuel", 1, virtual_fuel)
                        else
                            fuel_list[1]:add_item(virtual_fuel)
                            furnace_inv:set_stack("fuel", 1, fuel_list[1])
                        end
                        
                        -- Consuma biogas
                        biogas_stored = biogas_stored - fuel_per_operation
                        powered_furnaces = powered_furnaces + 1
                        
                        minetest.log("action", string.format("[Methane Digester] Alimentazione %s. Biogas: -%d RF", 
                            minetest.pos_to_string(adj_pos), fuel_per_operation))
                    end
                end
            end
        end
    end
    
    -- Aggiorna biogas stored
    meta:set_int("biogas_stored", biogas_stored)
    
    if powered_furnaces > 0 then
        meta:set_string("infotext", 
            string.format("🍃 (%d RF, connesso %d fornaci)", 
                biogas_stored, powered_furnaces))
        methane_digester.update_formspec(pos)
    end
end

-- ============================================================================
-- SISTEMA IMBOTTIGLIAMENTO BIOGAS
-- ============================================================================

-- Gestione click bottone imbottigliamento
minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname ~= "" then return end
    
    if fields.bottle_gas then
        local player_name = player:get_player_name()
        local pos = methane_digester.get_digester_near_player(player)
        
        if pos then
            methane_digester.bottle_biogas(pos, player_name)
        end
    end
end)

-- Trova digestore vicino al giocatore
function methane_digester.get_digester_near_player(player)
    local player_pos = player:get_pos()
    if not player_pos then return nil end
    
    -- Cerca digestori in un raggio di 10 blocchi
    local radius = 10
    local digesters = minetest.find_nodes_in_area(
        {x = player_pos.x - radius, y = player_pos.y - radius, z = player_pos.z - radius},
        {x = player_pos.x + radius, y = player_pos.y + radius, z = player_pos.z + radius},
        {"methane_digester:digester"}
    )
    
    -- Ritorna il più vicino
    if #digesters > 0 then
        return digesters[1]
    end
    
    return nil
end

-- Imbottiglia biogas
function methane_digester.bottle_biogas(pos, player_name)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    local biogas_stored = meta:get_int("biogas_stored")
    
    local biogas_per_bottle = 1000 -- RF per bottiglia
    
    if biogas_stored < biogas_per_bottle then
        minetest.chat_send_player(player_name, "❌ Biogas insufficiente! Necessari " .. biogas_per_bottle .. " RF")
        return
    end
    
    -- Cerca bottiglie vuote
    local bottles_list = inv:get_list("bottles")
    local empty_bottle_found = false
    local empty_bottle_index = 0
    
    for i, itemstack in ipairs(bottles_list) do
        if itemstack:get_name() == "mcl_potions:glass_bottle" then
            empty_bottle_found = true
            empty_bottle_index = i
            break
        end
    end
    
    if not empty_bottle_found then
        minetest.chat_send_player(player_name, "❌ Nessuna bottiglia vuota disponibile!")
        return
    end
    
    -- Cerca spazio per bottiglia piena
    local space_for_full = false
    local full_bottle_index = 0
    
    for i, itemstack in ipairs(bottles_list) do
        if itemstack:is_empty() or 
           (itemstack:get_name() == "methane_digester:biogas_bottle" and 
            itemstack:get_count() < itemstack:get_stack_max()) then
            space_for_full = true
            full_bottle_index = i
            break
        end
    end
    
    if not space_for_full then
        minetest.chat_send_player(player_name, "❌ Nessuno spazio per bottiglie piene!")
        return
    end
    
    -- Esegui imbottigliamento
    local empty_bottle = bottles_list[empty_bottle_index]
    empty_bottle:take_item(1)
    inv:set_stack("bottles", empty_bottle_index, empty_bottle)
    
    local full_bottle = bottles_list[full_bottle_index]
    if full_bottle:is_empty() then
        inv:set_stack("bottles", full_bottle_index, ItemStack("methane_digester:biogas_bottle 1"))
    else
        full_bottle:add_item(ItemStack("methane_digester:biogas_bottle 1"))
        inv:set_stack("bottles", full_bottle_index, full_bottle)
    end
    
    -- Consuma biogas
    biogas_stored = biogas_stored - biogas_per_bottle
    meta:set_int("biogas_stored", biogas_stored)
    
    minetest.chat_send_player(player_name, 
        string.format("✅ Biogas imbottigliato! -%d RF (Rimanenti: %d RF)", 
            biogas_per_bottle, biogas_stored))
    
    minetest.log("action", string.format("[Methane Digester] %s ha imbottigliato biogas a %s", 
        player_name, minetest.pos_to_string(pos)))
    
    methane_digester.update_formspec(pos)
end

-- ============================================================================
-- BOTTIGLIA DI BIOGAS
-- ============================================================================

minetest.register_craftitem("methane_digester:biogas_bottle", {
    description = "Bottiglia di Biogas\n100 RF di energia\nCombustibile per fornaci",
    inventory_image = "biogas_bottle.png",
    groups = {fuel = 1}
})

-- Registra come combustibile
minetest.register_craft({
    type = "fuel",
    recipe = "methane_digester:biogas_bottle",
    burntime = 20, -- Equivalente a 1.33 carbone
    replacements = {{"methane_digester:biogas_bottle", "mcl_potions:glass_bottle"}}
})

-- ============================================================================
-- TIMER GLOBALE SISTEMA
-- ============================================================================

local timer = 0
minetest.register_globalstep(function(dtime)
    timer = timer + dtime
    
    if timer >= 1.0 then -- Ogni secondo
        timer = 0
        
        -- Trova tutti i digestori attivi
        for _, player in ipairs(minetest.get_connected_players()) do
            local player_pos = player:get_pos()
            if player_pos then
                local digesters = minetest.find_nodes_in_area(
                    {x = player_pos.x - 50, y = player_pos.y - 50, z = player_pos.z - 50},
                    {x = player_pos.x + 50, y = player_pos.y + 50, z = player_pos.z + 50},
                    {"methane_digester:digester"}
                )
                
                for _, pos in ipairs(digesters) do
                    methane_digester.continue_decomposition(pos)
                    
                    -- Alimenta fornaci periodicamente
                    if timer % 5 == 0 then -- Ogni 5 secondi
                        methane_digester.power_adjacent_furnaces(pos)
                    end
                end
            end
        end
    end
end)

-- ============================================================================
-- RICETTE DI CRAFTING
-- ============================================================================

-- Ricetta per il digestore
minetest.register_craft({
    output = "methane_digester:digester",
    recipe = {
        {"mcl_core:iron_ingot", "mcl_core:glass", "mcl_core:iron_ingot"},
        {"mcl_core:iron_ingot", "mcl_cauldrons:cauldron", "mcl_core:iron_ingot"},
        {"mcl_core:cobble", "mcl_core:redstone", "mcl_core:cobble"}
    }
})

-- ============================================================================
-- LOG INIZIALIZZAZIONE
-- ============================================================================

minetest.log("action", "[Methane Digester] Mod inizializzata correttamente")
minetest.log("action", "[Methane Digester] Materiali organici supportati: " .. 
    table.getn(methane_digester.organic_materials))
minetest.log("action", "[Methane Digester] Sistema alimentazione fornaci attivo")
minetest.log("action", "[Methane Digester] Sistema imbottigliamento biogas attivo")
