require 'json'

module Goggleme
  class Store
    def initialize
      @path = File.join(Dir.home, '.goggleme')
    end

    def put(data)
      File.open(@path, "w") do |f|
        f.write data.to_json
      end
    end

    def get
      return unless File.file?(@path)

      JSON.parse(File.read(@path))
    end
  end
end