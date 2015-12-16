module ApplicationHelper
  def flash_class(level)
    # puts "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS"
    case level.to_sym
    when :notice then "alert alert-dismissible alert-info"
    when :success then "alert alert-dismissible alert-success"
    when :error then "alert alert-dismissible alert-warning"
    when :alert then "alert alert-dismissible alert-danger"
    end
  end
end
