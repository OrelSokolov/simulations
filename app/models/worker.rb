class Worker < ApplicationRecord
  def active?
    (Time.now - updated_at) < 1.minutes
  end

  def dead?
    (Time.now - updated_at) > 5.days
  end

  def state
    if active?
      "active"
    elsif dead?
      "dead"
    else
      "waiting"
    end
  end
end
