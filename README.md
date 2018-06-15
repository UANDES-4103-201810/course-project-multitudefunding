# README

Participants:
	-Sebastián Baixas
	-Ignacio Carril.

To begin, run migrations and seed
seed will make admin user with: 
email: mf_admin@mfunding.com
password: 123456
and a few categories for default

3 - System Access: is done with google auth, doesnt ask for additional data of the user, but logs in and remembers users

4 - Platform feedback: there is platform feedback for most, if not all, actions invoked

5 - User profile: User profile descriptions and project descriptions use markdown parser from redcarpet gem, visible from their respective show views

6 - Funding: projects can be funded and mailer has been implemented

7 - Searching: filters by name only, no filter by category, doesn't search within descriptions either

8 - Authorization: Most admin things are behind authorization, however, some last minute additions may not be properly secured.

9 - Report: this
