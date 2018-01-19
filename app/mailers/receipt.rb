class Receipt < ApplicationMailer
  default from: 'no-reply@jungle.com',
        return_path: 'no-reply@jungle.com'

  def order_receipt(recipient)
    @order_info = recipient
    mail(to: @order_info.email, subject: "Thank You for Ordering from JUNGLE! Order ##{recipient.id}.")  do |format|
        format.html { render "receipt" }
    end
  end
end