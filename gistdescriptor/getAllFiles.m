function fileList_scaled = getAllFiles(lfw_blurred)

  dirData = dir(lfw_blurred);      %# Get the data for the current directory
  dirIndex = [dirData.isdir];  %# Find the index for directories
  fileList_scaled = {dirData(~dirIndex).name}';  %'# Get a list of the files
  if ~isempty(fileList_scaled)
    fileList_scaled = cellfun(@(x) fullfile(lfw_blurred,x),...  %# Prepend path to files
                       fileList_scaled,'UniformOutput',false);
  end
  subDirs = {dirData(dirIndex).name};  %# Get a list of the subdirectories
  validIndex = ~ismember(subDirs,{'.','..'});  %# Find index of subdirectories
                                               %#   that are not '.' or '..'
  for iDir = find(validIndex)                  %# Loop over valid subdirectories
    nextDir = fullfile(lfw_blurred,subDirs{iDir});    %# Get the subdirectory path
    fileList_scaled = [fileList_scaled; getAllFiles(nextDir)];  %# Recursively call getAllFiles
  end

end