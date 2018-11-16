class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

  validates :name, presence: true, uniqueness: true

  def deletable?
    cocktails.empty?
  end
end

# def destroy
#   if @ingredient.deletable? && @ingredient.destroy

#     redirige vers path
#   else
#     puts "Can't delete"
#   end
# end
