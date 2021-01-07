class ContactOrderMailer < ApplicationMailer
  require 'sendgrid-ruby'
  include SendGrid

  def send_order_notification(order)
    from = Email.new(email: order.email)
    to = Email.new(email: 'biuro@ozonexpert.pl')
    subject = "Zlecenie kontaktu - #{order.name}"
    content = Content.new(type: 'text/plain', value: order.message)
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: Rails.application.credentials.sendgrid_api)
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
