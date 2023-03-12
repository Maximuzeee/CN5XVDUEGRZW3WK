Values = {}
PERMAINDEX = 0
-- WEBHOOK
function PACK_HOOK(count)
    local script = [[
        $webHookUrl = "]]..Configuration["WEBHOOK"].URL_PACK.."/messages/"..Configuration["WEBHOOK"].PACK_ID..[["
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        [System.Collections.ArrayList]$embedArray = @()
        $thumbUrl = 'https://i.ibb.co/MhWW0yf/MAXIMUZE-free-file.png'
        $thumbObject            = [PSCustomObject]@{
        url                         = $thumbUrl
        }
        $color = ']]..math.random(1111111,9999999)..[['
        $title = 'PACK INFORMATION'
        $description = '```]]..count..[[```'
        $footer = [PSCustomObject]@{ 
        text = 'Last Update : ]]..os.date( "%A, %d %B %Y [ %H:%M ]", os.time() + 7 * 60 * 60 )..[[' 
        }  

        $embedObject = [PSCustomObject]@{
            color = $color
            title = $title
            description = $description
            footer = $footer
            thumbnail   = $thumbObject
        }

        $embedArray.Add($embedObject)

        $payload = [PSCustomObject]@{
            embeds = $embedArray
        }

        Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Patch -ContentType 'application/json'
    ]]
    local pipe = io.popen("powershell -command -", "w") 
    pipe:write(script)
    pipe:close()
end
function SEED_HOOK(count)
    local script = [[
        $webHookUrl = "]]..Configuration["WEBHOOK"].URL_SEED.."/messages/"..Configuration["WEBHOOK"].SEED_ID..[["
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        [System.Collections.ArrayList]$embedArray = @()
        $thumbUrl = 'https://i.ibb.co/MhWW0yf/MAXIMUZE-free-file.png'
        $thumbObject            = [PSCustomObject]@{
            url                 = $thumbUrl
        }
        $color = ']]..math.random(1111111,9999999)..[['
        $title = 'SEED INFORMATION'
        $description = '```]]..count..[[```'
        $footer = [PSCustomObject]@{ 
        text = 'Last Update : ]]..os.date( "%A, %d %B %Y [ %H:%M ]", os.time() + 7 * 60 * 60 )..[[' 
        }  

        $embedObject = [PSCustomObject]@{
            color = $color
            title = $title
            description = $description
            footer = $footer
            thumbnail   = $thumbObject
        }

        $embedArray.Add($embedObject)| Out-Null

        $payload = [PSCustomObject]@{
            embeds = $embedArray
        }

        Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Patch -ContentType 'application/json'
    ]]
    local pipe = io.popen("powershell -command -", "w") 
    pipe:write(script)
    pipe:close()
