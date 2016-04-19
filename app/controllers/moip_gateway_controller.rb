class MoipGatewayController < ActionController::Base
  def postback
    unless (params[:id_transacao] == 'foo')
      Log.create(id_transaction: params[:id_transacao], status: params[:status_pagamento].to_i, content: params.to_s)

      order = Order.find_by(id_transaction: params[:id_transacao])

      order.update(status: params[:status_pagamento].to_i)

      if params[:status_pagamento].to_i == 1
        order.shopping_cart.shopping_cart_items.each do |item|
          if item.course_id.present?
            UserCourse.create(user_id: order.shopping_cart.user_id, course_id: item.course_id)
          elsif item.video_class_id.present?
            UserVideo.create(user_id: order.shopping_cart.user_id, video_class_id: item.video_class_id)
          end
        end
         OrderMailer.approved(order).deliver_later
      elsif params[:status_pagamento].to_i == 5
         OrderMailer.unapproved(order).deliver_later
      end

      if(params[:tipo_pagamento] == 'CartaoDeCredito')
        Vault.find_or_create_by(
          code: params[:cofre],
          final_digits: params[:cartao_final].to_i,
          flag: params[:cartao_bandeira],
          user_id: order.shopping_cart.user_id
        )
      end
    end

    head :ok
  end
end