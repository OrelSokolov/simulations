class Worker < ApplicationRecord
  scope :recent, -> { where("updated_at > now() - '1 minute'::interval") }
  scope :not_blocked, -> { where("blocked != true") }

  scope :active, -> { recent.not_blocked }
  scope :busy,   -> { recent.not_blocked.where("busy == TRUE") }
  scope :available,   -> { recent.not_blocked.where("busy != TRUE") }

  def active?
    (Time.now - updated_at) < 1.minutes
  end

  def state
    if active?
       if busy
         "waiting"
       else
         "active"
       end
    else
      "dead"
    end
  end
end
