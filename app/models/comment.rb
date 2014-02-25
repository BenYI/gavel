class Comment
  include Mongoid::Document

  belongs_to :author, class_name: "User"
  belongs_to :response
  belongs_to :post

  field :body, type: String
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
end
