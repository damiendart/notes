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


FileList["*.markdown"].map do |file|
  basename = File.basename(file, ".markdown")
  CLOBBER << "#{basename}.html"
  desc "Spit out \"#{basename}.html\"."
  file "#{basename}.html" => FileList[file, "Rakefile", "template.*"] do |task|
    puts "# Spitting out \"#{task.name}\"."
    content = Nokogiri::HTML.fragment(
        Redcarpet::Render::SmartyPants.render(
            Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(File.read(file))))
    if (!IO.popen("git log #{file}").readlines.empty?)
      last_update_html = Nokogiri::XML::Node.new("li", content)
      last_update_html.inner_html = "<strong>Last updated</strong>: <a data-timestamp=\"" +
          `git log -n 1 --pretty=format:%at #{file}` +
          "\" href=\"https://www.robotinaponcho.net/git/?p=notes.git;h=" +
          `git log -n 1 --pretty=format:%H #{file}` + "\">" +
          `git log -n 1 --date=short --pretty=format:%ad #{file}` + "</a>"
      content.xpath("h1/following-sibling::ul")[0].add_child(last_update_html)
    end
    content.xpath("h1/following-sibling::ul")[0]["class"] = "metadata"
    content.xpath("h1/following::ul[1]/li").sort_by{ |i| i.content }.each { |node|
        node.parent = content.xpath("h1/following::ul")[0] }
    stdin, stdout, stderr = Open3.popen3("html-minifier --remove-comments " +
        "--minify-js --minify-css --decode-entities --collapse-whitespace " +
        "--minify-ur-ls https://www.robotinaponcho.net/notes/#{basename} " +
        # HACK: Decode semi-colons and equals signs in GitWeb-related
        # URLs with sed after the HTML minification encodes them.
        "-o #{task.name} && sed -i 's/%3B/;/g; s/%3D/=/g' #{task.name}")
    stdin.puts(Haml::Engine.new(File.read("template.haml")).render(Object.new, {
        :author => content.xpath("h1/following-sibling::ul/li[contains(.,\"Author\")]")[0].content[/: (.*),/, 1],
        :basename => basename,
        :description => content.xpath("h1/following-sibling::ul/li[contains(.,\"Description\")]")[0].remove.content[/: (.*)/m, 1].gsub(/\n/," "),
        :title => content.xpath("h1")[0].content,
        :content => (task.name == "index.html" ? content.xpath("ul[contains(@class,\"metadata\")]")[0].remove && content.to_html : content.to_html)}))
  end
end


task :default => CLOBBER
