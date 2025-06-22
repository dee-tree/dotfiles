local wezterm = require 'wezterm'
local utils = require 'dotlocal.utilua'

local module = {}

local haslocaldomains, localdomains = prequire 'dotlocal.local-domains'
function module.apply_to_config(config)
    if haslocaldomains then
        localdomains.apply_to_config(config)
    else
        config.ssh_domains = {}
    end
    ssh_domains = {
    -- {
        -- name = 'ssh.remote.name',
        -- remote_address = 'ip.address<:port>',
        -- username = 'user'
    -- }
    }

    for k,v in pairs(ssh_domains) do config.ssh_domains[k] = v end
end

return module