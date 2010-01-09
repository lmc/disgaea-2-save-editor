class Character
  module Images
    def self.included(base)
      base.send(:extend, ClassMethods)
      base.send(:include,InstanceMethods)
    end
    
    module ClassMethods
      def image_path(image_type,class_name,rank_id = 0)
        path = ['images','characters']
        class_name = CLASS_IDS[class_name] if class_name.is_a?(Numeric)
        path << class_name
        #path << rank_id
        path << 0 #FIXME: always using base rank for now 
        path << "#{image_type.to_s}.#{IMAGE_TYPE_EXTENSIONS[image_type]}"
        '/' + path.join('/')
      end
    end
    
    module InstanceMethods
      def image_path(image_type)
        self.class.image_path(image_type,class_id,rank_colour)
      end
    end
  end
  
  IMAGE_TYPE_EXTENSIONS = {
    :cut    => 'jpg',
    :face   => 'jpg',
    :sprite => 'png'
  }
end