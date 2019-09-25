class Task < ApplicationRecord
  validates_presence_of :status, :simulations_count, :eta, :report, :config, :config_json, :benchmark_version,
                        :report_table, :report_distribution, :report_graph, :report_w1, :report_dragons, :progress,
                        :line_count, :bet_per_line, :currency, :worker_id, :threads

  def self.todo
    where(status: 0)
  end

  def outdated?
    self.progress && ( Time.now - (self.updated_at || Time.unix(0)) > 1.hour )
  end

  def changed_at
    self.updated_at || Time.unix(0)
  end

  def changed_today?
    changed_at > Time.now - 1.day
  end

  def changed_yesterday?
    (changed_at < Time.now - 1.day) && (changed_at > Time.now - 2.day)
  end

  def changed_this_week?
    (changed_at < Time.now - 2.day) && (changed_at > Time.now - 7.day)
  end

  def changed_ago?
    (changed_at < Time.now - 7.day)
  end

  def simulations_s
    case self.simulations_count
    when 5000
      "100K"
    when 50000
      "1M"
    when 500000
      "10M"
    when 5000000
      "100M"
    end
  end

  def eta_s
    i = self.eta.try &.to_f.to_i || 0
    span = i.seconds
    "#{span.hours}h #{span.minutes}m #{span.seconds}s"
  end

  def todo?
    self.status == 0
  end

  def in_progress?
    self.status == 1
  end

  def done?
    self.status == 2
  end

  def failed?
    self.status == 3
  end

  def report_available?
    (self.done? || self.failed?) && self.report
  end
end

