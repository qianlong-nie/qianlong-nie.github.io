# 检查 _data 里所有 { zh, en } 双语对象：必须恰好有 zh 和 en 两个字段。
# 行内写法里，没加引号的英文一遇到逗号就会被截断，这里能发现这种错误。
require "yaml"

def check(obj, path, file, errors)
  case obj
  when Hash
    if obj.key?("zh") || obj.key?("en")
      errors << "#{file} #{path}: #{obj.keys.inspect}" unless obj.keys.sort == %w[en zh]
    else
      obj.each { |k, v| check(v, "#{path}/#{k}", file, errors) }
    end
  when Array
    obj.each_with_index { |v, i| check(v, "#{path}[#{i}]", file, errors) }
  end
end

errors = []
Dir["_data/*.yml"].sort.each { |f| check(YAML.load_file(f), "", f, errors) }
puts errors.empty? ? "OK: 所有双语字段完整" : errors
exit(errors.empty? ? 0 : 1)
