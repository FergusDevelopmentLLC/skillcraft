class Teacher < Person
    has_secure_password  
    
    validates :user_name, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    #validates_format_of :email, :with => /\w+@\w+\.\w+/
end
