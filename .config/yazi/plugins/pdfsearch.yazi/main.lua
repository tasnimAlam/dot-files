-- pdfsearch.lua
-- Yazi plugin to search for text in PDF files using pdfgrep with Yazi's input field

local M = {}

-- Function to execute pdfgrep and collect results
function M.search_pdf(word)
    if not word or word == "" then
        ya.notify({ title = "PDF Search", content = "Please provide a search term", timeout = 3 })
        return
    end

    -- Escape the word to handle special characters
    local escaped_word = word:gsub('([\\"])', '\\%1')

    -- Construct the pdfgrep command
    -- -r: recursive, -i: case-insensitive, --include: only PDF files
    local cmd = string.format('pdfgrep -r -i --include "*.pdf" "%s" .', escaped_word)

    -- Execute the command and capture output
    local handle = io.popen(cmd .. " 2>/dev/null")
    if not handle then
        ya.notify({ title = "PDF Search", content = "Failed to execute pdfgrep", timeout = 3 })
        return
    end

    local result = handle:read("*a")
    handle:close()

    -- Process the output
    local files = {}
    for line in result:gmatch("[^\r\n]+") do
        -- pdfgrep output format: "filename:page:match"
        -- Extract the filename (before the first colon)
        local filename = line:match("^[^:]+")
        if filename and not files[filename] then
            files[filename] = true
            table.insert(files, filename)
        end
    end

    -- If no results, notify the user
    if #files == 0 then
        ya.notify({ title = "PDF Search", content = string.format('No PDFs found containing "%s"', word), timeout = 3 })
        return
    end

    -- Format the output as a list of files
    local output = table.concat(files, "\n")

    -- Display results in Yazi's preview
    ya.preview({
        title = string.format('PDFs containing "%s"', word),
        content = output,
        filetype = "text",
    })
end

-- Plugin entry point
function M.entry(_)
    -- Prompt the user for input using Yazi's input API
    ya.input({
        title = "Search PDFs for text",
        value = "", -- Default empty input
        on_submit = function(word)
            M.search_pdf(word)
        end,
        on_cancel = function()
            ya.notify({ title = "PDF Search", content = "Search cancelled", timeout = 3 })
        end,
    })
end

-- Plugin setup
return {
    entry = M.entry,
    name = "pdfsearch",
    condition = { filetype = "directory" }, -- Only trigger in directories
}
