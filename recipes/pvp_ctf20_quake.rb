
include_recipe "arma3"

arma3_scenario "ctf20_quake" do
  url "https://s3-eu-west-1.amazonaws.com/aztek-native-arma3-assets/scenarios/ctfx_ctf2-quake_v10-28-2014.stratis.7z"
  action :install
  notifies :restart, "service[arma3server]", :delayed
end

