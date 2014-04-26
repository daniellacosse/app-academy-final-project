class Tag < ActiveRecord::Base
  TAG_HIERARCHY = {
    analog: {
    },
    digital: {
    }
  }

  include PgSearch
  multisearchable against: [:tag]

  validates :tag, presence: true
  belongs_to :taggable, polymorphic: true

  def match_possible_standard_tags(string, tags = TAG_HIERARCHY)

  end

  def children
    if standard_tag?

    end
  end

  def standard_tag?
    # TAG_HIERARCHY includes string.to_sym?
  end
end
