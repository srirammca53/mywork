module CommentsHelper
ActiveRecord::Base.class_eval do
		  def self.validates_as_choice(attr_name, n, options={})
		    validates_inclusion_of attr_name, {:in => 1..n}.merge(options)
		  end
	end
class MyValidation < ActiveModel::Validator
  def validate(dairy)
    if dairy.email == "sriram.in20@gmail.com"
      dairy.errors[:base] << "This is reserved mail id"
    end
  end
end
end
