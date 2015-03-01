
def whyrun_supported?
  true
end

action :install do

  if @current_resource.exists
    Chef::Log.info "Scenario #{@new_resource} already exists - nothing to do."
  else
    converge_by("Add scenario #{@new_resource}") do
      add_scenario
    end
  end
end

def add_scenario
  download_and_extract(@new_resource.url, @new_resource.scenario_title)

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

def download_and_extract(url, title)
  Chef::Log.info "Downloading #{title} from #{url}..."
  # Work out the extension of the scenario archive
  file_extension=url.split('.').last

  # Retrieve the file
  remote_file "#{Chef::Config[:file_cache_path]}/#{title}.#{file_extension}" do
    source url
  end

  # Create directory to store archive contents
  directory "#{Chef::Config[:file_cache_path]}/#{title}" do
    action :create
  end

  # Extract the archive
  bash "extract-scenario" do
    cwd "#{Chef::Config[:file_cache_path]}/#{title}"
    code "7za x ../#{title}.#{file_extension}"
    only_if { Dir.entries("#{Chef::Config[:file_cache_path]}/#{title}").length == 2 }
  end
end

def load_current_resource
  @current_resource = Chef::Resource::Arma3Scenario.new(@new_resource.name)
  @current_resource.name(@new_resource.name)
  @current_resource.scenario_title(@new_resource.scenario_title)
  @current_resource.url(@new_resource.url)

  if scenario_exists?(@current_resource.url, @current_resource.scenario_title)
    @current_resource.exists = true
  end

  @current_resource
end

def scenario_exists?(url, title)

  Chef::Log.info "Checking existance of #{title} from #{url}..."

  download_and_extract(url, title)

  # Check each extracted file
  ::Dir.entries("#{Chef::Config[:file_cache_path]}/#{title}").each do |f|
    # Ignore special files (this and parent dirs)
    unless f == '.' || f == '..'
      # If any one file doens't exist in the missions directory, we return false
      return false unless ::File.exist?("#{node['arma3']['install_base']}/arma3_ds/mpmissions/#{f}")
    end
  end

  # Return true if the above loop finishing normally: it's safe to assume the scenario already
  # installed.
  return true
end

