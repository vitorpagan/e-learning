class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Obrigado pela sua mensagem. Entraremos em contato em breve!'
      render :new
    else
      flash.now[:error] = 'Erro ao enviar sua mensagem.'
      render :new
    end
  end
end