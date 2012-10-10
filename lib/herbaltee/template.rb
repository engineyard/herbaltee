module Herbaltee
  class Template
    attr_reader :content, :vars

    def initialize(file, vars)
      @content = File.open(file).read
      @vars = vars
    end

    def render
      b = Binder.new(@vars).__binding__
      template = ERB.new(@content)
      template.result(b)
    end

    def write(target)
      if File.exists?(target)
        FileUtils.cp(target, [target, Herbaltee.now].join('.'))
      end
      File.open(target, 'w') {|f| f.write(render)}
    end
  end
end
