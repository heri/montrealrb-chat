class Message < Volt::Model

  own_by_user
  field :content, String

end
