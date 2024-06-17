class Admin < ApplicationRecord

  has_secure_password

  validates :name, presence: true, uniqueness: true


  def as_json options
    {
      id: self.id,
      name: self.name,
      created_at: self.created_at,
      updated_at: self.updated_at
    }
  end
end
