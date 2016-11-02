# Converts Markdown-formatted notes into HTML documents.
#
# This script makes two assumptions about the notes it consumes:
#
#   - The first block element of the note must be a first-level
#     header which used as the HTML document title.
#   - The second block element must be an unordered list of note
#     metadata where each item must be formatted as `KEY: VALUE`. At the
#     moment, the only required item is an "Author" item.
#
# Bad things will happen if the two required block elements are missing;
# this script is incredibly fragile! For examples, please see the
# accompanying Markdown notes.
#
# This file was written by Damien Dart, <damiendart@pobox.com>. This is
# free and unencumbered software released into the public domain. For
# more information, please refer to the accompanying "UNLICENCE" file.

require "bundler/setup"
require "open3"
require "rubygems"
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
      last_update_html.inner_html = "Last updated: <a data-timestamp=\"" +
          `git log -n 1 --pretty=format:%at #{document_basename}.markdown` +
          "\" href=\"https://www.robotinaponcho.net/git/?p=notes.git;h=" +
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
    stdin, stdout, stderr = Open3.popen3("html-minifier --remove-comments " +
        "--decode-entities --collapse-whitespace -o #{task.name}")
    stdin.puts(output)
  end
end
