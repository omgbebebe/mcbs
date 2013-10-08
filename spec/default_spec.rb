require "chefspec"

describe "ovs::default" do
#  let (:chef_run) { ChefSpec::ChefRunner.new.converge "ovs::default" }
  chef_run = ChefSpec::ChefRunner.new do |node|
#    node.set['ovs']['bonds'] = {"bond0" => "bebebe"}

  end
  chef_run.converge "ovs::default"

  it "should install openvswitch with kmod" do
    pending "don't install right now."
  end

  it "should create new bonds with the appropriate NICs" do
    chef_run.node['ovs']['bonds'].each do |bond|
      chef_run.should execute_bash_script("creating bond #{bond['name']}")
    end
  end
end
