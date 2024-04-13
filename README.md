# Changed_dll
This bash script Identifies changed dlls using fille hash. usable in ci/cd pipelines

use zip_changed_dll.sh or copy_changed_dll.sh to move changed dlls to stage/test server in your pipeline after build

then add save_to_file.sh script to the end of your pipeline to save current dll file hashes in a file

this file will be later used to identify changed dlls next time you run your pipeline
