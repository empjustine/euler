require 'yaml'

result = YAML.load_file("./return.yml")

result.each_index { |index|
    puts ' ' + '-' * 78
    puts problem = "problem_%04d.rb" % (index + 1)
    puts test = `ruby #{problem}`
    puts test.match(result[index].to_s) ? "ok" : "failed #{' <' * 36 }"
}