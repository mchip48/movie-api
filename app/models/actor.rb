class Actor < ApplicationRecord
validates :first_name, presence: true
validates :last_name, presence: true
validates :known_for, presence: true
end
