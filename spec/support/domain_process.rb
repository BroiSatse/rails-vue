# frozen_string_literal: true

module Support
  module DomainSupport
    extend RSpec::Matchers::DSL

    define :have_payload do |payload_matcher|
      match do |actual|
        payload_matcher === actual.payload # rubocop:disable Style/CaseEquality
      end
    end

    RSpec.configure do |rspec|
      rspec.include self, type: :domain_process
    end
  end
end
