class Page < ActiveRecord::Base

	has_one :page_content, dependent: :destroy
	validates_uniqueness_of :url
	after_create :build_page_content

	def as_json(options)
		super(only: [:url],
			include: {
				page_content: {only: [:h1, :h2, :h3, :links]}
		  }
	  )
	end

	private
		def build_page_content
			page_data = Crawlar.new(self.url)
			self.create_page_content( h1: page_data.get_h1_list, 
															  h2: page_data.get_h2_list, 
															  h3: page_data.get_h3_list, 
															  links: page_data.get_url_list
															)
		end
end
