class HunterNotifierMailer < ApplicationMailer
  default :from => 'TreasureHuntGame@awesomenes.pl'

  def send_treasure_found_email(email, treasure)
    @location = [treasure.latitude, treasure.longitude]
    @number_of_successful_hunters = treasure.hunters.count
    mail( to: email, subject: "GZ! You've found a treasure!" )
  end
end
