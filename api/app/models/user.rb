class User < ApplicationRecord
    after_create :create_cart
    validates :email, presence: true, uniqueness: { case_sensitive: true }
    has_one :cart
    has_many :orders
    has_secure_password

  
    def to_token_payload
      {
        sub: id,
        class: self.class.to_s
      }
    end
  
    def self.from_token_request(request)
      email = request.params&.[]('auth')&.[]('email')
      find_by email: email
    end
  
    def self.from_token_payload(payload)
      find(payload['sub']) if payload['sub'] && payload['class'] && payload['class'] == to_s
    end
  
    def create_cart
      Cart.create(user_id: id, value: 0)
    end

  end
  