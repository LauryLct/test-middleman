module ApplicationHelper
  def retina_image_tag(default_name, options={})
    retina_name = default_name.gsub(%r{\.\w+$}, '@2x\0')
    image_tag(default_name, options.merge('data-interchange' => "[#{asset_path(retina_name)}, (retina)]"))
  end

  def svg(name)
    root = Middleman::Application.root
    file_path = "#{root}/source/images/#{name}.svg"
    return File.read(file_path) if File.exists?(file_path)
    '(not found)'
  end
end
