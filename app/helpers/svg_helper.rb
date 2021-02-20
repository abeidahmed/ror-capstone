module SvgHelper
  def embed_svg(filename, **options)
    file = file_path(filename)
    doc = Nokogiri::HTML::DocumentFragment.parse(file)
    svg = doc.at_css('svg')
    svg_options(svg, options)
    raw(doc)
  end

  private

  def svg_options(svg, options)
    svg['class'] = options[:class] if options[:class].present?

    if options[:size].present?
      svg['width'] = options[:size]
      svg['height'] = options[:size]
    end

    svg['style'] = options[:style] if options[:style].present?
  end

  def file_path(filename)
    assets = Rails.root.join('app', 'assets', 'images', 'svg')
    File.read("#{assets}/#{filename}.svg")
  end
end
