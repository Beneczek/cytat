class PagesController < ApplicationController

  def home
    @title = "Strona glowna"
  end

  def contact
    @title = "Kontakt"
  end

  def about
    @title = "FAQ"
  end
end
