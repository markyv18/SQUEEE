class AttractionSerializer < ActiveModel::Serializer
  attributes :name, :photo_url, :lat, :lng, :html

  def html
    ApplicationController.renderer
    .render(partial: 'attractions/attraction', locals: {attraction: object})
  end
end
