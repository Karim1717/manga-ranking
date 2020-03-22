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

  # def winter_2020
    base_url = "https://www.anime-planet.com"
    url = "#{base_url}/anime/seasons/winter-2020"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

   one_anime = html_doc.search('.cardDeck').css('li')
     one_anime.each do |anime|
     title = anime.search('h3').first.text
     episode = anime.css("li").attr("data-total-episodes")
     image = anime.css("img").attr("data-src").text
     # puts syno = anime.css('a').attr('title')
     img = base_url + image
     Anime.create(title: title, episodes: episode, image: img)
     end

  # end


  def airing_anime
    base_url = "https://myanimelist.net"
    url = "#{base_url}/watch/episode"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

     one_anime = html_doc.search('.video-list-outer-vertical')

      one_anime.each do |anime|
      title = anime.search('a.mr4').text
      episode = anime.search('a.di-b').first.text
      puts image = anime.css("img")[0]
      # puts image.content
      a = Anime.create(title: title, episodes: episode)
      # url+ a.tile
      end
    end

    # # puts element.attribute('href').value

end
