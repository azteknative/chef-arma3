
include_recipe "arma3"

arma3_scenario "20_20_Co-02" do
  url "https://s3-eu-west-1.amazonaws.com/aztek-native-arma3-assets/scenarios/co02_20-20_v1-0.stratis.7z"
  action :install
  notifies :restart, "service[arma3server]", :delayed
end

