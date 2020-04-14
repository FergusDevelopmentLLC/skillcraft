class Teacher < Person
    has_many :interactions, dependent: :destroy
end
