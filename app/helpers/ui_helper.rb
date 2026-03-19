module UiHelper
  def ui_btn_class(variant = :primary)
    case variant.to_sym
    when :primary
      "btn btn-wbez"
    when :secondary
      "btn btn-outline-secondary"
    when :listen
      "btn btn-outline-light btn-listen"
    when :light
      "btn btn-light"
    when :link
      "btn btn-link"
    else
      "btn btn-wbez"
    end
  end

  def active_tab_class(active)
    classes = ["nav-link"]
    classes << "active" if active
    classes.join(" ")
  end
end
