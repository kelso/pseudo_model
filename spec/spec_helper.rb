require 'bundler/setup'
require 'pseudo_model'
require 'pathname'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  
  config.order = 'random'
end

Dir[ Pathname.new(__FILE__).dirname.join('support', '**', '*.rb') ].each { |f| require f }