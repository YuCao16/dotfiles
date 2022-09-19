local function readAll(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

-- local token = readAll("/home/caoyu/.config/sourcery/tokenizer.txt")
local token_ok, token =
    pcall(readAll, "/home/caoyu/.config/sourcery/tokenizer.txt")
if not token_ok then
    return
end

token = string.gsub(token, "\n", "")
return {
    init_options = {
        token = token,
    },
}
