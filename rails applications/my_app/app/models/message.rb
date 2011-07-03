class Message < ActiveRecord::Base
 validates_presence_of :name, :email
before_validation :confirm_email
protected
	def confirm_email
		if name.nil?
		self.name = email unless name.blank?
		end
	end
		#before create in callback registration
   
               

end
