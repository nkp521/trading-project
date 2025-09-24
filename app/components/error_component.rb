class ErrorComponent < ViewComponent::Base
  def initialize(object:)
    @object = object
  end

private

  attr_reader :object

  def errors
    object.errors.full_messages
  end
end
