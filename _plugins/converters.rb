# https://github.com/txt2tags/plugins
# by Aurelio Jargas, MIT Licensed

# Instructions:
# Save this file inside the _plugins folder for your Jekyll site

module Jekyll
	class Txt2tagsConverter < Converter
		safe true
		priority :low

		def matches(ext)
			ext =~ /^\.t2t$/i
		end

		def output_ext(ext)
			".html"
		end

		# content => post/page contents (text only, no Front Matter)
		# return  => contents converted to HTML by txt2tags
		def convert(content)

			# Save contents to a temporary file, and run txt2tags on it.
			# Note: added a leading blank line to mean "Empty Headers".
			#       http://txt2tags.org/userguide/HeaderArea.html

			temp_file = '/tmp/jekyll.t2t'
			File.open(temp_file, 'w') { |f| f.write("\n" + content) }

			# Customize the txt2tags command line options as you wish.
			# You can also use %!options on pages/posts.
			`txt2tags -t html --no-headers --css-sugar -i #{temp_file} -o -`
		end
	end
end

# Other converter plugins
# Asciidoc: https://github.com/asciidoctor/jekyll-asciidoc
# HAML:     https://gist.github.com/dtjm/517556
# Jade:     https://github.com/snappylabs/jade-jekyll-plugin
# Org:      https://gist.github.com/abhiyerra/7377603
# Rst:      https://github.com/xdissent/jekyll-rst
