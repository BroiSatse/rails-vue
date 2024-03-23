# frozen_string_literal: true

module Contract::ModelAttribute
  extend ActiveSupport::Concern

  Definition = Struct.new(:name, :scope, :find_by, :suffix, keyword_init: true) do
    def initialize(scope: nil, find_by: :id, suffix: :id, **)
      scope = scope&.all
      super(scope:, find_by:, suffix:, **)
    end

    def get(*keys)
      to_h.slice(*keys).values
    end

    def attribute_name
      [name, suffix].join('_')
    end

    def scope=(value)
      super(value.all)
    end

    def find!(value)
      value && scope.find_by!(find_by => value)
    end

    def validate_model!(model)
      return if model.nil? || model.is_a?(scope.klass)

      raise "Invalid value for #{name} - expected nil or instance of #{scope.class}, received #{model}"
    end
  end

  module ClassMethods
    def attribute(name, *, model: nil, **)
      return super(name, *, **) unless model

      model = { scope: model } unless model.is_a?(Hash)
      definition = Definition.new(name:, **model)
      super(definition.attribute_name, *, **)

      include Builder.new(definition).()
    end
  end

  class Builder
    attr_reader :definition

    def initialize(definition)
      @definition = definition
    end

    def call
      Module.new.tap do |mod|
        define_model_getter(mod)
        define_model_setter(mod)
        define_attribute_setter(mod)
      end
    end

    private

    def define_model_getter(mod)
      model_name = definition.name
      definition = self.definition

      mod.define_method model_name do
        return _models[model_name] if _models.key?(model_name)

        _models[model_name] = definition.find!(send(definition.attribute_name))
      end
    end

    def define_model_setter(mod)
      name = definition.name
      definition = self.definition

      mod.define_method :"#{name}=" do |value|
        definition.validate_model!(value)
        send(:"#{definition.attribute_name}=", value&.send(definition.find_by))
        _models[name] = value
      end
    end

    def define_attribute_setter(mod)
      name = definition.name

      mod.define_method :"#{definition.attribute_name}=" do |value|
        super(value)
        _models.delete(name)
      end
    end
  end

  def _models
    @_models ||= {}
  end
end
