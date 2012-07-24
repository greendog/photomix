# Load the rails application
require File.expand_path('../application', __FILE__)

# Load app vars from local file
photomix_env = File.join(Rails.root, 'config', 'photomix.rb')
load(photomix_env) if File.exists?(photomix_env)

# Initialize the rails application
Photomix::Application.initialize!