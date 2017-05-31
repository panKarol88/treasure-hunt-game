class HunterNotifierMailer < ApplicationMailer
  default :from => 'TreasureHuntGame@awesomenes.pl'

  def send_treasure_found_email(email, location)
    @location = location
    mail( to: email, subject: 'GZ! You found the treasure!' )
  end
end
