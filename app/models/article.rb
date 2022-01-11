class Article < ApplicationRecord
    # validations for model    
    validates :title, presence: true, length: {minimum: 6, maximum: 100} # for title attribute
    validates :description, presence: true, length: {minimum: 10, maximum: 255} # for desc attribute
end