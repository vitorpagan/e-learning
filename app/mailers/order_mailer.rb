class OrderMailer < ActionMailer::Base
  default from: Rails.application.secrets.email
  def created(order)
    @order = order
    @user = order.shopping_cart.user
    mail(to: @user.email, subject: 'Pedido Realizado')
  end

  def approved(order)
    @order = order
    @user = order.shopping_cart.user
    mail(to: @user.email, subject: 'Pagamento Aprovado')
  end

  def unapproved(order)
    @order = order
    @user = order.shopping_cart.user
    mail(to: @user.email, subject: 'Pagamento Reprovado')
  end
end
