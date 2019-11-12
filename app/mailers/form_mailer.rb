class FormMailer < ApplicationMailer

	def form_email(user)
		@user = user
		mail(from: 'Tester', to: user.email, subject: 'It works')
	end

end
