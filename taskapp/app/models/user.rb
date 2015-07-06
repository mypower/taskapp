class User < ActiveRecord::Base
  has_many :works
  validates :username,
  presence: { message: "入力してください" },
  length: { minimum: 3, message: "短すぎ!" }
end
