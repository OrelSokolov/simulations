class Worker < ApplicationRecord
  scope :active, -> { where("DATE_PART('minute', NOW()) - DATE_PART('minute', updated_at) < 1 AND blocked != true") }
  scope :busy,   -> { where("DATE_PART('minute', NOW()) - DATE_PART('minute', updated_at) < 1 AND busy == TRUE AND blocked != true") }
  scope :available,   -> { where("DATE_PART('minute', NOW()) - DATE_PART('minute', updated_at) < 1 AND busy != TRUE AND blocked != true") }

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
