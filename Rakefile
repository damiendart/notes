require "rubygems"
require "bundler/setup"
require "yaml"
Bundler.require(:default)

CLOBBER.include(FileList["*.html"])
task :default => FileList["*.markdown"].map { |file| 
    File.basename(file, ".markdown") + ".html" }

FileList["*.markdown"].map { |file| 
    File.basename(file, ".markdown") }.each do |document_basename|
  desc "Spit out \"#{document_basename}.html\"."
  file "#{document_basename}.html" =>
      FileList["#{document_basename}.markdown"] +
      FileList["template.*"] do |task|
    puts "# Spitting out \"#{task.name}\"."
    content = Redcarpet::Render::SmartyPants.render(
        Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(
        File.read("#{document_basename}.markdown")))
    title = Nokogiri::HTML(content).xpath("//h1")[0].content
    output = Haml::Engine.new(File.read("template.haml"), {:format => :html5,
        :escape_attrs => false, :attr_wrapper => "\""}).render(Object.new,
        {:title => title, :content => content})
    output = output.gsub(/^[\s]*$\n/, "")
    output = output.gsub(%r{^\s*//.*\n}, "")
    File.open(task.name, "w") do |file|
      file.write(output)
    end
  end
end
