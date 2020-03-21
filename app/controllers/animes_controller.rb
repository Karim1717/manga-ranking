require 'open-uri'
require 'nokogiri'

class AnimesController < ApplicationController

  def index
    @animes = Anime.all
  end

  def show
    @anime = Anime.find(params[:id])
  end

  def new
    @anime = Anime.new
  end

  # def create
  #   @anime = Anime.new(anime_params)
  #   if @anime.save
  #     redirect_to animes_path(@anime)
  #   else
  #     render :new
  #   end
  # end

  # def airing_anime
    base_url = "https://myanimelist.net"
    url = "#{base_url}/watch/episode"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    one_anime = html_doc.search('.video-list-outer-vertical')

      one_anime.each do |anime|
      title = anime.search('a.mr4').text
      episode = anime.search('a.di-b').first.text
     p image = anime.search('data-src')
      Anime.create(title: title, episodes: episode, images: image)
    end


    # # puts element.attribute('href').value

end
