module LogsHelper

  def exit_code_color(log)
    if log.exit_code == "success"
      "text-success"
    else
      "text-warning"
    end
  end
end