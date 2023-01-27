class Item < ApplicationRecord
  validates :name,          presence: true
  validates :description,   presence: true
  validates :category_id,   numericality: { other_than: 1, message: 'を選択してください' } 
  validates :condition_id,  numericality: { other_than: 1, message: 'を選択してください' } 
  validates :postage_id,    numericality: { other_than: 1, message: 'を選択してください' } 
  validates :deadline_id,   numericality: { other_than: 1, message: 'を選択してください' } 
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' } 
  validates :price,         presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :image,         presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :deadline
  belongs_to :prefecture 

  belongs_to :user

  has_one_attached :image
end
