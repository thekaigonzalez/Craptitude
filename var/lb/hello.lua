local self = {}

function self:main(arg)

    local string = "Hello, World!"
    if arg[1] == "-h" then
        print("Hello World Program that prints hello world")
        print("Flags & Options:")
        print("\t-tr, Traditional Print")
        print("\t-ns, No Symbols")
        print("\t-o, One Word")
    end

    if arg[1] == "-tr" then
        string = "Hello, World!"
    end
    if arg[1] == "-ns" then
        string = "Hello World"
    end
    if arg[1] == "-o" then
        string = "Hello"
    end

    if arg[1] == "hello" then
        print("Don't tell me hello, I'm telling you hello >:(")
    else
        print(string)
    end

end

return self