
include_recipe "arma3"

arma3_scenario "invade_annex" do
  url "https://s3-eu-west-1.amazonaws.com/aztek-native-arma3-assets/scenarios/co40AWInvade-Annex_v2.88BETA.7z"
  action :install
  notifies :restart, "service[arma3server]", :delayed
end

