function startup(varargin)
%% STARTUP - Script to run startup scripts of sub-packages

% Copyright 2020 The MathWorks, Inc.

% Don't run the startup file if executed from within a deployed function (CTF)
if ~isdeployed()

here = fileparts(mfilename('fullpath'));

iDisplayBanner('MathWorks interfaces for Google Cloud Platform products');
disp('Running package startup scripts');

listing = dir(here);

for n = 1:numel(listing)
    listing(n).name
    if listing(n).isdir
        pspPattern = '^matlab-\S+';
        pspPatternIndex = regexpi(listing(n).name, pspPattern);
        if pspPatternIndex == 1
            startupPath = [listing(n).name, filesep, 'Software', filesep, 'MATLAB'] %#ok<NOPRT>
            if exist(fullfile(here, startupPath, 'startup.m'), 'file') == 2
                disp(['Running: ', fullfile(here, startupPath, 'startup.m')]);
                run(fullfile(here, startupPath, 'startup.m'))
            else
                disp(['No startup.m found for: ', listing(n).name]);
            end
        end
    end
end

end % deployed
end


%% HELPER function to create a banner
function iDisplayBanner(appStr)
disp(appStr);
disp(repmat('-',1,numel(appStr)));
end
