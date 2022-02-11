clear ;
% For camera 1
%% Which camera to exclude. 
%a = 
b = 1;
%%

adaptername = 'linuxvideo';%or  'winvideo; for windows;
outputformat = 'YUY2_1280x720';%  'YUY2_1280x720' for windows
% zstage = arduino();
% %% 
% arduinoPin ='D8';
 prompt = 'Please enter the sample name ';
 sample_name = input(prompt, 's');

%%  Acqusition and source settings




vid1 = videoinput(adaptername, b(1), outputformat);
%src1 = getselectedsource(vid1);
vid1.FramesPerTrigger = 10;  %Bin away first few frames since the camera just starts acquisition, otherwise the capture images will be black
src1 = getselectedsource(vid1);
src.Brightness = -9;
src1.Saturation = 64;
src1.Contrast = 50;
src1.Gamma = 300;
src1.Sharpness = 50;
%src1.WhiteBalanceTemperature = 4600;
vid1.ReturnedColorspace = 'grayscale';
%triggerconfig(vid1, 'manual');
%triggerconfig(vid2, 'manual');
%triggerconfig(vid3, 'manual');
%triggerconfig(vid4, 'manual');

%%
i1 = 0;

act = [1, 2, 3, 4, 5, 6, 7, 8, 9];





i1=i1+1;
folder=num2str(i1);
mkdir(fullfile('/home/vinayak/Braincam/filter_test_umn',sample_name, folder))
file_loc=[fullfile('/home/vinayak/Braincam/filter_test_umn', sample_name, folder), '/'];
 %for cam1
frames=getsnapshot(vid1);
c1=strcat(file_loc, num2str(act(1)),'.tiff');
imwrite(frames, c1);