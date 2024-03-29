class UserMailer < ActionMailer::Base
  default :from => "no_reply@files.ibest.uidaho.edu"
  default :reply_to => "ibesthelp@uidaho.edu"
  
  def invitation_to_share(shared_folder)
    @shared_folder = shared_folder
    mail( :to => @shared_folder.shared_email, 
          :subject => "#{@shared_folder.user.name} wants to share '#{@shared_folder.folder.name}' folder with you" )
  end
  
  def share_notice_to_admin(shared_folder)
    @shared_folder = shared_folder
    mail( :to => "rlyon@uidaho.edu",
          :subject => "[Filebucket] Share request generated." )
  end
  
  def invitation_to_join(invitation)
    @invitation = invitation
    mail( :to => @invitation.invited_user_email,
          :subject => "#{@invitation.user.name} has invited you to the IBEST Filebucket" )
  end
  
  def invitation_notice_to_admin(invitation)
    @invitation = invitation
    mail( :to => "rlyon@uidaho.edu",
          :subject => "[Filebucket] Invitation sent." )
  end
  
  def notify_shared_folder_user(shared_folder,email,message)
    @shared_folder = shared_folder
    @message = message
    mail( :to => email,
          :reply_to => @shared_folder.user.email,
          :subject => "#{@shared_folder.user.name} has updated #{@shared_folder.name}")
  end
  
  def notify_shared_folder_owner(shared_folder,email_addresses)
    @shared_folder = shared_folder
    @email_addresses = email_addresses
    mail( :to => @shared_folder.user.email,
          :subject => "Folder notification confirmation")
  end
  
end
