require("liblfds")
local a = {}

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function OneTimeSplit(string)
    local tblt = {}
    local lns = split(string, " ")
    i = 0
    -- works!

    for _,V in ipairs(lns) do
        tblt[i] = V;
        i = i + 1
    end
    return tblt
end

function a:main(CODE)
    --- FreeKSD-based signal system
    if CODE == 0x01 then

        print("lua tty successful login on disk0")
        while true do
            local command = readline(pwd() .. "$ ")
            local cargv = OneTimeSplit(command)
            --- first, check if a file exists by command then run if it is.
            if io.open(command) ~= nil then
                local fileS = loadfile(command) or nil
                if fileS == nil then
                    print("failed to load function command(): might be a directory")
                else
                    fileS():main(cargv);
                end
            elseif io.open("./var/lb/" .. cargv[0] .. ".lua") ~= nil then
                local fileS = loadfile("./var/lb/" .. cargv[0] .. ".lua") or nil
                if fileS == nil then
                    print("failed to load function command(): might be a directory")
                end
                fileS():main(cargv)
            elseif io.open("./var/lb/" .. cargv[0] .. ".lsh") ~= nil then
                local fileS = loadfile("./var/lb/" .. cargv[0] .. ".lsh") or nil
                if fileS == nil then
                    print("failed to load function command: might be a directory")
                else
                    print(fileS())

                end
            elseif io.open("./var/lb/" .. cargv[0]) ~= nil then
                local fileS = loadfile("./var/lb/" .. cargv[0]) or nil
                if fileS == nil then
                    print("failed to load function command(): might be a directory")
                else
                    fileS():main(cargv)

                end
            else
                print("bash: not a command, " .. cargv[0] .. ".")
            end



        end
    else
        print("failed lua tty login")
    end
end

return a