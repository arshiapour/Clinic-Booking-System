class UserMailer < ApplicationMailer
default from: "no-reply@uronic.co.uk"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.appointmentConfirmation.subject
  #
  def appointmentConfirmation(patient)
    @patient = patient

    mail to: patient.email, subject: "Uronic Appointment"
  end
end
