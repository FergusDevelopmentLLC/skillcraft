Course.create("name"=>"English 101")
Course.create("name"=>"Math 101")
Course.create("name"=>"Science 101")
Course.create("name"=>"Volleyball"
Course.create("name"=>"Watercolors 101")

Teacher.create("user_name"=>"LarryTeacher", "password_digest"=>"xxx", "first_name"=>"Larry", "last_name"=>"Teacher", "email"=>"larry@email.com")
Teacher.create("user_name"=>"MoeTeacher", "password_digest"=>"xxx", "first_name"=>"Moe", "last_name"=>"Teacher", "email"=>"moe@email.com")
Teacher.create("user_name"=>"CurleyTeacher", "password_digest"=>"xxx", "first_name"=>"Curley", "last_name"=>"Teacher", "email"=>"curley@email.com")

Student.create("user_name"=>"JimmyStudent", "password_digest"=>"xxx", "first_name"=>"Jimmy", "last_name"=>"Teacher", "email"=>"jimmy@email.com")
Student.create("user_name"=>"BillyStudent", "password_digest"=>"xxx", "first_name"=>"Billy", "last_name"=>"Teacher", "email"=>"billy@email.com")
Student.create("user_name"=>"KeatonStudent", "password_digest"=>"xxx", "first_name"=>"Keaton", "last_name"=>"Teacher", "email"=>"keaton@email.com")

Announcement.create("person_id"=>"1", "type"=>"Announcement", "content"=>"Announcement content")
Assignment.create("person_id"=>"1", "type"=>"Announcement", "content"=>"Announcement content")

Response.create("interaction_id"=>"1", "person_id"=>"4", "type"=>"Answer", "content"=>"Answer content", "score"=>"90", "letter_grade" => "A")
Response.create("interaction_id"=>"2", "person_id"=>"5", "type"=>"Answer", "content"=>"Answer content", "score"=>"90", "letter_grade" => "A")
Response.create("interaction_id"=>"3", "person_id"=>"6", "type"=>"Answer", "content"=>"Answer content", "score"=>"90", "letter_grade" => "A")

