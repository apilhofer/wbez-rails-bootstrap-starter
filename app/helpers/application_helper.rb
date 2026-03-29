module ApplicationHelper
  # Sun-Times homepage meta line: "55m ago • 4m read" (no byline) or "By Author • 3m read" (linked name).
  def suntimes_home_story_meta(published_ago: nil, read: nil, author_name: nil, author_href: nil)
    href = author_href.presence || "#"
    sep = " \u2022 " # bullet
    read_s = read.to_s.strip.presence
    ago = published_ago.to_s.strip.presence
    name = author_name.to_s.strip.presence

    if name
      link = link_to(name, href, class: "fw-semibold suntimes-home__byline-link")
      byline = safe_join(["By ".html_safe, link], "")
      return read_s ? safe_join([byline, h(read_s)], sep) : byline
    end

    if ago && read_s
      return safe_join([h(ago), h(read_s)], sep)
    end

    return h(read_s) if read_s
    return h(ago) if ago

    "".html_safe
  end

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
