class UserMailer < ApplicationMailer
    default from: 'test.sayna@gmail.com'
 
    def welcome_email(user)
      @user = user
      mail(to: @user.email , subject: 'Newsletter')
    end

    def order_email(user)
      @user = user
      orders = Order.where(user_id: @user)
      @items = []
      orders.each do |ord|
      	assoc = AssociateOrderItem.find_by(order_id: ord.id)
      	@items.push(Item.find(assoc.item_id))
      end
      mail(to: @user.email , subject: 'Banc de commande')
    end

    def admin_report_email(user)
      @user = user
      mail(to: "test.sayna@gmail.com" , subject: 'Une commande a été faite')
    end
end
