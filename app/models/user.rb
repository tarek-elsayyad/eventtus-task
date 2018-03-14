class User < ApplicationRecord
    validates :name, :email, presence: true
    validates_format_of :email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    def posts
        Post.where(user_id: self.id)
    end
end
