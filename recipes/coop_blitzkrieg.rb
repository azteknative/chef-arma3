
include_recipe "arma3"

arma3_scenario "blitzkrieg" do
  url "https://s3-eu-west-1.amazonaws.com/aztek-native-arma3-assets/scenarios/Blitzkrieg_A3_2014_12_03.7z"
  action :install
  notifies :restart, "service[arma3server]", :delayed
end

