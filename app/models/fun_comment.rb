class FunComment < ActiveRecord::Base
  belongs_to :author ,
    :foreign_key => 'author_no'
end
