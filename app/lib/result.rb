# frozen_string_literal: true

Result = Struct.new(:success, :payload, :errors) do
  def success?
    success
  end

  def failure?
    !success
  end

  def inspect
    if success
      "Success: #{payload.inspect}"
    else
      "Failure: #{errors.inspect}"
    end
  end

  def pretty_print(out)
    out.text success? ? 'Success' : 'Failure'
    out.breakable
    out.pp success? ? payload : errors
  end

  private :success
end
