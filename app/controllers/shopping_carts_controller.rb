class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shopping_cart
  def add_course
    render json: ShoppingCartItem.create(shopping_cart: @shopping_cart, course: Course.find(params[:course_id]))
  end

  def add_video_class
    render json: ShoppingCartItem.create(shopping_cart: @shopping_cart, video_class: VideoClass.find(params[:video_class_id]))
  end

  def get_items
    render json: @shopping_cart.shopping_cart_items
  end

  def remove_course
    render json: ShoppingCartItem.find_by(shopping_cart: @shopping_cart, course_id: params[:course_id]).destroy
  end

  def remove_video_class
    render json: ShoppingCartItem.find_by(shopping_cart: @shopping_cart, video_class_id: params[:video_class_id]).destroy
  end

  def show
  end

  def success
  end

  def checkout
    order = Order.new(
      shopping_cart: current_user.shopping_cart,
      status: 'pending',
      payment_method_id: params[:order][:payment_method_id],
      payment_code: params[:order][:payment_code],
      token: params[:order][:token],
      url: params[:order][:url],
      id_transaction: params[:order][:id_transaction]
    )

    if order.save
      ShoppingCart.create(user: current_user)

      OrderMailer.created(order).deliver_later

      redirect_to success_shopping_cart_path(
        {
          order_id: order.id,
          payment_code: params[:order][:payment_code],
          payment_method_id: params[:order][:payment_method_id],
          url: params[:order][:url]
        }
      )
    end
  end

  def moip_instruction
    timestamp = Time.current.strftime('%Y%m%d%H%M%S')
    user = current_user.email.gsub(/\./,'').split('@')[0]
    order_id = "#{timestamp}-#{user}"
    client = Moip::Client.new
    response = client.post('ws/alpha/EnviarInstrucao/Unica', {},
      "<EnviarInstrucao>
        <InstrucaoUnica TipoValidacao='Transparente'>
            <Razao>Razão / Motivo do pagamento</Razao>
            <Valores>
                <Valor moeda='BRL'>#{current_user.shopping_cart.total.to_s}</Valor>
            </Valores>
            <IdProprio>#{order_id}</IdProprio>
            <Pagador>
               <Nome>#{current_user.name}</Nome>
               <Email>#{current_user.email}</Email>
               <IdPagador>#{current_user.id}</IdPagador>
               <EnderecoCobranca>
                   <Logradouro>#{current_user.address.address}</Logradouro>
                   <Numero>#{current_user.address.number}</Numero>
                   <Complemento></Complemento>
                   <Bairro>#{current_user.address.district}</Bairro>
                   <Cidade>#{current_user.address.city}</Cidade>
                   <Estado>#{current_user.address.state}</Estado>
                   <Pais>BRA</Pais>
                   <CEP>#{current_user.address.zipcode}</CEP>
                   <TelefoneFixo>#{current_user.phone.gsub(/[ \(\)\-]/i, '')}</TelefoneFixo>
               </EnderecoCobranca>
           </Pagador>
        </InstrucaoUnica>
      </EnviarInstrucao>"
    )
    xml = Nokogiri::XML(response.body)
    p response.body
    render json: { token: xml.at_xpath('//Token').content, order_id: order_id}
  end

  private
  def set_shopping_cart
    if current_user
      @shopping_cart = current_user.shopping_cart
    end
  end

  def order_params
    params.permit(:order, :credit_card)
  end
end