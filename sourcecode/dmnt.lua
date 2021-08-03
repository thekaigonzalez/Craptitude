require("liblfds")
os.execute("clear")
print("Kai's Disk Mounting System")
print("Type 1 to go into bash image")
print("Type 2 to view a list of existing images")

local n = io.read("n")
local function starts_with(str, start)
    return str:sub(1, #start) == start
end

local function ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end
if n == 1 then
    os.execute("clear")
    dofile("./mnt/lua-bash-tty.dsi")
elseif n == 2 then
    os.execute("clear")
    print("You currently have " .. getdirnumber("mnt") .. " image files in the /mnt directory.")
    print("Type the name of one of the images below. (without the .dsi extension)")
    local aiter = 0
    for i = 0, getdirnumber("mnt") - 1 do
        if (ends_with(getallfilesiE("mnt", i), ".dsi")) then
            aiter = aiter + 1
        end
        if (ends_with(getallfilesiE("mnt", i), ".rc")) then
            local nfile = loadfile("mnt/" .. getallfilesi("mnt", i) .. ".rc")()
            print(getallfilesi("mnt", i) .. "  " .. nfile.name .. " | disk" .. aiter)
        end
    end

    local image_filename = readline("TTY:> ")

    if starts_with(image_filename, "disk") then
        local num = tonumber(image_filename:sub(5, 5));
        if (loadfile("mnt/" .. getallfilesi("mnt", aiter + 1) .. ".rc")().run == "any") then
            dofile("./mnt/" .. getallfilesi("mnt", num) .. ".dsi")
        elseif loadfile("mnt/" .. getallfilesi("mnt", aiter + 1) .. ".rc")().run == "main" then
            require('mnt.' .. getallfilesi("mnt", aiter + 1) .. ".dsi"):main()
        else
            print("incorrect entry in rc!")
        end
    else
        dofile("./mnt/" .. image_filename .. ".dsi")
    end
end
