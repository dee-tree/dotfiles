local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.ssh_domains = {
    {
        name = 'ssh.remote.name',
        remote_address = 'ip.address<:port>',
        username = 'user'
    }
    }
end

return module