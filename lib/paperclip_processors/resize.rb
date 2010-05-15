require 'RMagick'

module Paperclip
  class Resize < Processor

    def initialize(file, options = {}, attchment = nil)
      @file = file
      @options = options
      @extension = File.extname(@file.path)
      @basename = File.basename(@file.path, @extension)
    end
    
    def make
      img = Magick::Image::read(File.expand_path(@file.path)).first

      if @options[:is_horizontal]
        width, height = @options[:width], @options[:height]
      else
        width, height = @options[:height], @options[:width]
      end

      img = img.resize(width, height)
      destination = Tempfile.new([@basename, 'jpg'].compact.join('.'))
      destination.binmode
      img.write(File.expand_path(destination.path)) do
        self.compression = Magick::JPEGCompression
        self.quality = 50
      end
      destination
    end

  end
end
