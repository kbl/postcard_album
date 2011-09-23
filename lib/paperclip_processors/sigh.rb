require 'RMagick'

class Sign < Paperclip::Processor

  def initialize(file, options = {}, attachment = nil)
    @file = file
    @options = options
    @extension = File.extname(@file.path)
    @basename = File.basename(@file.path, @extension)
  end

  def make
    #skip signing if there is no signature
    return @file unless @options[:signature]

    img = Magick::Image::read(File.expand_path(@file.path)).first
    text = Magick::Draw.new
    text.annotate(img, 0, 0, 0, img.rows - 20, @options[:signature]) do
      self.align = Magick::LeftAlign
      self.pointsize = 30
      self.stroke_width = 2
      self.fill = 'red'
    end
    destination = Tempfile.new([@basename, @extension].compact.join('.'))
    destination.binmode
    img.write(File.expand_path(destination.path))
    destination
  end

end
