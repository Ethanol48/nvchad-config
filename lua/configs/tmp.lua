-- list_mason_functions.lua
local mason = require("mason-registry").get_installed_package_names();


for i = 1, #mason do
    print(mason[i])
end

-- -- Iterar y mostrar las funciones expuestas por mason
-- for name, func in pairs(mason) do
--   if type(func) == "function" then
--     print(name)  -- Imprime el nombre de la función
--   end
-- end

