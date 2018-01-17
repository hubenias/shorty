# Devoted to fabulous Trombone Shorty
class Shorty
  class << self
    # 1. Replace ranges in the given string with the shortened form. e. g. `'abcdab987612' => 'a-dab9-612`
    def reduce(string)
      return unless string
      res = reduce_string(string)
      reduce_string(res, true)
    end

    private

    def reduce_string(string, reversed_mode = false)
      string = string.reverse if reversed_mode
      ranges = find_ranges(string)
      result = reduce_ranges(ranges).join
      reversed_mode ? result.reverse : result
    end

    def find_ranges(string)
      ranges = []
      string.each_char do |ch|
        if (curr_range = ranges.last)
          curr_range[-1].next == ch ? curr_range << ch : ranges << ch
        else
          ranges << ch
        end
      end
      ranges
    end

    def reduce_ranges(ranges)
      ranges.map { |r| r.length > 2 ? "#{r[0]}-#{r[-1]}" : r }
    end
  end
end