local M = {}

local theme_file = vim.fn.stdpath("config") .. "/theme.lua"

local function in_list(name)
  for _, scheme in ipairs(M.available()) do
    if scheme == name then
      return true
    end
  end
  return false
end

local function write_theme(name)
  local file = io.open(theme_file, "w")
  if not file then
    return false
  end
  file:write(string.format("return { name = %q }\n", name))
  file:close()
  return true
end

function M.get_saved()
  local ok, data = pcall(dofile, theme_file)
  if not ok then
    return nil
  end
  if type(data) == "table" and type(data.name) == "string" then
    return data.name
  end
  return nil
end

function M.available()
  local names = vim.fn.getcompletion("", "color")
  local unique = {}
  for _, name in ipairs(names) do
    if type(name) == "string" and name ~= "" then
      unique[name] = true
    end
  end
  local list = vim.tbl_keys(unique)
  table.sort(list)
  return list
end

function M.apply(name)
  if type(name) ~= "string" or not in_list(name) then
    return false
  end
  local ok = pcall(vim.cmd.colorscheme, name)
  return ok
end

function M.set(name)
  if not M.apply(name) then
    return false
  end
  return write_theme(name)
end

function M.apply_saved()
  local saved = M.get_saved()
  if saved and M.apply(saved) then
    return true
  end
  local available = M.available()
  if #available > 0 then
    local fallback = "default"
    if not in_list(fallback) then
      fallback = available[1]
    end
    M.apply(fallback)
    write_theme(fallback)
    return true
  end
  return false
end

return M