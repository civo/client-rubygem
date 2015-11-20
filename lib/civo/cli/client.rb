module Civo
  class Client
    def self.tabulate(hash, titles, options = {})
      longest_key_length = hash.keys.max_by(&:length).try(:length) || 5

      default = hash.delete("**DEFAULT**")
      puts "%-#{longest_key_length}s %s" % [titles[0], titles[1]]
      keys = hash.keys
      keys.sort! if options[:sort] == true
      keys.each do |key|
        value = hash[key]
        print "%-#{longest_key_length}s %s" % [key, value]
        if key == default
          print " (DEFAULT)"
        end
        puts
      end
    end
  end
end
