local arg = require("deps.argparse")

local pser = arg("diskutility", "Run Disks")

pser:argument("DISK", "the disk to run. This is REQUIRED!")

pser:flag("-v --verbose")
pser:option("-e --entry", "The Entry to run the file at. Either [main|any]", "any")
pser:option("-i --iargs", "Adds these arguments to the entry as an array."):count("*")
local args = pser:parse()

if args["verbose"] then
    print("Loading Disk\nadding file to loadfile")
    local file = loadfile(args["DISK"])
    print("adding disk to a variable and running")
    if args["entry"] == "any" then
        file()
    elseif args["entry"] == "main" then
        file():main(args["iargs"]);
    end
end