end
-- ALL VALUES
    function nGetValues()
        SUPP_INDEXBOT()
        sleep(500)
        if PERMAINDEX == 0 then
            Values                      = {
                BOOLEAN                 = {
                    REMOVE_STATUS       = false,
                    ROTATE_STATUS       = true,
                    AUTO_BUY_BP         = BOT_1["BOT_CONFIG"].AUTO_BUY_BP,
                    USE_FOOD            = BOT_1["BOT_CONFIG"].USE_FOOD,
                    AUTO_PLANT          = BOT_1["PLANT_CONFIG"].AUTO_PLANT,
                    USE_DCS             = BOT_1["HARVEST_CONFIG"].USE_DCS,
                    HARVEST_OPTION      = BOT_1["HARVEST_CONFIG"].HARVEST_OPTION,
                    AUTO_BUY_PACK       = BOT_1["PACK_CONFIG"].AUTO_BUY_PACK
                },
                FARM_CONFIG             = {
                    TOTAL_LOOP          = BOT_1["FARM_CONFIG"].TOTAL_LOOP,
                    START_FARM          = BOT_1["FARM_CONFIG"].START_FARM,
                    FARM_WORLD_ID       = BOT_1["FARM_CONFIG"].FARM_WORLD_ID,
                    FARM_WORLD          = BOT_1["FARM_CONFIG"].FARM_WORLD,
                    LASTWORLD           = "",
                    INDEXWORLD          = 0,
                    TREE_READY          = 0,
                    TREE_UNREADY        = 0,
                    INDEX_LOOP          = 1       
                },
                BREAK_CONFIG            = {
                    BLOCK_ID            = BOT_1["BREAK_CONFIG"].BLOCK_ID,
                    DELAY_BREAK         = BOT_1["BREAK_CONFIG"].DELAY_BREAK,
                    DELAY_PUT           = BOT_1["BREAK_CONFIG"].DELAY_PUT,
                    TILE_BREAK          = BOT_1["BREAK_CONFIG"].TILE_BREAK
                },
                BOT_CONFIG              = {
                    BOTNAME             = getBot().name,
                    INDEXBOT            = PERMAINDEX,
                    PASS_BOT            = BOT_1["BOT_CONFIG"].PASS_BOT,
                    BOT_X               = BOT_1["BOT_CONFIG"].BOT_X,
                    BOT_Y               = BOT_1["BOT_CONFIG"].BOT_Y,
                    REACH_LEVEL         = BOT_1["BOT_CONFIG"].REACH_LEVEL,
                    LIMIT_BP            = BOT_1["BOT_CONFIG"].LIMIT_BP,
                    FOOD_ID             = BOT_1["BOT_CONFIG"].FOOD_ID,
                    POS_DOOR_X          = 0,
                    POS_DOOR_Y          = 0
                        
                },
                PACK_CONFIG             = {
                    BUY_PACK            = 0,
                    NAME_PACK           = BOT_1["PACK_CONFIG"].NAME_PACK,
                    MENU_PACK           = BOT_1["PACK_CONFIG"].MENU_PACK,
                    PRICE               = BOT_1["PACK_CONFIG"].PRICE,
                    SCAN_PACK_DROP      = BOT_1["PACK_CONFIG"].SCAN_PACK_DROP,
                    AP_PACK             = BOT_1["PACK_CONFIG"].AMOUNT_PACK,
                    DROP_LIMIT          = BOT_1["PACK_CONFIG"].DROP_LIMIT,
                    POS_DROP            = BOT_1["PACK_CONFIG"].POS_DROP,
                    W_DROP              = BOT_1["PACK_CONFIG"].W_DROP,
                    W_DROP_ID           = BOT_1["PACK_CONFIG"].W_DROP_ID,
                    ITEMID              = BOT_1["PACK_CONFIG"].ITEMID,
                    AMOUNT_PACK         = 0,
                    AMOUNT_PACK_CALC    = 0
                },
                SEED_CONFIG             = {
                    DROP_LIMIT          = BOT_1["SEED_CONFIG"].DROP_LIMIT,
                    W_DROP              = BOT_1["SEED_CONFIG"].W_DROP,
                    W_DROP_ID           = BOT_1["SEED_CONFIG"].W_DROP_ID,
                    POS_DROP            = BOT_1["SEED_CONFIG"].POS_DROP
                },
                HARVEST_CONFIG          = {
                    DELAY               = BOT_1["HARVEST_CONFIG"].DELAY,
                    W_TAKEBLOCK         = BOT_1["HARVEST_CONFIG"].W_TAKEBLOCK,
                    W_TAKEBLOCKID       = BOT_1["HARVEST_CONFIG"].W_TAKEBLOCKID
                },
                PLANT_CONFIG            = {
                    DELAY               = BOT_1["PLANT_CONFIG"].DELAY
                },
                TRASH_CONFIG            = {
                    LIMIT_TO_TRASH      = BOT_1["TRASH_CONFIG"].LIMIT_TO_TRASH,
                    ITEMID              = BOT_1["TRASH_CONFIG"].ITEMID
                    },
                CUSTOM_CONFIG           = {
                    DROP_LIMIT          = BOT_1["CUSTOM_CONFIG"].DROP_LIMIT,
                    W_DROP              = BOT_1["CUSTOM_CONFIG"].W_DROP,
                    W_DROP_ID           = BOT_1["CUSTOM_CONFIG"].W_DROP_ID,
                    POS_DROP            = BOT_1["CUSTOM_CONFIG"].POS_DROP,
                    ITEMID              = BOT_1["CUSTOM_CONFIG"].ITEMID
                },
                DROP_CONFIG             = {
                    SAVE_DROP_X         = 0,
                    SAVE_DROP_Y         = 0,
                    START_DROP          = 1,
                    SCAN_SEED           = 0,
                    FLOAT_BLOCK         = 0
                }
            }
            
            nSEED                       = Values["BREAK_CONFIG"].BLOCK_ID + 1
        elseif PERMAINDEX == 1 then
            Values                      = {
                BOOLEAN                 = {
                    REMOVE_STATUS       = false,
                    ROTATE_STATUS       = true,
                    AUTO_BUY_BP         = BOT_2["BOT_CONFIG"].AUTO_BUY_BP,
                    USE_FOOD            = BOT_2["BOT_CONFIG"].USE_FOOD,
                    AUTO_PLANT          = BOT_2["PLANT_CONFIG"].AUTO_PLANT,
                    USE_DCS             = BOT_2["HARVEST_CONFIG"].USE_DCS,
                    HARVEST_OPTION      = BOT_2["HARVEST_CONFIG"].HARVEST_OPTION,
                    AUTO_BUY_PACK       = BOT_2["PACK_CONFIG"].AUTO_BUY_PACK
                },
                FARM_CONFIG             = {
                    TOTAL_LOOP          = BOT_2["FARM_CONFIG"].TOTAL_LOOP,
                    START_FARM          = BOT_2["FARM_CONFIG"].START_FARM,
                    FARM_WORLD_ID       = BOT_2["FARM_CONFIG"].FARM_WORLD_ID,
                    FARM_WORLD          = BOT_2["FARM_CONFIG"].FARM_WORLD,
                    LASTWORLD           = "",
                    INDEXWORLD          = 0,
                    TREE_READY          = 0,
                    TREE_UNREADY        = 0,
                    INDEX_LOOP          = 1       
                },
                BREAK_CONFIG            = {
                    BLOCK_ID            = BOT_2["BREAK_CONFIG"].BLOCK_ID,
                    DELAY_BREAK         = BOT_2["BREAK_CONFIG"].DELAY_BREAK,
                    DELAY_PUT           = BOT_2["BREAK_CONFIG"].DELAY_PUT,
                    TILE_BREAK          = BOT_2["BREAK_CONFIG"].TILE_BREAK
                },
                BOT_CONFIG              = {
                    BOTNAME             = getBot().name,
                    INDEXBOT            = PERMAINDEX,
                    PASS_BOT            = BOT_2["BOT_CONFIG"].PASS_BOT,
                    BOT_X               = BOT_2["BOT_CONFIG"].BOT_X,
                    BOT_Y               = BOT_2["BOT_CONFIG"].BOT_Y,
                    REACH_LEVEL         = BOT_2["BOT_CONFIG"].REACH_LEVEL,
                    LIMIT_BP            = BOT_2["BOT_CONFIG"].LIMIT_BP,
                    FOOD_ID             = BOT_2["BOT_CONFIG"].FOOD_ID,
                    POS_DOOR_X          = 0,
                    POS_DOOR_Y          = 0
                        
                },
                PACK_CONFIG             = {
                    BUY_PACK            = 0,
                    NAME_PACK           = BOT_2["PACK_CONFIG"].NAME_PACK,
                    MENU_PACK           = BOT_2["PACK_CONFIG"].MENU_PACK,
                    PRICE               = BOT_2["PACK_CONFIG"].PRICE,
                    SCAN_PACK_DROP      = BOT_2["PACK_CONFIG"].SCAN_PACK_DROP,
                    AP_PACK             = BOT_2["PACK_CONFIG"].AMOUNT_PACK,
                    DROP_LIMIT          = BOT_2["PACK_CONFIG"].DROP_LIMIT,
                    POS_DROP            = BOT_2["PACK_CONFIG"].POS_DROP,
                    W_DROP              = BOT_2["PACK_CONFIG"].W_DROP,
                    W_DROP_ID           = BOT_2["PACK_CONFIG"].W_DROP_ID,
                    ITEMID              = BOT_2["PACK_CONFIG"].ITEMID,
                    AMOUNT_PACK         = 0,
                    AMOUNT_PACK_CALC    = 0
                },
                SEED_CONFIG             = {
                    DROP_LIMIT          = BOT_2["SEED_CONFIG"].DROP_LIMIT,
                    W_DROP              = BOT_2["SEED_CONFIG"].W_DROP,
                    W_DROP_ID           = BOT_2["SEED_CONFIG"].W_DROP_ID,
                    POS_DROP            = BOT_2["SEED_CONFIG"].POS_DROP
                },
                HARVEST_CONFIG          = {
                    DELAY               = BOT_2["HARVEST_CONFIG"].DELAY,
                    W_TAKEBLOCK         = BOT_2["HARVEST_CONFIG"].W_TAKEBLOCK,
                    W_TAKEBLOCKID       = BOT_2["HARVEST_CONFIG"].W_TAKEBLOCKID
                },
                PLANT_CONFIG            = {
                    DELAY               = BOT_2["PLANT_CONFIG"].DELAY
                },
                TRASH_CONFIG            = {
                    LIMIT_TO_TRASH      = BOT_2["TRASH_CONFIG"].LIMIT_TO_TRASH,
                    ITEMID              = BOT_2["TRASH_CONFIG"].ITEMID
                    },
                CUSTOM_CONFIG           = {
                    DROP_LIMIT          = BOT_2["CUSTOM_CONFIG"].DROP_LIMIT,
                    W_DROP              = BOT_2["CUSTOM_CONFIG"].W_DROP,
                    W_DROP_ID           = BOT_2["CUSTOM_CONFIG"].W_DROP_ID,
                    POS_DROP            = BOT_2["CUSTOM_CONFIG"].POS_DROP,
                    ITEMID              = BOT_2["CUSTOM_CONFIG"].ITEMID
                },
                DROP_CONFIG             = {
                    SAVE_DROP_X         = 0,
                    SAVE_DROP_Y         = 0,
                    START_DROP          = 1,
                    SCAN_SEED           = 0,
                    FLOAT_BLOCK         = 0
                }
            }
            
            nSEED                       = Values["BREAK_CONFIG"].BLOCK_ID + 1
        elseif PERMAINDEX == 2 then
            Values                      = {
                BOOLEAN                 = {
                    REMOVE_STATUS       = false,
                    ROTATE_STATUS       = true,
                    AUTO_BUY_BP         = BOT_3["BOT_CONFIG"].AUTO_BUY_BP,
                    USE_FOOD            = BOT_3["BOT_CONFIG"].USE_FOOD,
                    AUTO_PLANT          = BOT_3["PLANT_CONFIG"].AUTO_PLANT,
                    USE_DCS             = BOT_3["HARVEST_CONFIG"].USE_DCS,
                    HARVEST_OPTION      = BOT_3["HARVEST_CONFIG"].HARVEST_OPTION,
                    AUTO_BUY_PACK       = BOT_3["PACK_CONFIG"].AUTO_BUY_PACK
                },
                FARM_CONFIG             = {
                    TOTAL_LOOP          = BOT_3["FARM_CONFIG"].TOTAL_LOOP,
                    START_FARM          = BOT_3["FARM_CONFIG"].START_FARM,
                    FARM_WORLD_ID       = BOT_3["FARM_CONFIG"].FARM_WORLD_ID,
                    FARM_WORLD          = BOT_3["FARM_CONFIG"].FARM_WORLD,
                    LASTWORLD           = "",
                    INDEXWORLD          = 0,
                    TREE_READY          = 0,
                    TREE_UNREADY        = 0,
                    INDEX_LOOP          = 1       
                },
                BREAK_CONFIG            = {
                    BLOCK_ID            = BOT_3["BREAK_CONFIG"].BLOCK_ID,
                    DELAY_BREAK         = BOT_3["BREAK_CONFIG"].DELAY_BREAK,
                    DELAY_PUT           = BOT_3["BREAK_CONFIG"].DELAY_PUT,
                    TILE_BREAK          = BOT_3["BREAK_CONFIG"].TILE_BREAK
                },
                BOT_CONFIG              = {
                    BOTNAME             = getBot().name,
                    INDEXBOT            = PERMAINDEX,
                    PASS_BOT            = BOT_3["BOT_CONFIG"].PASS_BOT,
                    BOT_X               = BOT_3["BOT_CONFIG"].BOT_X,
                    BOT_Y               = BOT_3["BOT_CONFIG"].BOT_Y,
                    REACH_LEVEL         = BOT_3["BOT_CONFIG"].REACH_LEVEL,
                    LIMIT_BP            = BOT_3["BOT_CONFIG"].LIMIT_BP,
                    FOOD_ID             = BOT_3["BOT_CONFIG"].FOOD_ID,
                    POS_DOOR_X          = 0,
                    POS_DOOR_Y          = 0
                        
                },
                PACK_CONFIG             = {
                    BUY_PACK            = 0,
                    NAME_PACK           = BOT_3["PACK_CONFIG"].NAME_PACK,
                    MENU_PACK           = BOT_3["PACK_CONFIG"].MENU_PACK,
                    PRICE               = BOT_3["PACK_CONFIG"].PRICE,
                    SCAN_PACK_DROP      = BOT_3["PACK_CONFIG"].SCAN_PACK_DROP,
                    AP_PACK             = BOT_3["PACK_CONFIG"].AMOUNT_PACK,
                    DROP_LIMIT          = BOT_3["PACK_CONFIG"].DROP_LIMIT,
                    POS_DROP            = BOT_3["PACK_CONFIG"].POS_DROP,
                    W_DROP              = BOT_3["PACK_CONFIG"].W_DROP,
                    W_DROP_ID           = BOT_3["PACK_CONFIG"].W_DROP_ID,
                    ITEMID              = BOT_3["PACK_CONFIG"].ITEMID,
                    AMOUNT_PACK         = 0,
                    AMOUNT_PACK_CALC    = 0
                },
                SEED_CONFIG             = {
                    DROP_LIMIT          = BOT_3["SEED_CONFIG"].DROP_LIMIT,
                    W_DROP              = BOT_3["SEED_CONFIG"].W_DROP,
                    W_DROP_ID           = BOT_3["SEED_CONFIG"].W_DROP_ID,
                    POS_DROP            = BOT_3["SEED_CONFIG"].POS_DROP
                },
                HARVEST_CONFIG          = {
                    DELAY               = BOT_3["HARVEST_CONFIG"].DELAY,
                    W_TAKEBLOCK         = BOT_3["HARVEST_CONFIG"].W_TAKEBLOCK,
                    W_TAKEBLOCKID       = BOT_3["HARVEST_CONFIG"].W_TAKEBLOCKID
                },
                PLANT_CONFIG            = {
                    DELAY               = BOT_3["PLANT_CONFIG"].DELAY
                },
                TRASH_CONFIG            = {
                    LIMIT_TO_TRASH      = BOT_3["TRASH_CONFIG"].LIMIT_TO_TRASH,
                    ITEMID              = BOT_3["TRASH_CONFIG"].ITEMID
                    },
                CUSTOM_CONFIG           = {
                    DROP_LIMIT          = BOT_3["CUSTOM_CONFIG"].DROP_LIMIT,
                    W_DROP              = BOT_3["CUSTOM_CONFIG"].W_DROP,
                    W_DROP_ID           = BOT_3["CUSTOM_CONFIG"].W_DROP_ID,
                    POS_DROP            = BOT_3["CUSTOM_CONFIG"].POS_DROP,
                    ITEMID              = BOT_3["CUSTOM_CONFIG"].ITEMID
                },
                DROP_CONFIG             = {
                    SAVE_DROP_X         = 0,
                    SAVE_DROP_Y         = 0,
                    START_DROP          = 1,
                    SCAN_SEED           = 0,
                    FLOAT_BLOCK         = 0
                }
            }
            
            nSEED                       = Values["BREAK_CONFIG"].BLOCK_ID + 1
        end
        --return table_concat(Values)
        sleep(1500)
    end
