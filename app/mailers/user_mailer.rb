class UserMailer < ApplicationMailer
	default from: 'multitudefounding@gmail.com'
 
	def fund_email(user, value, project)
		@user = user
		@value = value
		@project = project
		mail(to: user.email, subject: 'Funded ' + project.name)
	end

	def promise_email(user, promise, project)
		@user = user
		@promise = promise
		@project = project
		mail(to: user.email, subject: 'Bougth promise from ' + project.name)
	end

	def project_founded_email(project)

		@project = project
		creators = @project.creators
		backers = @project.backers
		promises = @project.promises
		creators.each { |user| mail(to: user.email, subject: 'Founded ' + project.name) }
		backers.each { |user| mail(to: user.email, subject: 'Founded ' + project.name) }
		promises.each {|promise| promise.promise_buyers.each {|user| mail(to: user.email, subject: 'Founded ' + project.name) }}
		
	end
end
