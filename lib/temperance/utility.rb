# -*- coding: utf-8 -*-
module  Temperance
  module Utility
    def time_formatter(i)
      "#{i/60/60/24}日と#{i/60/60%24}時間#{i/60%60}分#{i%60}秒"
    end
    module_function :time_formatter
  end
end
