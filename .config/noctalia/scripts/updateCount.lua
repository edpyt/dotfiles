-- Pacman Update Count — Arch update checker (Pacman + AUR)
-- Author - Sovereign (modified)

barWidget.define({
    label = "Pacman Update Count",
    icon = "packages",
    description = "Shows Pacman + AUR update count.",
    settings = {
        {
            key = "update_interval",
            type = "int",
            label = "Update check interval (minutes)",
            default = 60,
            min = 30,
            max = 720,
        },
        {
            key = "aur_helper",
            type = "select",
            label = "AUR Helper",
            default = "paru",
            options = {
                { label = "Paru", value = "paru" },
                { label = "Yay",  value = "yay" },
            },
        },
        {
            key = "terminal",
            type = "string",
            label = "Terminal",
            default = "foot",
        },
    },
})

barWidget.setGlyph("packages")

local update_interval = barWidget.getConfig("update_interval", 60) * 60 * 1000
barWidget.setUpdateInterval(update_interval)

local aur_helper = barWidget.getConfig("aur_helper", "paru")
local terminal = barWidget.getConfig("terminal", "foot")

local function setTooltip()
    barWidget.setTooltip({
        { key = "Left Click",  value = "Refresh update count" },
        { key = "Right Click", value = "Run system update" },
        { key = "AUR Helper",  value = aur_helper },
        { key = "Terminal",    value = terminal },
    })
end

local function checkCommandsExists()
    local arr = { aur_helper, "checkupdates" }

    for _, v in ipairs(arr) do
        if not noctalia.commandExists(v) then
            noctalia.notifyError("Pacman Update Count", v .. " is not installed.")
            return false
        end
    end
    return true
end

local function checkForUpdates()
    local cmd = string.format(
        "total_updates=$(( $(%s -Qua | wc -l) + $(checkupdates | wc -l) )) && echo $total_updates",
        aur_helper
    )

    noctalia.runAsync(cmd, function(result)
        local updateCount = (result.stdout or ""):gsub("%s+", "")

        if updateCount:match("^%d+$") then
            barWidget.setText(updateCount)
        else
            noctalia.notifyError("Pacman Update Count", "Invalid output: " .. updateCount)
            barWidget.setText("??")
        end
    end)
end

local function runUpdates()
    local cmd =
        string.format("%s sh -c '%s -Syu; echo; echo Done. Press enter to close...; read'", terminal, aur_helper)

    noctalia.runAsync(cmd)
end

function update()
    barWidget.setText("--")
    setTooltip()

    if not checkCommandsExists() then
        return
    end

    checkForUpdates()
end

function onClick()
    update()
end

function onRightClick()
    runUpdates()
end

function onIpc(event, payload)
    if event == "refresh" then
        update()
    end
end
