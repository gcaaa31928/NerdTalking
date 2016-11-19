module Errors
    class BaseResponseError < StandardError
        attr_reader :error_code
        def initialize(msg, error_code)
            @error_code = error_code
            super(msg)
        end
    end
    class ForbiddenError < BaseResponseError ;end
end