-- ANIMATION PUNCH
    function ANIM_PUNCH(px, py)
        punch(px, py)
        collect(3)
        pkt = {}
        pkt.type = 0
        pkt.flags = 2608
        pkt.pos_x = getBot().x
        pkt.pos_y = getBot().y
        pkt.int_x = math.floor(getBot().x / 32) + px
        pkt.int_y = math.floor(getBot().y / 32) + py
        sendPacketRaw(pkt)
    end
-- ANIMATION HARVEST
    function ANIM_HARVEST(px, py)
        punch(px, py)
        collect(3)
        pkt = {}
        pkt.type = 0
        pkt.flags = 2592
        pkt.pos_x = getBot().x
        pkt.pos_y = getBot().y
        pkt.int_x = math.floor(getBot().x / 32) + px
        pkt.int_y = math.floor(getBot().y / 32) + py
        sendPacketRaw(pkt)
    end
-- ANIMATION PLACE
    function ANIM_PLACE(pid, px, py)
        place(pid, px, py)
        collect(3)
        pkt = {}
        pkt.type = 0
        pkt.flags = 3104
        pkt.int_data = pid
        pkt.pos_x = getBot().x
        pkt.pos_y = getBot().y
        pkt.int_x = math.floor(getBot().x / 32) + px
        pkt.int_y = math.floor(getBot().y / 32) + py
       sendPacketRaw(pkt)
    end
