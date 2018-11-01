# Converts Markdown-formatted notes into Haml documents.
#
# Converts Markdown-formatted notes into Haml documents suitable for
# processing with <https://www.robotinaponcho.net/git/#robotinaponcho>.
#
# This script makes two assumptions about the notes it consumes:
#
#   - The first block element of the note must be a first-level header
#     which used as the HTML document title.
#   - The second block element must be an unordered list of note
#     metadata where each item must be formatted as `KEY: VALUE`.
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


FileList["*.markdown"].map do |file|
  basename = File.basename(file, ".markdown")
  CLOBBER << "#{basename}.haml"
  desc "Spit out \"#{basename}.haml\"."
  file "#{basename}.haml" => FileList[file, "Rakefile"] do |task|
    puts "# Spitting out \"#{task.name}\"."
    content = Nokogiri::HTML.fragment(Redcarpet::Markdown.new(
        Redcarpet::Render::HTML).render(File.read(file)))
    if (!IO.popen("git log #{file}").readlines.empty?)
      last_update_html = Nokogiri::XML::Node.new("li", content)
      last_update_html.inner_html = "<strong>Last updated</strong>: <a data-timestamp=\"" +
          `git log -n 1 --pretty=format:%at #{file}` +
          "\" href=\"https://github.com/damiendart/notes/commit/" +
          `git log -n 1 --pretty=format:%H #{file}` + "\">" +
          `git log -n 1 --date=short --pretty=format:%ad #{file}` + "</a>"
      content.xpath("h1/following-sibling::ul")[0].add_child(last_update_html)
    end
    if (task.name == "index.haml")
      description = content.xpath("h1/following-sibling::ul/li[contains(.,\"Description\")]")[0].remove.content[/: (.*)/m, 1].gsub(/\n/," ")
      content.xpath("h1/following-sibling::ul")[0].remove
    else
      content.xpath("h1/following-sibling::ul")[0]["class"] = "metadata"
      content.xpath("h1/following::ul[1]/li").sort_by{ |i| i.content }.each { |node|
          node.parent = content.xpath("h1/following-sibling::ul")[0] }
      description = content.xpath("h1/following-sibling::ul/li[contains(.,\"Description\")]")[0].remove.content[/: (.*)/m, 1].gsub(/\n/," ")
    end
    body = content.to_html.gsub(/(\n+)/){ $1 + "  " }
    title = content.xpath("h1")[0].content
    File.open(task.name, "w") do |file|
      file.write <<~HAML
        -#
          ---
          dependencies: "%OUTPUT_DIRECTORY%/notes/notes.css"
          description: #{description}
          javascript: pages/notes/notes.js
          css_external: notes.css
          title: #{title}
          ---


        %nav
          %a{:href => "https://www.robotinaponcho.net/"} www.robotinaponcho.net
          &rarr;
          %a{:href => "https://www.robotinaponcho.net/notes/"} <span>Damien's </span>Notes
          %hr
        :erb
          #{body}
      HAML
    end
  end
end


task :default => CLOBBER
