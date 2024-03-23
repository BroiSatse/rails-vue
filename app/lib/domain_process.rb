# frozen_string_literal: true

class DomainProcess < Contract
  def self.call(**)
    new(**).call
  end

  # rubocop:disable Naming/MemoizedInstanceVariableName
  def call
    return @result if defined?(@result)

    return @result = failure(errors.messages) unless valid?

    @result = catch :failure do
      catch :success do
        ApplicationRecord.transaction do
          perform!
        end
      end
    end
  end
  # rubocop:enable Naming/MemoizedInstanceVariableName

  private

  def success(payload = nil)
    Result.new(true, payload, {})
  end

  def failure(errors, payload: nil)
    errors = { base: errors } if errors.is_a? String
    Result.new(false, payload, errors)
  end

  def success!(...)
    throw :success, success(...)
  end

  def failure!(errors, payload: nil)
    throw :failure, failure(errors, payload:)
  end
end
