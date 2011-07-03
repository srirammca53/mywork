class Comment < ActiveRecord::Base.field_error_proc = Proc.new do |html_tag, instance|
 if instance.error_message.kind_of?(Array)
    %(#{html_tag}<span>&nbsp;
      #{instance.error_message.join(',')}</span>).html_safe
  else
    %(#{html_tag}<span>&nbsp;
      #{instance.error_message}</span>).html_safe
  end

validates :rating, :presence=>true,:length=>{:maximum=>1}
validates :body, :presence => true
validates_acceptance_of :terms_of_service, :accept => 'yes'
 validates_format_of :rating, :with => /[0-5]/,
    :message => "Rating in between zero to five "
 #validates_length_of :commenter, :minimum => 6, :maximum => 12
#validates_numericality_of :rating, :only_integer => true, :less_than_or_equal_to => 5
  validates_length_of :body, :maximum => 500

validates_uniqueness_of :commenter, :case_sensitive => true, :on => :create
validates_confirmation_of :rating
 
validate :commenter_name,
    :rating_star
 
  def commenter_name
    errors.add(:commenter, "can't match and same") if
      !commenter.blank? 
  end
 
  def rating_star
    errors.add(:rating, "can't be greater than 5") if
      rating > 5
  end


end
#Comment.create(:commenter => "sriram").valid?

