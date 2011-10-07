require 'iconv'

module PostcardAlbum
  module NormalizedUrls

    protected 

    # https://gist.github.com/93045
    def to_permalink(str)
      Iconv.iconv('ascii//translit//IGNORE', 'utf-8', str).\
        first.\
        gsub("'", '').\
        gsub(/[^\x00-\x7F]+/, '').\
        gsub(/[^a-zA-Z0-9-]+/, '-').\
        gsub(/^-/, '').\
        gsub(/-$/, '').\
        downcase
    end

  end
end
