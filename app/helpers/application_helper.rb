module ApplicationHelper
  # Renders a local SVG file inline so Ferris icons can inherit CSS color
  # (for example, white icons on a black header via fill: currentColor).
  def inline_svg(path, options = {})
    file_path = Rails.root.join("app/assets/images", path)
    return "" unless File.exist?(file_path)

    svg = File.read(file_path)
    fragment = Nokogiri::HTML::DocumentFragment.parse(svg)
    svg_tag = fragment.at_css("svg")
    return "" unless svg_tag

    options.each do |key, value|
      if key.to_s == "class"
        existing = svg_tag["class"]
        svg_tag["class"] = [existing, value].compact.join(" ")
      else
        svg_tag[key.to_s] = value
      end
    end

    svg_tag["aria-hidden"] ||= "true"
    svg_tag["focusable"] ||= "false"

    fragment.to_html.html_safe
  end

  # Convenience helper for local Ferris icons.
  def ferris_icon(name, set: "wbez", classes: "", size: 20, style: nil)
    inline_svg(
      "icons/#{set}/#{name}.svg",
      class: classes,
      style: [style, "width: #{size}px", "height: #{size}px", "fill: currentColor"].compact.join("; ")
    )
  end
end
