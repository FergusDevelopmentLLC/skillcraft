class Announcement < Interaction
  def questions
    responses.find_all { |response| response.type == 'Question' }
  end
end