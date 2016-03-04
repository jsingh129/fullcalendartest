module SessionsHelper

  # Logs in the given reg.
  def log_in(reg)
    session[:reg_id] = reg.id
  end

  # Remembers a reg in a persistent session.
  def remember(reg)
    reg.remember
    cookies.permanent.signed[:reg_id] = reg.id
    cookies.permanent[:remember_token] = reg.remember_token
  end

  # Returns the reg corresponding to the remember token cookie.
  def current_reg
    if (reg_id = session[:reg_id])
      @current_reg ||= Reg.find_by(id: reg_id)
    elsif (reg_id = cookies.signed[:reg_id])
      reg = Reg.find_by(id: reg_id)
      if reg && reg.authenticated?(cookies[:remember_token])
        log_in reg
        @current_reg = reg
      end
    end
  end

  # Returns true if the reg is logged in, false otherwise.
  def logged_in?
    !current_reg.nil?
  end

  def forget(reg)
    reg.forget
    cookies.delete(:reg_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current reg.
  def log_out
    forget(current_reg)
    session.delete(:reg_id)
    @current_reg = nil
  end
end