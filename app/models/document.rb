class Document < ActiveRecord::Base
    
    validate :file_size_under_ten_mb
    
    def initialize(params = {})
        file = params.delete(:file)
        super
        if file
            self.filename = sanitize_filename(file.original_filename)
            self.content_type = file.content_type
            self.file_contents = file.read
        end
    end
    
    NUM_BITS_IN_MEGABYTE = 1048576
    def file_size_under_ten_mb
        if (@file_size.to_f / NUM_BITS_IN_MEGABYTE) > 10
            errors.add(:file, 'File size cannot be over ten megabytes')
        end
    end
    
    private
        def sanitize_filename(filename)
            return File.basename(filename)
        end
end
