default['ovs']['bonds'] =
  [ { "name"        => "bond0",
      "bridge_name" => "ovsbr0",
      "nics"        => ["eth0", "eth2"],
      "lacp_mode"   => "active",          # should be one of: active, passive, off
      "bond_mode"   => "balance-tcp",     # one of: balance-tcp, active-passive
      "lacp_time"   => "fast"
    },
    { "name"        => "bond1",
      "bridge_name" => "ovsbr1",
      "nics"        => ["eth1", "eth3"],
      "lacp_mode"   => "active",          # should be one of: active, passive, off
      "bond_mode"   => "balance-tcp",     # one of: balance-tcp, active-passive
      "lacp_time"   => "fast"
    }
  ]
