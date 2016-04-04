require 'jekyll-paginate/pager'

module Jekyll
  module PaginateLangs
    class Pagination < Generator
      # This generator is safe from arbitrary code execution.
      safe true

      # This generator should be passive with regard to its execution
      priority :lowest

      @current_lang = ""
      # Generate paginated pages if necessary.
      #
      # site - The Site.
      #
      # Returns nothing.
      def generate(site)
        Jekyll.logger.warn "PaginateLangs:", "Exec!"
        site.config['paginate_langs'].each do |lang|
	  Jekyll.logger.warn lang
        end
        site.config['paginate_langs'].each do |lang|
	  @current_lang = lang
	  if Pager.pagination_enabled?(site)
            if template = template_page(site, lang)
              paginate(site, template, lang)
            else
              Jekyll.logger.warn "Pagination:", "Language " + lang + ": pagination is enabled, but I couldn't find " +
              "an index.html page to use as the pagination template. Skipping pagination."
            end
          end
        end
      end
      # Paginates the blog's posts. Renders the index.html file into paginated
      # directories, e.g.: page2/index.html, page3/index.html, etc and adds more
      # site-wide data.
      #
      # site - The Site.
      # page - The index.html Page that requires pagination.
      #
      # {"paginator" => { "page" => <Number>,
      #                   "per_page" => <Number>,
      #                   "posts" => [<Post>],
      #                   "total_posts" => <Number>,
      #                   "total_pages" => <Number>,
      #                   "previous_page" => <Number>,
      #                   "next_page" => <Number> }}
      def paginate(site, page, lang)
	all_posts = site.site_payload['site']['posts']
        all_posts = all_posts.reject { |p| p['hidden'] }
        all_posts = all_posts.reject { |p| p['lang'] != lang}

        Jekyll.logger.info "Paginating for the " + lang + " language: ", all_posts
        pages = Pager.calculate_pages(all_posts, site.config['paginate_l'].to_i)
        (1..pages).each do |num_page|
          pager = Pager.new(site, num_page, all_posts, lang, pages)
          if num_page > 1
            newpage = Page.new(site, site.source, page.dir, page.name)
            newpage.pager = pager
            newpage.dir = Pager.paginate_path(site, num_page)
            site.pages << newpage
          else
            page.pager = pager
          end
        end
      end

      # Static: Fetch the URL of the template page. Used to determine the
      #         path to the first pager in the series.
      #
      # site - the Jekyll::Site object
      #
      # Returns the url of the template page
      def self.first_page_url(site)
        Jekyll.logger.warn @current_lang
        if page = Pagination.new.template_page(site, @current_lang)
          page.url
        else
          nil
        end
      end

      # Public: Find the Jekyll::Page which will act as the pager template
      #
      # site - the Jekyll::Site object
      #
      # Returns the Jekyll::Page which will act as the pager template
      def template_page(site, lang)
        site.pages.dup.select do |page|
	  (page['lang'] == lang) && (Pager.pagination_candidate?(site.config, page))
        end.sort do |one, two|
          two.path.size <=> one.path.size
        end.first
      end

    end
  end
end