-- == SUPPORT FUNCTION == --
    -- CREATE FILE
        function SUPP_WRITE(filename, contents)
            local fh = assert(io.open("["
                ..Values["BOT_CONFIG"].INDEXBOT.."]".."-"
                ..filename, "wb"))
            fh:write(contents)
            fh:flush()
            fh:close()
        end
    -- MOVE AWAY WHITE DOOR
        function SUPP_WHITEDOOR(WORLD, WORLDID)
            if getTile(math.floor(getBot().x / 32), math.floor(getBot().y / 32)).fg == 6 or getTile(math.floor(getBot().x / 32), math.floor(getBot().y / 32)).bg == 6 then
                sendPacket(3, "action|join_request\nname|" .. WORLD:upper() .. "|" .. WORLDID:upper() .. "\ninvitedWorld|0")
                sleep(Configuration["WORLD"].JOIN_DOOR)
            end
        end
    -- JOIN WORLD
        function SUPP_JOINWORLD(WORLD, WORLDID)
            sendPacket(3, "action|join_request\nname|" .. WORLD:upper() .. "|" .. WORLDID:upper() .. "\ninvitedWorld|0")
            sleep(Configuration["WORLD"].JOIN_1)
            SUPP_WHITEDOOR(WORLD, WORLDID)
            Values["BOT_CONFIG"].POS_DOOR_X = math.floor(getBot().x/32)
        end
    -- CAPTCHA CHECKER
        function SUPP_CAPTCHA()
            local nBotCap = getBot().captcha
            if nBotCap == "Couldn't solve" or getBot().captcha == "Wrong answer" then
                sleep(1000)
                disconnect()
                sleep(10000)
                while getBot().status ~= "online" do
                    connect()
                    sleep(15000)
                    if getBot().status == "online" then
                        break
                    end
                end
            end
        end
    -- RECONNECTION
        function SUPP_RECONNECTION(WORLD, WORLDID, MESSAGEZ)
            SUPP_CAPTCHA()
            if getBot().status ~= "online" then
                if getBot().status ~= "online" then
                    nWebHook_Disconnect(MESSAGEZ)
                    connect()
                    sleep(10000)
                end
                if getBot().status == "online" then
                    nWebHook_Disconnect(MESSAGEZ)
                    SUPP_WHITEDOOR(WORLD, WORLDID)
                    sleep(1000)
                end
                sleep(1000)
                SUPP_WHITEDOOR(WORLD, WORLDID)
                sleep(500)
            end
			if getBot().world:upper() == "EXIT" then
				SUPP_WHITEDOOR(WORLD, WORLDID)
				sleep(250)
			end
            while getBot().status ~= "online" do
                ::BACKRECONECT::
                sleep(1000)
                connect()
                sleep(10000)
                if getBot().status == "login fail" then
                    sleep(500)
                    nWebHook_Disconnect(MESSAGEZ)
                    disconnect()
                    sleep(2500)
                    --goto BACKRECONECT
                elseif getBot().status == "suspended" then
                    sleep(5000)
                    nWebHook_Disconnect(MESSAGEZ)
                    removeBot(Values["BOT_CONFIG"].BOTNAME)
                    Values["BOOLEAN"].REMOVE_STATUS = true
                    break
                elseif getBot().status == "banned" then
                    sleep(10000)
                    nWebHook_Disconnect(MESSAGEZ)
                    removeBot(Values["BOT_CONFIG"].BOTNAME)
                    Values["BOOLEAN"].REMOVE_STATUS = true
                    break
		elseif getBot().status == "maintenance" then
			disconnect()
			sleep(5000)
                elseif getBot().status == "online" then
                    nWebHook_Disconnect(MESSAGEZ)
                    sleep(500)
                    if getBot().world:upper() == WORLD:upper() then
                        nWebHook_Disconnect(MESSAGEZ)
                        sleep(1000)
                        SUPP_WHITEDOOR(WORLD, WORLDID)
                        sleep(500)
                        break
                    else
                        sleep(5000)
                        SUPP_WHITEDOOR(WORLD, WORLDID)
                    end
                end
            end
        end
		-- REJOIN WORLD
		function SIDE_REJOIN_WORLD(WORLD, WORLDID, MESSAGE)
			local BotWorld = getBot().world:upper()
			local ToWorld = WORLD:upper()
			if BotWorld ~= ToWorld then
				SUPP_RECONNECTION(WORLD, WORLDID, MESSAGE)
				SUPP_JOINWORLD(WORLD, WORLDID)
			else
				SUPP_RECONNECTION(WORLD, WORLDID, MESSAGE)
				SUPP_WHITEDOOR(WORLD, WORLDID)
			end
		end
    -- WEBHOOK DISCONNECTION
        function nWebHook_Disconnect(desc)
            nTitle = Name_Farm:upper().." [ "..Number_Farm.." ] - "..getBot().name:upper()
            wh = {}
            wh.username = getBot().name:upper()
            wh.url = Configuration["WEBHOOK"].URL_DISCONNECT
            wh.avatar = "https://i.ibb.co/ZW9ngkz/Maximuze-small.png"
            wh.embed = '{"title": "'..nTitle..'", "description": "'.. desc.." | STATUS : [ ".. getBot().status:upper()..' ]" }'
            webhook(wh)
        end
    -- TRASH ITEM
        function SUPP_TRASH()
           for _, trashlist in pairs(Values["TRASH_CONFIG"].ITEMID) do
                if findItem(trashlist) >= Values["TRASH_CONFIG"].LIMIT_TO_TRASH then
                    sendPacket(2, "action|trash\n|itemID|" .. trashlist)
                    sleep(1000)
                    sendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|" ..trashlist .. "|\ncount|" .. findItem(trashlist))
                    sleep(1000)
                end
            end
        end
    -- SCAN READY
        function SUPP_SCANREADY(ID)
            local ReadyZ = 0
            for _, tile in pairs(getTiles()) do
                if tile.fg == ID or tile.bg == ID then
                    if tile.ready == true then
                        ReadyZ = ReadyZ + 1
                    end
                end
            end
            return ReadyZ
        end
    -- SCAN UNREADY TREE
        function SUPP_SCANUNREADY(ID)
            local UnReadyZ = 0
            for _, tile in pairs(getTiles()) do
                if tile.fg == ID or tile.bg == ID then
                    if tile.ready == false then
                        UnReadyZ = UnReadyZ + 1
                    end
                end
            end
            return UnReadyZ
        end
    -- GET INDEX BOT
        function SUPP_INDEXBOT()
            local nCount = #getBots()
            for i = 0, nCount do
                if getBots()[i].name:upper() == getBot().name:upper() then
                    PERMAINDEX = i
                    break
                end
            end
        end
    -- GET INDEX WORLD
        function SUPP_INDEXWORLD()
            local nCount = #Values["FARM_CONFIG"].FARM_WORLD
            for i = 1, nCount do
                if getBot().world:upper() == Values["FARM_CONFIG"].FARM_WORLD[i]:upper() then
                    Values["FARM_CONFIG"].INDEXWORLD = i
                    break
                end
            end
        end
    -- SCAN FLOAT
        function SUPP_SCANFLOAT(ID)
            local nCount = 0
            for _, float in pairs(getObjects()) do
                if float.id == ID then
                    nCount = nCount + float.count
                end
            end
            return nCount
        end
    -- SCAN TREE
        function SUPP_SCANTREE(ID)
            for _, tile in pairs(getTiles()) do
                if tile.fg == ID or tile.bg == ID then
                    if tile.ready == true then
                        Values["FARM_CONFIG"].TREE_READY = Values["FARM_CONFIG"].TREE_READY + 1
                    elseif tile.ready == false then
                        Values["FARM_CONFIG"].TREE_UNREADY = Values["FARM_CONFIG"].TREE_UNREADY + 1
                    end
                end
            end
            return Values["FARM_CONFIG"].TREE_READY and Values["FARM_CONFIG"].TREE_UNREADY
        end
    -- CALCULATE
        function SUPP_CALCULATE(ID1, ID2)
            local ID3 = 0
            if ID1 >= ID2 then
                ID3 = ID1 - ID2
            else
                ID3 = ID2 - ID1
            end
            return ID3
        end
        -- DROP MOVE
        function SUPP_DROPMOVE(ID, WORLD, WORLDID)
            local function nLocalMoveDirection()
                if Configuration["DROP"].DIRECTION == "Right" then
                    nMoveX = 1
                    nMoveY = 0
                elseif Configuration["DROP"].DIRECTION == "Left" then
                    nMoveX = -1
                    nMoveY = 0
                end
            end
            local function nLocalDrop(ID, WORLD, WORLDID)
                if findItem(ID) > 0 then
                    SIDE_REJOIN_WORLD(WORLD, WORLDID, "ON DROP")
                    drop(ID)
                    sleep(Configuration["DROP"].DELAY_DROP)
                end
            end
            nLocalMoveDirection()
            if findItem(ID) > 0 then
                SIDE_REJOIN_WORLD(WORLD, WORLDID, "GO DROP")
                sleep(250)
                nLocalDrop(ID, WORLD, WORLDID)
                sleep(250)
                if findItem(ID) > 0 then
                    for i = 1, Configuration["DROP"].MOVE_DROP, 1 do
                        SIDE_REJOIN_WORLD(WORLD, WORLDID, "MOVE DROP")
                        sleep(Configuration["DROP"].MOVE_DELAY / 2)
                        move(nMoveX, nMoveY)
                        sleep(Configuration["DROP"].MOVE_DELAY)
                        nLocalDrop(ID,WORLD, WORLDID)
                        sleep(Configuration["DROP"].MOVE_DELAY / 2)
                        if findItem(ID) == 0 then
                            break
                        end
                    end
                end
            end
        end
    -- GO POST DROP BACKGROUND
        function SUPP_GOPOS(ID, POS, WORLD, WORLDID)
            for i, tile in pairs(getTiles()) do
                if tile.fg == POS or tile.bg == POS then
                    if findItem(ID) > 0 then
                        SIDE_REJOIN_WORLD(WORLD, WORLDID, "GO POS DROP")
                        findPath(tile.x - 1, tile.y)
                        sleep(250)
						SUPP_DROPMOVE(ID, WORLD, WORLDID)
						sleep(100)
						if findItem(ID) == 0 then
                           break
                       end
                    end
                end
            end
        end
    -- DROP ALL
        function SUPP_DROPALL()
            local function nDropZ(ID)
                if findItem(ID) > 0 then
                    drop(ID)
                    sleep(Configuration["DROP"].DELAY_DROP)
                end
            end
            if Values["BOT_CONFIG"].BOT_X ~= math.floor(getBot().x / 32) and Values["BOT_CONFIG"].BOT_Y ~= math.floor(getBot().y / 32) then
                findPath(Values["BOT_CONFIG"].BOT_X,Values["BOT_CONFIG"].BOT_Y)
                sleep(100)
            end
            sleep(250)
            for _, item in pairs(getInventory()) do
                if item.count >= 2 then
                    SUPP_RECONNECTION(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "GO DROP ALL")
                    SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                    if Values["BOT_CONFIG"].BOT_X ~= math.floor(getBot().x / 32) and Values["BOT_CONFIG"].BOT_Y ~= math.floor(getBot().y / 32) then
                        findPath(Values["BOT_CONFIG"].BOT_X,Values["BOT_CONFIG"].BOT_Y)
                        sleep(100)
                    end
                    nDropZ(item.id)
                    sleep(500)
                end
            end
        end
