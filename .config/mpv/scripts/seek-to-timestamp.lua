local utils = require 'mp.utils'

function seek_to_timestamp()
    local timestamp = utils.subprocess({
        args = {"bemenu", "-p", "Enter timestamp (HH:MM:SS):"},
        capture_stdout = true
    })

    if timestamp.status == 0 then
        local time_parts = {}
        for part in timestamp.stdout:gmatch("%d+") do
            table.insert(time_parts, tonumber(part))
        end

        local seconds = 0
        if #time_parts == 3 then  -- HH:MM:SS
            seconds = time_parts[1] * 3600 + time_parts[2] * 60 + time_parts[3]
        elseif #time_parts == 2 then  -- MM:SS
            seconds = time_parts[1] * 60 + time_parts[2]
        elseif #time_parts == 1 then  -- SS
            seconds = time_parts[1]
        else
            mp.osd_message("Invalid timestamp format")
            return
        end

        mp.commandv("seek", seconds, "absolute")
        mp.osd_message(string.format("Seeking to %s", timestamp.stdout:gsub("\n", "")))
    end
end

mp.add_key_binding("Alt+g", "seek_to_timestamp", seek_to_timestamp)
