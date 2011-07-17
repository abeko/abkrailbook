class FunComment < ActiveRecord::Base
  belongs_to :author ,
    :foreign_key => 'author_no'
  validates :author_no,
    :presence => true
  validates :name,
    :presence => true
  validates :body,
    :presence => true
end
