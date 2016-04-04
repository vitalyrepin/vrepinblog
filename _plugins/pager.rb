module Jekyll
  module PaginateLangs
    class Pager < Paginate::Pager

  #  class Pager
      @current_lang = ""

      attr_reader :page, :per_page, :posts, :total_posts, :total_pages,
         :previous_page, :previous_page_path, :next_page, :next_page_path

      # Determine if pagination is enabled the site.
      #
      # site - the Jekyll::Site object
      #
      # Returns true if pagination is enabled, false otherwise.
      def self.pagination_enabled?(site)
       !site.config['paginate_l'].nil? &&
         site.pages.size > 0
      end

      # Static: Determine if a page is a possible candidate to be a template page.
      #         Page's name must be `index.html` and exist in any of the directories
      #         between the site source and `paginate_path`.
      #
      # config - the site configuration hash
      # page   - the Jekyll::Page about which we're inquiring
      #
      # Returns true if the
      def self.pagination_candidate?(config, page)
        page_dir = File.dirname(File.expand_path(remove_leading_slash(page.path), config['source']))
        paginate_path = remove_leading_slash(config['paginate_path'])
        paginate_path = File.expand_path(page['lang'] + '/' + paginate_path, config['source'])
        @current_lang = page['lang']
	page.name == 'index.html' &&
          in_hierarchy(config['source'], page_dir, File.dirname(paginate_path))
      end

      
      # Static: Return the pagination path of the page
      #
      # site     - the Jekyll::Site object
      # num_page - the pagination page number
      #
      # Returns the pagination path as a string
      def self.paginate_path(site, num_page)
        return nil if num_page.nil?
        return Pagination.first_page_url(site) if num_page <= 1
        format = '/' + @current_lang + site.config['paginate_path']
        format = format.sub(':num', num_page.to_s)
	Jekyll.logger.warn format
        ensure_leading_slash(format)
      end

      # Initialize a new Pager.
      #
      # site     - the Jekyll::Site object
      # page      - The Integer page number.
      # all_posts - The Array of all the site's Posts.
      # num_pages - The Integer number of pages or nil if you'd like the number
      #             of pages calculated.
      def initialize(site, page, all_posts, lang, num_pages = nil)
        @page = page
        @per_page = site.config['paginate_l'].to_i
        @total_pages = num_pages || Pager.calculate_pages(all_posts, @per_page)
        @current_lang = lang

        if @page > @total_pages
          raise RuntimeError, "page number can't be greater than total pages: #{@page} > #{@total_pages}"
        end

        init = (@page - 1) * @per_page
        offset = (init + @per_page - 1) >= all_posts.size ? all_posts.size : (init + @per_page - 1)

        @total_posts = all_posts.size
        @posts = all_posts[init..offset]
        @previous_page = @page != 1 ? @page - 1 : nil
        @previous_page_path = Pager.paginate_path(site, @previous_page)
        @next_page = @page != @total_pages ? @page + 1 : nil
        @next_page_path = Pager.paginate_path(site, @next_page)
      end
    end
  end
end
