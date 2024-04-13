# Changed_dll
This bash script Identifies changed dlls using fille hash. usable in ci/cd pipelines

use zip_changed_files.sh or copy_changed_file.sh to move changed dlls to stage/test server in your pipeline after build

then add save_to_file.sh script to the end of your pipeline to save current dll file hashes in a file

this file will be later used to identify changed dlls next time you run your pipeline

Note:the dll is optimal you can use any file type by editing the script
