module TasksHelper
  def deadline_format(datetime)
    datetime.present? ? datetime.strftime('%Y.%m.%d') : t(:undefined)
  end

  def status_format(status)
    t(status.presence) || t(:undefined)
  end

end
