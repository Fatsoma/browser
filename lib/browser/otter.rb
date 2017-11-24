# frozen_string_literal: true

module Browser
  class Base
    # Detect if browser is Otter.
    def otter?(expected_version = nil)
      Otter.new(ua).match? &&
        detect_version?(full_version, expected_version)
    end
  end

  class Otter < Base
    VERSION_REGEX = %r[Otter/([\d.]+)]
    MATCH_REGEX = /Otter/
    NAME = "Otter".freeze

    def id
      :otter
    end

    def name
      NAME
    end

    def full_version
      ua[VERSION_REGEX, 1] || DEFAULT_FULL_VERSION
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end

  matchers.unshift(Otter)
end
