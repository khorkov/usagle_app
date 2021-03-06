class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category

  validates :title, :description, presence: true
  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 3000 }
  validates :price, numericality: { greater_than: 0 }

  has_attached_file :image, styles: { large: '900x400>', medium: '253x150>', thumb: '150x150#' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :title, use: :slugged

  enum status: { wait_moderation: 0, approved: 1, declined: 2 }
end
