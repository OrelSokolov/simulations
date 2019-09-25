class Task < ApplicationRecord
  validates_presence_of :config_json
  # validates_presence_of :status, :simulations_count, :eta, :config, :config_json, :benchmark_version,
  #                       :report_table, :report_distribution, :report_graph, :report_w1, :report_dragons, :progress,
  #                       :line_count, :bet_per_line, :currency, :threads

  enum status: [:todo, :in_progress, :done, :failed]

  def report_s
    r = report&.gsub("\n", "<br/>")
    r = r&.gsub(" ", "&nbsp;")
    r
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
    span = Time.at(self.eta.to_i).utc
    "#{span.hour}h #{span.min}m #{span.sec}s"
  end
  #
  # def todo?
  #   self.status == :todo
  # end
  #
  # def in_progress?
  #   self.status == :in_progress
  # end
  #
  # def done?
  #   self.status == :done
  # end
  #
  # def failed?
  #   self.status == :failed
  # end

  def report_available?
    (self.done? || self.failed?) && self.report
  end
end

