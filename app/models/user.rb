class User < ApplicationRecord
  # Include default users modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :interviews, dependent: :destroy
  enum gender: { male: 0, female: 1 }

  # 生年月日から年齢計算
  def age
    d1 = self.birthday&.strftime("%Y%m%d")&.to_i
    d2 = Date.today&.strftime("%Y%m%d")&.to_i
    (d2 - d1) / 10000
  end
end
