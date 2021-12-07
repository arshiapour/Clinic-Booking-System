class AdminMailer < ApplicationMailer

  default to: "admin@uronic.co.uk", subject: "Contact us form"

  def contact_us(user)
    @user = user

    mail from: user.email
  end
end
