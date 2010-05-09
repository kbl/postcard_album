class Postcard < ActiveRecord::Base
  
  cattr_reader :per_page
  @@per_page = 5

  def self.find_all_paginated(page) 
    paginate(:page => page, :order => 'created_at DESC')
  end

end
