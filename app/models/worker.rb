class Worker < ApplicationRecord
  scope :recent, -> { where("updated_at > now() - '1 minute'::interval") }
  scope :not_blocked, -> { where("blocked != true") }

  scope :active, -> { recent.not_blocked }
  scope :busy,   -> { recent.not_blocked.where("busy == TRUE") }
  scope :available,   -> { recent.not_blocked.where("busy != TRUE") }

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
