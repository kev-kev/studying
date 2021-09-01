# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    return strs[0] if strs.length === 1
    strs.sort!
    res = strs[0]
    strs[1..-1].each do |str|
        i = 0
        str.each_char do |c|
            res = res[0...i] if c != res[i]
            i += 1
        end
    end
    res
end