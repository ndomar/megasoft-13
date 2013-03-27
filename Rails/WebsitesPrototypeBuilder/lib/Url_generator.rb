module Url_generator

  def generate_task_url (task_id,reviewer_id)
    return "localhost:3000/?task_id="+task_id+"&reviewer_id="+reviewer_id
  end

end