-- == SIDE FUNCTION == --
    -- OPEN STORE
        function SIDE_OPENSTORE(PACKNAME, MENUPACK)
            sendPacket(2, "action|buy\nitem|" .. MENUPACK)
            sleep(500)
            sendPacket(2, "action|buy\nitem|" .. PACKNAME)
            sleep(1000)
        end
    -- BUY PACK
        function SIDE_BUYPACK(PACKNAME, MENUPACK)
            ::BUYAGAIN::
            sleep(100)
            if findItem(112) >= Values["PACK_CONFIG"].PRICE then
                SIDE_OPENSTORE(PACKNAME, MENUPACK)
                Values["PACK_CONFIG"].BUY_PACK = Values["PACK_CONFIG"].BUY_PACK + 1
                sleep(200)
            end
            sleep(100)
            if findItem(Values["PACK_CONFIG"].SCAN_PACK_DROP) >= Values["PACK_CONFIG"].DROP_LIMIT then
                sleep(200)
                goto GOTOSKIP
            end
            sleep(100)
            if findItem(112) >= Values["PACK_CONFIG"].PRICE then
                sleep(200)
                goto BUYAGAIN
            end
            ::GOTOSKIP::
            sleep(200)
        end
    -- CHECK PACK
        function SIDE_CHECKPACK(NUMBER, INDEXDROP)
            for k, list in pairs(Values["PACK_CONFIG"].ITEMID) do
                if findItem(list) >= NUMBER then
					SIDE_REJOIN_WORLD(Values["PACK_CONFIG"].W_DROP, Values["PACK_CONFIG"].W_DROP_ID, "CHECK PACK")
                    --SUPP_GOPOS(list, Values["PACK_CONFIG"].POS_DROP, Values["PACK_CONFIG"].W_DROP, Values["PACK_CONFIG"].W_DROP_ID)
					SIDE_DROPITEM(list, Values["PACK_CONFIG"].POS_DROP, Values["PACK_CONFIG"].W_DROP, Values["PACK_CONFIG"].W_DROP_ID, INDEXDROP)
				end
            end
        end
	
    -- DROP ITEM
        function SIDE_DROPITEM(ID, POS, WORLD, WORLDID, INDEXDROP)
            ::AWALDROP::
            sleep(100)
                if findItem(ID) > 0 then
                    SIDE_REJOIN_WORLD(WORLD, WORLDID, "DROP ITEM")
                    if getBot().world:upper() == WORLD:upper() then
                        SIDE_REJOIN_WORLD(WORLD, WORLDID, "PREPARE TO POS")
						sleep(250)
                        SUPP_GOPOS(ID, POS, WORLD, WORLDID)
                        sleep(350)
                        if ID == nSEED then
                            Values["DROP_CONFIG"].SCAN_SEED = SUPP_SCANFLOAT(ID)
                            sleep(250)
                            SEED_HOOK(Values["DROP_CONFIG"].SCAN_SEED)
                            sleep(250)
                        elseif ID == Values["PACK_CONFIG"].SCAN_PACK_DROP then
                            Values["PACK_CONFIG"].AMOUNT_PACK = SUPP_SCANFLOAT(Values["PACK_CONFIG"].SCAN_PACK_DROP)
                            sleep(250)
                            PACK_HOOK(Values["PACK_CONFIG"].AMOUNT_PACK)
                            sleep(250)
                        end
                        goto AWALDROP
                    else
                        sleep(500)
                        goto AWALDROP
                    end
                else
                    sleep(100)
                    if INDEXDROP == 1 then
                        SIDE_REJOIN_WORLD(WORLD, WORLDID, "DONE DROP ITEM")
                        sleep(500)
                        goto DONEDROP
                    else
                        goto DONEDROP
                    end
                end
            ::DONEDROP::
            sleep(500)
        end
    -- DROP CUSTOM
        function SIDE_CUSTOM(NUMBER, INDEXDROP)
            for i, custom in pairs(Values["CUSTOM_CONFIG"].ITEMID) do
                if findItem(custom) >= NUMBER then
					SIDE_REJOIN_WORLD(Values["CUSTOM_CONFIG"].W_DROP, Values["CUSTOM_CONFIG"].W_DROP_ID, "CUSTOM DROP")
                    SIDE_DROPITEM(custom, Values["CUSTOM_CONFIG"].POS_DROP, Values["CUSTOM_CONFIG"].W_DROP, Values["CUSTOM_CONFIG"].W_DROP_ID, INDEXDROP)
                end
            end
        end
    -- TAKE ITEM
        function SIDE_TAKEITEM(ID, WORLD, WORLDID, ITEMLIMIT)
            for n, h in pairs(getObjects()) do
                if h.id == ID then
                    if h.id == ID then
						SIDE_REJOIN_WORLD(WORLD, WORLDID, "TAKE ITEM FLOATING")
                        findPath(math.floor((h.x) / 32), math.floor((h.y) / 32))
                        sleep(150)
                        collect(3)
                        if findItem(ID) >= ITEMLIMIT then
                            break
                        end
                    end
                end
            end
        end
    -- TAKE BLOCK
        function SIDE_TAKEBLOCK(ID, WORLD, WORLDID)
            if findItem(ID) == 0 then
				SIDE_REJOIN_WORLD(WORLD, WORLDID, "GO TAKE BLOCK")
                SIDE_TAKEITEM(ID, WORLD, WORLDID, 200)
                sleep(250)
            end
        end
    -- BOT CHECKER LEVEL
        function SIDE_BOTLEVEL()
            local getlevel = getBot().level 
            if getlevel >= REACH_LIMIT then
                SUPP_RECONNECTION(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "REACH LEVEL LIMIT")
                SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                sleep(500)
                findPath(Values["BOT_CONFIG"].BOT_X,Values["BOT_CONFIG"].BOT_Y)
                sleep(100)
                SUPP_DROPALL()
                sleep(1000)
                removeBot(Values["BOT_CONFIG"].BOTNAME)
                sleep(2500)
                Values["BOOLEAN"].REMOVE_STATUS = true
            end
        end
    -- BACKPACK UPGRADE
        function SIDE_BACKPACK()
            if Values["BOOLEAN"].AUTO_BUY_BP == true then
                if getBot().slots < Values["BOT_CONFIG"].LIMIT_BP then
                    if findItem(112) > 100 then
                        SIDE_OPENSTORE("upgrade_backpack", "locks")
                        sleep(1000)
                    end
                end
            end
        end
