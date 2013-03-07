require 'pseudo_model/version'
require 'active_model'

module PseudoModel
  class Base
    include ActiveModel::Validations
    include ActiveModel::Validations::Callbacks
    include ActiveModel::Conversion

    def initialize(attributes = {})
      raise TypeError, '`attributes` must be a Hash or respond to :to_hash or :to_h' unless attributes.is_a?(Hash) || attributes.respond_to?(:to_hash) || attributes.respond_to?(:to_h)
      attributes = attributes.to_hash rescue attributes.to_h unless attributes.is_a?(Hash)
      
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def persisted?
      false
    end
  end
end
