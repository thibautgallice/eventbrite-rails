class AdminMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def new_participant(user,event)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = User.find_by(id:user)
    @event = Event.find_by(id:event)

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @event.admin.email, subject: 'Bienvenue chez nous !') 
  end

end
