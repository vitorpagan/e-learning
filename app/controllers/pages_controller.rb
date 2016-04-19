class PagesController < ApplicationController
  def about_us
    @page_title = "Sobre o Foo Bar"
  end
  def about_persil
    @page_title = "Nosso Embaixador Foo Bazz"
  end
  def tops_tips
    @page_title = "Dicas dos Tops"
  end
  def contact
    @page_title = "Contato"
  end
  def privacy_policy
    @page_title = "Política de Privacidade"
  end
  def faq
    @page_title = "Perguntas Frequentes"
  end
  def terms_use
    @page_title = "Termos e Condições de Uso"
  end
  def my_video_classes
    @page_title = "Minhas Aulas"
    @courses = UserCourse.where(user: current_user)
    @video_classes = UserVideo.where(user: current_user)
  end
end