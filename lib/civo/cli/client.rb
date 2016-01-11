module Civo
  class Client
    def self.tabulate(hash, titles, options = {})
      longest_key_length = hash.keys.max_by(&:length).try(:length) || 5

      default = hash.delete("**DEFAULT**")
      title = "%-#{longest_key_length}s | %s" % [titles[0], titles[1]]
      puts title
      puts "%s-|-%s" % [("-" * longest_key_length), ("-" * (69-longest_key_length))]
      keys = hash.keys
      keys.sort! if options[:sort] == true
      keys.each do |key|
        value = hash[key]
        print "%-#{longest_key_length}s | %s" % [key, value]
        if key == default
          print " (DEFAULT)"
        end
        puts
      end
    end

    def self.tabulate_flexirest(data, mappings)
      columns = mappings.dup
      columns.each do |k, nice|
        columns[k] = {max_width: (nice.length > 5 ? nice.length : 5), label: nice }
      end

      data.each do |record|
        columns.each do |k, v|
          if block_given?
            yield record
          end
          length = record.send(k).to_s.length
          if record.send(k).to_s.length > v[:max_width]
            v[:max_width] = length
          end
        end
      end

      puts columns.keys.map {|k| "%-#{columns[k][:max_width]}s" % columns[k][:label] }.to_a.join(" | ")
      puts columns.keys.map {|k| "-" * columns[k][:max_width] }.to_a.join("-+-")

      data.each do |record|
        row = []
        columns.each do |k, v|
          value = record.send(k)
          if value.is_a? Array
            value = value.join(", ")
          end
          row << "%-#{columns[k][:max_width]}s" % value
        end
        puts (row.join(" | "))
      end
    end
  end
end
