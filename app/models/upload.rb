class Upload < ActiveRecord::Base
	
	has_attached_file :src, :styles => { :thumb => "140x140>" }
	
	include Rails.application.routes.url_helpers
	
	def to_jq_upload
    {
      "name" => read_attribute(:src_file_name),
      "size" => read_attribute(:src_file_size),
      "url" => src.url(:original),
			"thumbnailUrl" => src.url(:thumb),
      "objectUrl" => polymorphic_path(self),
      "deleteType" => "DELETE" 
    }
  end

	def multiple_src=(values = [])
		self.src = values.first
	end
	
end
