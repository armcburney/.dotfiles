# frozen_string_literal: true

require "json"

module Model
  class Base
    # Serializes a Model to a JSON representation.
    #
    # @return [String]
    def serialize!
      model = instance_variables.reduce({}) do |hash, var|
        hash.merge(var.to_s.delete("@") => serialize_ivar!(var))
      end
      model["type"] = self.class
      model.to_json
    end

    # Deserializes a JSON representation back to a Model.
    #
    # @param [String]
    # @return [Model]
    def self.deserialize!(json)
      params = JSON.parse(json).reduce({}) do |hash, (var, val)|
        hash.merge(var.to_sym => deserialize_ival!(val))
      end

      type = params[:type]
      params.delete(:type)
      Object.const_get(type).new(**params)
    end

    private

    # @return [String]
    def serialize_ivar!(var)
      ivar = instance_variable_get(var)
      case ivar
      when Array
        ivar.map { |v| v.is_a?(Model::Base) ? v.serialize! : v }
      when Model::Base
        ivar.serialize!
      else
        ivar
      end
    end

    # @param [String]
    # @return [Object]
    def self.deserialize_ival!(val)
      return nil if val.nil?

      case val
      when Array
        val.map { |v| deserialize!(v) }
      when Hash
        deserialize!(val)
      else
        val
      end
    end
  end
end