-- == MAIN FUNCTION == --
    -- MAIN HARVEST TREE
        function MAIN_HARVEST(ID)
            -- HARVEST TREE
            local function localharvest(ID)
                local nDelay = Values["HARVEST_CONFIG"].DELAY
                local htlimit = Values["SEED_CONFIG"].DROP_LIMIT
                for y, tile in pairs(getTiles()) do
                    if tile.fg == ID + 1 then
                    --if tile.fg == ID + 1 and tile.ready == true then
                        if getTile(tile.x, tile.y).ready then
							SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "ON HARVEST")
                            findPath(tile.x, tile.y)
                            sleep(nDelay)
                            punch(0,0)
                            sleep(nDelay)
                            collect(3)
                            sleep(50)
                            if getBot().world:upper() ~= Values["FARM_CONFIG"].LASTWORLD:upper() then
                                break
                            end
                        end
                        if findItem(ID) >= 180 then 
                            break
                        elseif findItem(ID + 1) >= htlimit then
                            break
                        end
                    end
                end
            end
            SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "START HARVEST")
            if Values["BOOLEAN"].USE_DCS == true then
                if findClothes(6840) == false then
                    if findItem(6840) >= 1 then
                        wear(6840)
                        sleep(200)
                    end
                end
                SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "GO HARVEST")
                localharvest(ID)
                sleep(250)
            else
                SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "GO HARVEST")
                localharvest(ID)
                sleep(250)
            end
        end
    -- MAIN PLANTING
        function MAIN_PLANTING(ID)
            local function localplanting(ID)
                 local delayplant = Values["PLANT_CONFIG"].DELAY
                for _, tile in pairs(getTiles()) do
                    if tile.fg == 0 and getTile(tile.x, tile.y + 1).flags ~= 0 then
						SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "ON PLANTING")
                        findPath(tile.x, tile.y)
                        sleep(delayplant)
                        ANIM_PLACE(ID, 0, 0)
                        sleep(delayplant)
                        if findItem(ID) == 0 then
                            break
                        elseif getBot().world:upper() ~= Values["FARM_CONFIG"].LASTWORLD then
                            break
                        end
                    end
                end
            end
            SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "START PLANTING")
            if Values["BOOLEAN"].AUTO_PLANT == true then
                SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "TO PLANT")
                localplanting(ID)
                sleep(250)
            end
        end
    -- MAIN BREAKING
        function MAIN_BREAK(ID)
            local function nConnectBreak()
                SUPP_CAPTCHA()
                if getBot().status ~= "online" then
                    sleep(7500)
                end
                if getBot().world:upper() == "EXIT" then
                    SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                    sleep(250)
                end
                while getBot().status ~= "online" do
                    ::AWALDD::
                    connect()
                    sleep(15000)
                    if getBot().status == "login fail" then
                        --removeBot(Values["BOT_CONFIG"].BOTNAME)
                        disconnect()
                        sleep(7500)
                        --goto AWALDD
                    elseif getBot().status == "suspended" then
                        sleep(5000)
                        removeBot(Values["BOT_CONFIG"].BOTNAME)
                        Values["BOOLEAN"].REMOVE_STATUS = true
                        break
                    elseif getBot().status == "banned" then
                        sleep(10000)
                        removeBot(Values["BOT_CONFIG"].BOTNAME)
                        Values["BOOLEAN"].REMOVE_STATUS = true
                        break
                    elseif getBot().status == "online" then
                        SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                        sleep(1500)
                        break 
                    end
                end
            end
            local function getPath()
                nConnectBreak()
                SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                if math.floor(getBot().x / 32) == Values["BOT_CONFIG"].BOT_X and math.floor(getBot().y / 32) == Values["BOT_CONFIG"].BOT_Y then
                    goto SKIPZZ
                else
                    findPath(Values["BOT_CONFIG"].BOT_X,Values["BOT_CONFIG"].BOT_Y)
                    sleep(100)
                end
                ::SKIPZZ::
                sleep(1)
            end
            local function nBreakTile(ID, PX, PY)
                local BreakSaveX = math.floor(getBot().x / 32)
                local BotX = math.floor(getBot().x / 32) + PX
                local BotY = math.floor(getBot().y / 32) + PY
                nConnectBreak()
                getPath()
                while getTile(BotX, BotY).fg == ID or getTile(BotX, BotY).bg == ID do
                    nConnectBreak()
                    SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                    getPath()
                    ANIM_PUNCH(PX, PY)
                    sleep(Values["BREAK_CONFIG"].DELAY_BREAK)
                    if findItem(ID + 1) >= Values["SEED_CONFIG"].DROP_LIMIT then
                        GoSave = false
                        sleep(100)
                        break
                    elseif BreakSaveX == Values["BOT_CONFIG"].POS_DOOR_X then
                        sleep(100)
                        break
                    --elseif getBot().world:upper() ~= Values["FARM_CONFIG"].LASTWORLD:upper() then
					elseif getBot().world:upper() == "EXIT" then
					SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                        sleep(100)
                        break
                    end
                end
            end
            local function nLocalnPut_Tile(ID)
                if Values["BREAK_CONFIG"].TILE_BREAK == 1 then
                    nConnectBreak()
                    SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                    --PLACE
                    getPath()
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, 0)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    --BRAEK
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, 0)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                elseif Values["BREAK_CONFIG"].TILE_BREAK == 2 then
                    nConnectBreak()
                    SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                    --PLACE
                    getPath()
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, 0)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, -1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    -- BREAK
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, 0)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, -1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                elseif Values["BREAK_CONFIG"].TILE_BREAK == 3 then
                    nConnectBreak()
                    SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                    --PLACE
                    getPath()
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, 1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, 0)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, -1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    --BREAK
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, 1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, 0)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, -1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                elseif Values["BREAK_CONFIG"].TILE_BREAK == 4 then
                    nConnectBreak()
                    SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                    --PLACE
                    getPath()
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, 1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, 0)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, -1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, -2)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    --BREAK
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, 1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, 0)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, -1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, -2)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                elseif Values["BREAK_CONFIG"].TILE_BREAK == 5 then
                    nConnectBreak()
                    SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                    --PLACE
                    getPath()
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, 2)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, 1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, 0)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, -1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    ANIM_PLACE(ID, -1, -2)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    --BREAK
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, 2)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, 1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, 0)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, -1)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                    nBreakTile(ID, -1, -2)
                    sleep(Values["BREAK_CONFIG"].DELAY_PUT)
                end
            end
            if getBot().world:upper() ~= Values["FARM_CONFIG"].LASTWORLD:upper() then
                SUPP_RECONNECTION(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "START BREAK")
                SUPP_JOINWORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                sleep(1000)
            else
                SUPP_RECONNECTION(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "START BREAK")
                SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                sleep(500)
            end
            GoSave = true
            sleep(250)
            if findClothes(98) == false then
                wear(98)
                sleep(250)
            end
            getPath()
            sleep(250)
            while GoSave do
                nConnectBreak()
                getPath()
                SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                if findItem(ID) > 0 then
                    nConnectBreak()
                    SUPP_WHITEDOOR(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID)
                    getPath()
                    nLocalnPut_Tile(ID)
                    if findItem(ID+1) >= Values["SEED_CONFIG"].DROP_LIMIT then
                        GoSave = false
                    end
                elseif findItem(Values["PACK_CONFIG"].SCAN_PACK_DROP) >= Values["PACK_CONFIG"].DROP_LIMIT then
                    GoSave = false
                elseif findItem(ID) == 0 then
                    GoSave = false
                elseif Values["BOOLEAN"].REMOVE_STATUS == true then
                    break
                end
            end
            SUPP_TRASH()
        end
    -- MAIN TAKE PICKAXE
        function MAIN_TAKEPICKAXE()
            local function customdrop(ID, NITEMKEEP)
                local icount = findItem(ID)
                sendPacket(2, "action|drop\n|itemID|" .. ID)
                sleep(1000)
                sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. ID .. "|\ncount|" .. (icount - NITEMKEEP))
                sleep(1500)
            end
            local function nLocalGoPosPickaxe(ID, POS)
                for c, tile in ipairs(getTiles()) do
                    if tile.fg == POS or tile.bg == POS then
                        if findItem(ID) > 0 then
							SIDE_REJOIN_WORLD(Configuration["PICKAXE"].W_TAKE, Configuration["PICKAXE"].W_TAKE_ID, "TAKE PICKAXE")
                            findPath(tile.x, tile.y)
                            sleep(250)
                            customdrop(98, 1)
                            sleep(500)
                            if findItem(ID) > 1 then
                                move(-1, 0)
                                sleep(500)
                                customdrop(98, 1)
                                sleep(1000)
                            elseif findItem(ID) == 1 then
                                sleep(250)
                                break
                            end
                        end
                    end
                end
            end
            if Configuration["PICKAXE"].TAKE_PICKAXE == true then
                if findItem(98) == 0 then
                    SIDE_REJOIN_WORLD(Configuration["PICKAXE"].W_TAKE, Configuration["PICKAXE"].W_TAKE_ID, "TAKE PICKAXE")
					sleep(1500)
					if findItem(98) == 0 then
						SIDE_TAKEITEM(98, Configuration["PICKAXE"].W_TAKE, Configuration["PICKAXE"].W_TAKE_ID, 2)
						sleep(250)
					end
                    sleep(1000)
                    if findClothes(98) == false then
                        wear(98)
                        sleep(1000)
                    end
                    nLocalGoPosPickaxe(98, Configuration["PICKAXE"].POS_DROP)
                    sleep(500)
                    if findItem(98) == 1 then
                        SIDE_REJOIN_WORLD(Configuration["PICKAXE"].W_TAKE, Configuration["PICKAXE"].W_TAKE_ID, "TAKE PICKAXE")
                        sleep(1000)
                    end
				elseif findItem(98) >= 2 then
					nLocalGoPosPickaxe(98, Configuration["PICKAXE"].POS_DROP)
                    sleep(500)
					if findItem(98) == 1 then
                        SIDE_REJOIN_WORLD(Configuration["PICKAXE"].W_TAKE, Configuration["PICKAXE"].W_TAKE_ID, "TAKE PICKAXE")
                        sleep(1000)
                    end
                end
            end
        end
