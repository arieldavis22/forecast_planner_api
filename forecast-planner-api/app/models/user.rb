class User < ApplicationRecord
    has_many :user_events
    has_many :events, through: :user_events

    has_many :friended_users, foreign_key: :friender_id, class_name: 'Friend'
    has_many :friendees, through: :friended_users

    has_many :friendee_users, foreign_key: :friendee_id, class_name: 'Friend'
    has_many :frienders, through: :friendee_users

    has_secure_password
    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
