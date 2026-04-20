utils = {}

--abbreviate any number
function utils:abbreviateNumber(num)
    if num >= 1e9 then
        return string.format("%.1fB", num / 1e9)
    elseif num >= 1e6 then
        return string.format("%.1fM", num / 1e6)
    elseif num >= 1e3 then
        return string.format("%.1fK", num / 1e3)
    elseif num > 1 then
        return string.format("%.1f", num / 1)
    else
        return tostring(num)
    end
end

return utils