require 'fileutils'

module SharedUtils

    # For model
    module Model
        
        def before_save_hook
            self.status = "Enable"
        end
    end

    module  Folder

        # Create a folder

        def create_folder(folder)
            unless File.exists?(folder) 
                #Dir.mkdir(folder)
                FileUtils.mkdir_p(folder)

            else
                puts "Folder exist!"
            end
        end

        
    end


end