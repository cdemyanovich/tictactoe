module IoHelper
  
  class Output
    def messages
      @messages ||= []
    end

    def puts(message)
      messages << message
    end
  end

  def output
    @output ||= Output.new
  end
  
end

World(IoHelper)
