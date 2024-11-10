local notify = {}

---@param id string
---@param title string
---@param description string
function notify.notifyError(id, title, description)
    lib.notify({
        id = id,
        title = title,
        description = description,
        position = 'top',
        duration = 3000,
        type = 'error'
    })
end

---@param id string
---@param title string
---@param description string
function notify.notifySuccess(id, title, description)
    lib.notify({
        id = id,
        title = title,
        description = description,
        position = 'top',
        duration = 3000,
        type = 'success'
    })
end

return notify