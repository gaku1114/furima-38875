class Item < ApplicationRecord
  validates :name,          presence: true
  validates :description,   presence: true
  validates :category_id,   numericality: { other_than: 1 } 
  validates :condition_id,  numericality: { other_than: 1 } 
  validates :postage_id,    numericality: { other_than: 1 } 
  validates :deadline_id,   numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :price,         presence: true, numericality: { in: 300..9999999 }, format: { with:  /\A[0-9]+\z/ }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :deadline
  belongs_to :prefecture 

  belongs_to :user
end
