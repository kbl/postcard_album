require 'RMagick'

module Paperclip
  class AddWatermark < Processor

    def initialize(file, options = {}, attachment = nil)
      @file = file
      @options = options
      @extension = File.extname(@file.path)
      @basename = File.basename(@file.path, @extension)
    end

    def make
      #skip signing if there is no signature
      return @file unless @options[:signature]

      watermark = Magick::Image.new(@options[:width], @options[:height]) do
          self.background_color = 'none'
      end

      text = Magick::Draw.new
      text.annotate(watermark, 0, 0, 0, 0, @options[:signature]) do
        self.gravity = Magick::CenterGravity
        self.pointsize = 50
        self.fill = "white"
        self.stroke = "none"
      end

      img = Magick::Image::read(File.expand_path(@file.path)).first
      img = img.watermark(watermark, 0.25, 0, Magick::EastGravity)

      destination = Tempfile.new([@basename, @extension].compact.join('.'))
      destination.binmode
      img.write(File.expand_path(destination.path))
      destination
    end

  end
end
