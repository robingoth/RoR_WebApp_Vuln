class User < ActiveRecord::Base
	def editor?
    self.role == 'editor'
  end
end
