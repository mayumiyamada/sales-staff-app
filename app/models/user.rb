class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  devise :authentication_keys => [:employee_id_number]  
   has_many :tweets
   has_many :room_users
   has_many :rooms, through: :room_users
   has_many :messages
   has_many :Calendars

  with_options presence: true do
   validates :employee_id_number, length: { maximum: 5 },
   format: { with: /\A\d{,5}\z/ }
   validates :name,
   format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で登録してください' } 
   validates :name_kana,
   format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナで登録してください' } 
   validates :email
   validates :password,
   format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/, message: '英数字混合6文字以上で登録してください' }
   end
        
   def email_required?
          false
   end
        
   def email_changed?
          false
   end
  end
