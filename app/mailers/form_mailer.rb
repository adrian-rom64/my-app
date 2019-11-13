class FormMailer < ApplicationMailer

	def form_email(data)
		@body = data[:body]
		mail(from: 'My-App', to: data[:receiver], subject: data[:subject])
	end

end
