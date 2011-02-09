class UserSession < Authlogic::Session::Base
  
  # Rails3 hack
  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end

end
