require 'RMagick'

module Paperclip
  class AddBorder < Processor

    def initialize(file, options = {}, attchment = nil)
      @file = file
      @options = options
      @extension = File.extname(@file.path)
      @basename = File.basename(@file.path, @extension)
    end
    
    def make
      img = Magick::Image::read(File.expand_path(@file.path)).first
      img = img.border(@options[:border_inner], @options[:border_inner], 'white')
      img = img.border(@options[:border_outer], @options[:border_outer], 'black')
      destination = Tempfile.new([@basename, @extension].compact.join('.'))
      destination.binmode
      img.write(File.expand_path(destination.path))
      destination
    end

  end
end
