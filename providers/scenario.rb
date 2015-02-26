
def whyrun_supported?
  true
end

action :install do

  add_scenario

  new_resource.updated_by_last_action(true)

end

def add_scenario
  # Work out the extension of the scenario archive
  file_extension=new_resource.url.split('.').last

  # Retrieve the file
  remote_file "#{Chef::Config[:file_cache_path]}/#{new_resource.scenario_title}.#{file_extension}" do
    source new_resource.url
  end

  # Create directory to store archive contents
  directory "#{Chef::Config[:file_cache_path]}/#{new_resource.scenario_title}" do
    action :create
  end

  # Extract the archive
  bash "extract-scenario" do
    cwd "#{Chef::Config[:file_cache_path]}/#{new_resource.scenario_title}"
    code "7za x ../#{new_resource.scenario_title}.#{file_extension}"
    only_if { Dir.entries("#{Chef::Config[:file_cache_path]}/#{new_resource.scenario_title}").length == 2 }
  end

  # Copy extracted file(s) to mpmissions directory
  bash "copy-scenario" do
    code <<EOT
      # Get file list
      files=`ls #{Chef::Config[:file_cache_path]}/#{new_resource.scenario_title}`

      # Iterate over directory entries
      for f in $files
      do
        if [[ ! -f #{node['arma3']['install_base']}/arma3_ds/mpmissions/$f ]]
        then
          cp #{Chef::Config[:file_cache_path]}/#{new_resource.scenario_title}/$f #{node['arma3']['install_base']}/arma3_ds/mpmissions/
        fi
      done
EOT
  end
end