-- == START FUNCTION == --
    -- FUNCTION
        function MAIN_START(WORLD)
             local function getPath()
				SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "GO PATH BREAK")
                if math.floor(getBot().x / 32) == Values["BOT_CONFIG"].BOT_X and math.floor(getBot().y / 32) == Values["BOT_CONFIG"].BOT_Y then
                    goto SKIPZZD
                else
                    findPath(Values["BOT_CONFIG"].BOT_X,Values["BOT_CONFIG"].BOT_Y)
                    sleep(100)
                end
                ::SKIPZZD::
            end
            ::FIRST::
            sleep(1500)
                SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "MAIN ROTATE #1")
                getPath()
                SIDE_BACKPACK()
                --SIDE_BOTLEVEL()
				if findItem(98) > 2 or findItem(98) == 0 then
					MAIN_TAKEPICKAXE()
					sleep(1000)
					goto FIRST
				end
                SIDE_CUSTOM(Values["CUSTOM_CONFIG"].DROP_LIMIT, 2)
                SIDE_CHECKPACK(Values["PACK_CONFIG"].DROP_LIMIT, 2)
                if Values["BOOLEAN"].REMOVE_STATUS == true then
                    goto GONEXT
                end
                if Values["BOOLEAN"].AUTO_BUY_PACK == true then
                    if findItem(112) >= Values["PACK_CONFIG"].PRICE then
                        SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "BUY PACK #1")
                        SIDE_BUYPACK(Values["PACK_CONFIG"].NAME_PACK, Values["PACK_CONFIG"].MENU_PACK)
                        sleep(250)
                        goto FIRST
                    end
                end
                if findItem(Values["BREAK_CONFIG"].BLOCK_ID) > 0 then
                    SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "GO BREAKING BLOCK #1")
                    getPath()
                    MAIN_BREAK(Values["BREAK_CONFIG"].BLOCK_ID)
                    sleep(250)
                end
                if findItem(nSEED) > 0 then
                    SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "GO PLANTING #1")
                    MAIN_PLANTING(nSEED)
                    sleep(250)
                    if findItem(nSEED) >= Values["SEED_CONFIG"].DROP_LIMIT then
                        SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "MAIN ROTATE #2")
                        SIDE_DROPITEM(nSEED, Values["SEED_CONFIG"].POS_DROP, Values["SEED_CONFIG"].W_DROP, Values["SEED_CONFIG"].W_DROP_ID, 2)
                        sleep(250)
                        goto FIRST
                    end
                end
                if findItem(Values["BREAK_CONFIG"].BLOCK_ID) == 0 then
                    SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "GO HARVEST #1")
                    sleep(100)
                    if Values["BOOLEAN"].HARVEST_OPTION == true then
                        SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "HARVEST #2")
                        sleep(100)
                        Values["FARM_CONFIG"].TREE_READY = 0
                        sleep(100)
                        Values["FARM_CONFIG"].TREE_READY = SUPP_SCANREADY(nSEED)
                        sleep(100)
                        if Values["FARM_CONFIG"].TREE_READY == 0 then
                            SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "HARVEST #3")
                            floatz = 0
                            floatz = SUPP_SCANFLOAT(Values["BREAK_CONFIG"].BLOCK_ID)
                            if floatz > 0 then
                                SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "HARVEST #4")
                                SIDE_TAKEITEM(Values["BREAK_CONFIG"].BLOCK_ID, Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, 200)
                                goto FIRST
                            else
                                goto GONEXT
                            end
                        else
                            SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "HARVEST #5")
                            sleep(250)
                            MAIN_HARVEST(Values["BREAK_CONFIG"].BLOCK_ID)
                        end
                    else
                        SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "HARVEST #6")
                        Values["FARM_CONFIG"].TREE_UNREADY = 0
                        sleep(250)
                        Values["FARM_CONFIG"].TREE_UNREADY = SUPP_SCANUNREADY(nSEED)
                        sleep(250)
                        if Values["FARM_CONFIG"].TREE_UNREADY < 2630 then
                            SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].LASTWORLD, Values["FARM_CONFIG"].FARM_WORLD_ID, "HARVEST #7")
                            SIDE_TAKEBLOCK(Values["BREAK_CONFIG"].BLOCK_ID, Values["HARVEST_CONFIG"].W_TAKEBLOCK, Values["HARVEST_CONFIG"].W_TAKEBLOCKID)
                            sleep(250)
                            goto FIRST
                        end
                    end
                end
                if getBot().world == "EXIT" then
                    sleep(250)
                    goto FIRST
                elseif findItem(Values["BREAK_CONFIG"].BLOCK_ID) > 0 then
                    goto FIRST
                elseif Values["BREAK_CONFIG"].BLOCK_ID + 1 > 0 then
                    goto FIRST
                end
            ::GONEXT::
            SUPP_SCANTREE(nSeed)
            sleep(500)
        end
