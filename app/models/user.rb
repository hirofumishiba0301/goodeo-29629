class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :last_name, presence: true,
                        format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
  validates :first_name, presence: true,
                         format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
  validates :last_name_kana, presence: true,
                             format: { with: /\A(?:\p{Katakana}|[ー－])+\z/ }
  validates :first_name_kana, presence: true,
                              format: { with: /\A(?:\p{Katakana}|[ー－])+\z/ }

end
