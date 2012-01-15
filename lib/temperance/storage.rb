# -*- coding: utf-8 -*-
module  Temperance

  class Storage

    def push_hash h
      f = File.open(STORAGE_FILE, 'w')
      f.write h.to_json
      f.close
      nil
    end

    def get_hash
      begin
        f = File.open(STORAGE_FILE, 'r')
      rescue
        return Hash.new
      end
      h = JSON.parse(f.read)
      f.close
      h
    end

    def push k, v
      h = get_hash
      h[k] = v
      push_hash h
    end

    def pull k
      get_hash[k]
    end

    def initialize
      
    end

  end
end
