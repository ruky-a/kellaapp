class Lesson < ApplicationRecord
   extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]


  belongs_to :section 
  has_one_attached :video
  has_one_attached :thumbnail

  include RankedModel
   ranks :row_order, with_same: :section_id

     def next_lesson
    lesson = section.lessons.where("row_order > ?", self.row_order).rank(:row_order).first
    if lesson.blank? && section.next_section
      return section.next_section.lessons.rank(:row_order).first
    end
    return lesson
  end
end
