module PostcardAlbum
  module NormalizedUrls

    protected 

    def to_permalink(str)
      str.\
        gsub("'", '').\
        gsub(/[^\x00-\x7F]+/, '-').\
        gsub(/[^a-zA-Z0-9-]+/, '-').\
        gsub(/--/, '-').\
        gsub(/^-/, '').\
        gsub(/-$/, '').\
        downcase
    end
  end
end
