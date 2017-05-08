module LatoCore

  # This module contains helpers for the superuser activerecord.
  module SuperuserHelpers
    
    # This function save login informations for user.
    def save_login ip_address
      self.update(last_login_datetime: DateTime.now, last_login_ip_address: ip_address)
    end

    # This function return the permission name for the user.
    def get_permission_name
      permission = CONFIGS[:lato_core][:superusers_permissions].values.select{|x| x[:value] === self.permission}
      return permission[0][:title] if permission && permission.length
    end

    # This function return the complete name for the user.
    def get_complete_name
      return "#{self.surname} #{self.name}"
    end

    # This function return a pretty string about the last login of the user.
    def get_pretty_last_login_datetime
      # TODO
    end

  end

end