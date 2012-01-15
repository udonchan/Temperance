# -*- coding: utf-8 -*-
module  Temperance

  class App
    
    START_TIME_KEY = 'start'

    def current_status
      if @start == -1
        "禁" + KIND_OF_TEMPERANCE + "してません"
      else 
        "#{Utility.time_formatter(@now - @start)}間禁" + KIND_OF_TEMPERANCE + "しています";
      end
    end
    
    def fail_temperance
      @storage.push(START_TIME_KEY, "#{@start = -1}\n");
    end

    def init_temperance
      @storage.push(START_TIME_KEY, "#{@now}\n")
      @start = @now
    end

    def run argv
      case argv.first
      when nil
      when 'init'
        init_temperance
      when 'failed'
        fail_temperance
      else
        puts "illegal option #{argv.join " "}"
      end
      puts current_status 
    end

    def initialize
      @storage = Temperance::Storage.new
      @now = Time.now.to_i
      if (t = @storage.pull(START_TIME_KEY)).nil?
        init_temperance
      else
        @start = t.to_i
      end
    end
  end

end
