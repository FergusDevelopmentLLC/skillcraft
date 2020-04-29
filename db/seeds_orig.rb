Course.create("name"=>"English 101")
Course.create("name"=>"Math 101")
Course.create("name"=>"Science 101")
Course.create("name"=>"Volleyball")
Course.create("name"=>"Watercolors 101")

Teacher.create("user_name"=>"LarryTeacher", "password_digest"=>"xxx", "first_name"=>"Larry", "last_name"=>"Teacher", "email"=>"larry@email.com")
Teacher.create("user_name"=>"MoeTeacher", "password_digest"=>"xxx", "first_name"=>"Moe", "last_name"=>"Teacher", "email"=>"moe@email.com")
Teacher.create("user_name"=>"CurleyTeacher", "password_digest"=>"xxx", "first_name"=>"Curley", "last_name"=>"Teacher", "email"=>"curley@email.com")

Student.create("user_name"=>"JimmyStudent", "password_digest"=>"xxx", "first_name"=>"Jimmy", "last_name"=>"Teacher", "email"=>"jimmy@email.com")
Student.create("user_name"=>"BillyStudent", "password_digest"=>"xxx", "first_name"=>"Billy", "last_name"=>"Teacher", "email"=>"billy@email.com")
Student.create("user_name"=>"KeatonStudent", "password_digest"=>"xxx", "first_name"=>"Keaton", "last_name"=>"Teacher", "email"=>"keaton@email.com")

Interaction.create("course_id" => "1", "person_id" => "2", "type" => "Announcement", "title" => "First Announcement", "start_date" => "2020-04-27", "end_date" => "2020-04-27", "posted_date" => "2020-04-27", "due_date" => "2020-04-27", "graded" => "true", "points" => 100, "instructions" => "Do it") 
Interaction.create("course_id" => "2", "person_id" => "3", "type" => "Announcement", "title" => "Secon Announcement", "start_date" => "2020-04-27", "end_date" => "2020-04-27", "posted_date" => "2020-04-27", "due_date" => "2020-04-27", "graded" => "true", "points" => 100, "instructions" => "Do it")

Interaction.create("course_id" => "3", "person_id" => "1", "type" => "Assignment", "title" => "First Assignment", "start_date" => "2020-04-27", "end_date" => "2020-04-27", "posted_date" => "2020-04-27", "due_date" => "2020-04-27", "graded" => "true", "points" => 100, "instructions" => "Do it") 
Interaction.create("course_id" => "4", "person_id" => "1", "type" => "Assignment", "title" => "Secon Assignment", "start_date" => "2020-04-27", "end_date" => "2020-04-27", "posted_date" => "2020-04-27", "due_date" => "2020-04-27", "graded" => "true", "points" => 100, "instructions" => "Do it")

Response.create("interaction_id"=>"1", "person_id"=>"4", "type"=>"Response", "content" => "bla, bla, bla", "score"=>92, "letter_grade"=>"A")
Response.create("interaction_id"=>"2", "person_id"=>"5", "type"=>"Response", "content" => "bla, bla, bla", "score"=>92, "letter_grade"=>"A")