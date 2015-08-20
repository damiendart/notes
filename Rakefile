# Converts Markdown-formatted notes into HTML documents.
#
# TODO: Document note format.
#
# This file was written by Damien Dart, <damiendart@pobox.com>. This is
# free and unencumbered software released into the public domain. For
# more information, please refer to the accompanying "UNLICENCE" file.

require "rubygems"
require "bundler/setup"
Bundler.require(:default)

Haml::Filters::Scss.options[:cache] = false
Haml::Filters::Scss.options[:style] = :compressed

CLOBBER.include(FileList["*.html"])
task :default => FileList["*.markdown"].map { |file|
    File.basename(file, ".markdown") + ".html" }

FileList["*.markdown"].map { |file|
    File.basename(file, ".markdown") }.each do |document_basename|
  desc "Spit out \"#{document_basename}.html\"."
  file "#{document_basename}.html" => FileList["Rakefile",
      "#{document_basename}.markdown", "template.*"] do |task|
    puts "# Spitting out \"#{task.name}\"."
    content = Nokogiri::HTML.fragment(Redcarpet::Render::SmartyPants.render(
        Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(
        File.read("#{document_basename}.markdown"))))
    if (!IO.popen("git log #{document_basename}.markdown").readlines.empty?)
      last_update_html = Nokogiri::XML::Node.new("li", content)
      last_update_html.inner_html = "Last Updated: " +
          "<a href=\"https://github.com/damiendart/notes/commit/" +
          `git log -n 1 --pretty=format:%H #{document_basename}.markdown` + "\">" +
          `git log -n 1 --pretty=format:%aD #{document_basename}.markdown` + "</a>"
      content.xpath("h1/following-sibling::ul")[0].add_child(last_update_html)
    end
    content.xpath("h1/following::ul[1]/li").sort_by { |item|
      item.content }.each { |node|
      node.parent = content.xpath("h1/following::ul")[0] }
    output = Haml::Engine.new(File.read("template.haml"), {:format => :html5,
        :escape_attrs => false, :attr_wrapper => "\""}).render(Object.new,
        {:author => content.xpath("h1/following-sibling::ul/li[contains(.,\"Author\")]")[0].content[/: (.*),/, 1],
        :content => content.to_html, :title => content.xpath("h1")[0].content })
    output = output.gsub(/^[\s]*$\n/, "")
    output = output.gsub(%r{^\s*//.*\n}, "")
    File.open(task.name, "w") do |file|
      file.write(output)
    end
  end
end
