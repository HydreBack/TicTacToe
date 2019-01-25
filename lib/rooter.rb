class Rooter

attr_accessor :controller

  def initialize
    @controller =  Controller.new
  end #ainsi, un "Router.new" lancé par app.rb va créer automatique une instance "@controller"

  def perform #rappelle-toi que l'on fait "Router.new.perform" dans app.rb => après initialize, on définit perform.
    puts "BIENVENUE DANS LE TICTACTOE"
    while true

      #on affiche le menu
      puts "Veux-tu commencer une nouvelle partie ?"
      puts "1 pour oui ; 2 pour non "
      new_game = gets.chomp.to_i #on attend le choix de l'utilisateur

      case new_game #en fonction du choix
      when 1
        puts "Allez, c'est partie" 
        @controller.create_new_game
      when 2
        puts "À bientôt !"
        break #ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.
      else
        puts "Ce choix n'existe pas, merci de ressayer" #si l'utilisateur saisit une entrée non prévue, il retourne au début du "while true". C'est pour ça que la boucle est infinie: potentiellement, il peut se gourer jusqu'à la fin des temps :)
      end
    end
  end
end