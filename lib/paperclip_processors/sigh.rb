require 'RMagick'

module Paperclip
  class Sign < Processor

    def initialize(file, options = {}, attachment = nil)
      @file = file
      @options = options
      @extension = File.extname(@file.path)
      @basename = File.basename(@file.path, @extension)
    end

    def make
      img = Magick::Image::read(File.expand_path(@file.path)).first
      text = Magick::Draw.new
      text.annotate(img, 0, 0, 0, img.rows - 20, @options[:signature]) do
        self.align = Magick::LeftAlign
        self.pointsize = 18
        self.stroke_width = 0
        self.fill = 'white'
        self.undercolor = 'gray'
      end
      destination = Tempfile.new([@basename, @extension].compact.join('.'))
      destination.binmode
      img.write(File.expand_path(destination.path))
      destination
    end

  end
end
