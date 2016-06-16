module WIPSkip
  class Matcher
    def initialize(message)
      @message = message.to_s
    end

    def skip?
      !!(@message =~ /wip/i)
    end
  end
end
