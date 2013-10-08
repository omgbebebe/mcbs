#
# Cookbook Name:: ovs
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node['ovs']['bonds'].nil? or node['ovs']['bonds'].empty? then
  Chef::Application.fatal!("At least one bond should be defined!")
end

Chef::Log.info("bebebe: #{node['ovs']['bonds']}")

node['ovs']['bonds'].each do |bond|
  nics = bond['nics']
  if nics.nil? or nics.length < 2 then
    Chef::Application.fatal!("NICs list should contain at least two interfaces!")
  end

  bond_name  = bond["name"]
  br_name    = bond['bridge_name']
  lacp_mode  = bond['lacp_mode']
  lacp_time  = bond['lacp_time']
  bond_mode  = bond['bond_mode']

  bash "creating bond #{bond_name}" do
    user "root"
    code <<-EOF
      ovs-vsctl add-br #{br_name} \
      && ovs-vsctl add-bond #{br_name} \
      #{bond_name} #{nics.join(' ')} \
      lacp=#{lacp_mode} bond_mode=#{bond_mode} \
      other_config:lacp-time=#{lacp_time}
    EOF
  end
end
