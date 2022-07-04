module StoriesHelper

  def cover_image(story, size: 300)
    image_tag story.cover_image.variant(resize: "#{size}x#{size}") if story.cover_image.attached?
  end

end
