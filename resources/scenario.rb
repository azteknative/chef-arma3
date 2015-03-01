
actions :install
default_action :install

attribute :scenario_title, :name_attribute => true, :kind_of => String,
            :required => true

attribute :url, :kind_of => String, :default => nil, :required => true

attr_accessor :exists

