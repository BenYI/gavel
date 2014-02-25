class User
  include Mongoid::Document

  has_many :comments, inverse_of: :author
  belongs_to :vote, class_name "Comment", inverse_of: :voters
  has_and_belongs_to_many :posts


  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :created_at, type: DateTime
  field :last_seen, type: DateTime
end