-- == START ROTATE == --
    -- FUNCTION
        function START_ROTATE()
            
            for p = Values["FARM_CONFIG"].START_FARM, #Values["FARM_CONFIG"].FARM_WORLD, 1 do
				SIDE_REJOIN_WORLD(Values["FARM_CONFIG"].FARM_WORLD[p], Values["FARM_CONFIG"].FARM_WORLD_ID, "START ROTATE")
                sleep(250)
                Values["FARM_CONFIG"].LASTWORLD = Values["FARM_CONFIG"].FARM_WORLD[p]:upper()
                SUPP_SCANTREE(nSEED)
                sleep(250)
                SUPP_WRITE("[v2].txt", Values["BOT_CONFIG"].BOTNAME:upper().." - Last World [ " .. Values["FARM_CONFIG"].LASTWORLD .. " ]")
                sleep(50)
                if Values["BOOLEAN"].USE_FOOD == true then
                    place(Values["BOT_CONFIG"].FOOD_ID,0,0)
                    sleep(100)
                end
                SUPP_INDEXWORLD()
                sleep(250)
                MAIN_START()
                if Values["BOOLEAN"].REMOVE_STATUS == true then
                    break
                end
                sleep(1000)
                if findItem(nSEED) > 0 then
                    SIDE_DROPITEM(nSEED, Values["SEED_CONFIG"].POS_DROP, Values["SEED_CONFIG"].W_DROP, Values["SEED_CONFIG"].W_DROP_ID,2)
                    sleep(500)
                end
                SIDE_CUSTOM(1, 2)
                sleep(1000)
                SIDE_CHECKPACK(1, 1)
                sleep(1000)
                if Values["FARM_CONFIG"].START_FARM == #Values["FARM_CONFIG"].FARM_WORLD then
                    Values["FARM_CONFIG"].START_FARM = 1
                end
                sleep(7500)
            end
        end
-- == START LOOPING FUNCTION == -
    -- FUNCTION
        function START_LOOPING()
            setBool("Select All", false)
            REACH_LIMIT = getBot().level + Values["BOT_CONFIG"].REACH_LEVEL
            SUPP_RECONNECTION(Values["FARM_CONFIG"].FARM_WORLD[1], Values["FARM_CONFIG"].FARM_WORLD_ID, "START ROTATE AUTO FARM")
            MAIN_TAKEPICKAXE()
            sleep(1000)
            for j = 1, Values["FARM_CONFIG"].TOTAL_LOOP, 1 do
                Values["FARM_CONFIG"].INDEX_LOOP = j
                SUPP_RECONNECTION(Values["FARM_CONFIG"].FARM_WORLD[1], Values["FARM_CONFIG"].FARM_WORLD_ID, "START ROTATE AUTO FARM")
                START_ROTATE()
                if Values["BOOLEAN"].REMOVE_STATUS == true then
                    break
                end
            end
        end
--setBool("Auto Reconnect", false)
--SUPP_RECONNECTION(Values["FARM_CONFIG"].FARM_WORLD[1], Values["FARM_CONFIG"].FARM_WORLD_ID, "EXECUTE FARM")
nGetValues()
sleep(2000)
SUPP_JOINWORLD(Values["FARM_CONFIG"].FARM_WORLD[1], Values["FARM_CONFIG"].FARM_WORLD_ID)
sleep(500)
function hook(v)
    if v[0] == "OnConsoleMessage" then
        if v[1]:find("!!maximuzerzzz") then
            sleep(2500)
            nWebHook_Disconnect("BOT REMOVED~~")
            removeBot(getBot().name)
        end
    end
end
--addHook("hook",hook)
if PERMAINDEX == 0 then
	sleep(500)
elseif PERMAINDEX == 1 then
	sleep(5000)
elseif PERMAINDEX == 2 then
	sleep(10000)
end
::BACKWORK::
setBool("Auto Reconnect", true)
START_LOOPING()
sleep(10000)
SUPP_JOINWORLD("DONEBREAK", "")
sleep(1500)
setBool("Auto Reconnect", false)
disconnect()
sleep(3600000)
SUPP_RECONNECTION(Values["FARM_CONFIG"].FARM_WORLD[1], Values["FARM_CONFIG"].FARM_WORLD_ID, "RECONNECTION AFTER REST BREAK")
goto BACKWORK
