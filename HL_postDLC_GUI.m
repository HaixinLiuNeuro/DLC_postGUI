function varargout = HL_postDLC_GUI(varargin)
% HL_POSTDLC_GUI MATLAB code for HL_postDLC_GUI.fig
%      HL_POSTDLC_GUI, by itself, creates a new HL_POSTDLC_GUI or raises the existing
%      singleton*.
%
%      H = HL_POSTDLC_GUI returns the handle to a new HL_POSTDLC_GUI or the handle to
%      the existing singleton*.
%
%      HL_POSTDLC_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HL_POSTDLC_GUI.M with the given input arguments.
%
%      HL_POSTDLC_GUI('Property','Value',...) creates a new HL_POSTDLC_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HL_postDLC_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HL_postDLC_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HL_postDLC_GUI

% Last Modified by GUIDE v2.5 12-May-2021 22:57:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @HL_postDLC_GUI_OpeningFcn, ...
    'gui_OutputFcn',  @HL_postDLC_GUI_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before HL_postDLC_GUI is made visible.
function HL_postDLC_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HL_postDLC_GUI (see VARARGIN)

% Choose default command line output for HL_postDLC_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HL_postDLC_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HL_postDLC_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in ObjectList.
function ObjectList_Callback(hObject, eventdata, handles)
% hObject    handle to ObjectList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ObjectList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ObjectList

data = guidata(hObject);

data.Data.part2plot = get(hObject,'Value');
max_select = get(hObject,'Max');

if length(data.Data.part2plot) > 3
    data.Data.part2plot = data.Data.part2plot(1:3);
    set(hObject,'Value',data.Data.part2plot);
    figure(data.figure1);
    
else
    % first reset selected panel data, then fill in new
    for i_part = 1:max_select
        switch i_part
            case 1
                set(handles.Position_body1,'String',num2str(NaN));
                set(handles.Position_body1,'BackgroundColor',data.Data.part_color(1,:));
                set(handles.Position_body1,'ForegroundColor',[1 1 1]);
                set(handles.Xcoor_body1,'String',num2str(NaN));
                set(handles.YCoor_body1,'String',num2str(NaN));
                set(handles.ProbValue_body1,'String',num2str(NaN));
            case 2
                set(handles.Position_body2,'String',num2str(NaN));
                set(handles.Position_body2,'BackgroundColor',data.Data.part_color(2,:));
                set(handles.Position_body2,'ForegroundColor',[1 1 1]);
                set(handles.Xcoor_body2,'String',num2str(NaN));
                set(handles.Ycoor_body2,'String',num2str(NaN));
                set(handles.ProbValue_body2,'String',num2str(NaN));
                
            case 3
                set(handles.Position_body3,'String',num2str(NaN));
                set(handles.Position_body3,'BackgroundColor',data.Data.part_color(3,:));
                set(handles.Position_body3,'ForegroundColor',[1 1 1]);
                set(handles.Xcoor_body3,'String',num2str(NaN));
                set(handles.Ycoor_body3,'String',num2str(NaN));
                set(handles.ProbValue_body3,'String',num2str(NaN));
        end
    end
    for i_part = 1:length(data.Data.part2plot)
        switch i_part
            case 1
                set(handles.Position_body1,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
                set(handles.Position_body1,'BackgroundColor',data.Data.part_color(1,:));
                set(handles.Position_body1,'ForegroundColor',[1 1 1]);
                set(handles.Xcoor_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
                set(handles.YCoor_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
                set(handles.ProbValue_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
            case 2
                set(handles.Position_body2,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
                set(handles.Position_body2,'BackgroundColor',data.Data.part_color(2,:));
                set(handles.Position_body2,'ForegroundColor',[1 1 1]);
                set(handles.Xcoor_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
                set(handles.Ycoor_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
                set(handles.ProbValue_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
                
            case 3
                set(handles.Position_body3,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
                set(handles.Position_body3,'BackgroundColor',data.Data.part_color(3,:));
                set(handles.Position_body3,'ForegroundColor',[1 1 1]);
                set(handles.Xcoor_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
                set(handles.Ycoor_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
                set(handles.ProbValue_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
                
        end
    end
    
    
    % also update the correction panel's list
    set(handles.CorrectionList,'String',{data.Data.body_parts{data.Data.part2plot}});
    data.Data.correction_ind_in_part2plot = 1;
    set(handles.CorrectionList,'Value',data.Data.correction_ind_in_part2plot);
    set(handles.CorrectionList,'BackgroundColor',data.Data.part_color(data.Data.correction_ind_in_part2plot,:));
    
    % update plots
    guidata(hObject,data)
    plot_current_frame (hObject, eventdata, handles)
end

%
% listBox2Data = get(handles.listbox2,'String');
% if isempty(listBox2Data) || ~any(strcmpi(listBox2Data, selectedString))
%     listBox2Data = [selectedString, listBox2Data];
%     set(handles.listbox2,'String',listBox2Data);
% end

% --- Executes during object creation, after setting all properties.
function ObjectList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ObjectList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SelectMovie.
function SelectMovie_Callback(hObject, eventdata, handles)
% hObject    handle to SelectMovie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

disp('loading ... ... wait')
% warndlg('For a new session, you NEED to start the GUI again. Kill or PRESS ENTER to continue');
% % need to refresh the data
% disp('For a new session, you NEED to start the GUI again. Kill or PRESS ENTER to continue')
% pause
data = guidata(hObject);
% initiated a new session, delete old data
if isfield(data, 'Data')
   disp('Initiating a new session, clearing old Data') ;
   % close the figures of the previous 
   close(data.Data.fig_coor_h)
   close(data.Data.fig_im_h)
   data = rmfield(data, 'Data');
end
% temp = fieldnames(data,'-full');
% temp_logic = cellfun(@(x)isobject( data.(x)),temp);
% % for ii = 1:length(temp)
% %    disp([ temp{ii}, ' ', num2str(temp_logic(ii))])
% % end
% data = rmfield(data,temp(~temp_logic));
% disp(data)
[data.Data.movie_fn,data.Data.movie_path] = uigetfile('*.mp4*','Select Video');

% if processed already load mat file
matfile = dir([data.Data.movie_path, data.Data.movie_fn(1:(end-4)) '_*.mat']);
if length(matfile)>1 % different version of matlab files
    [matfile_temp,~ ]= uigetfile([data.Data.movie_path, data.Data.movie_fn(1:end-4) '_*.mat'], ...
        'Choose the matlab file for the result processed');
    clear matfile
    matfile.name = matfile_temp;
    fprintf('Selected .mat file: %s\n',  matfile.name);
end

if ~isempty(matfile)
    disp('Continue or New: 1 or 0')
    flag_continue = input('Continue or New: 1 or 0\n');
end

if ~isempty(matfile) && flag_continue
    
    disp('Continue examining')
    temp = load(fullfile(data.Data.movie_path,matfile.name));
    data.Data.Track = temp;
    disp(['Last left at trial: ', num2str(data.Data.Track.curr_trial)]);
    % take care of previous dataset, add ori field
    % load data properly
    if ~isfield(data.Data.Track, 'Ori') % reload original data
        csv_fn = dir([data.Data.movie_path, data.Data.movie_fn(1:end-4) '*.csv']);
        
        if isempty(csv_fn)
            warning('No csv Front file found in movie folder, Select the CSV elsewhere');
            % just open GUI selection
            [csv_fn, csv_path ]= uigetfile([data.Data.movie_path, '*.csv'], ['Select CSV file for: ' data.Data.movie_fn(1:end-4)]);
            data.Data.csv_fn = fullfile(csv_path, csv_fn);
            
        else
            % if multple files, ask to select
            if length(csv_fn)>1
                [csv_fn,~ ]= uigetfile([data.Data.movie_path, data.Data.movie_fn(1:end-4) '*.csv']);
                data.Data.csv_fn = fullfile(data.Data.movie_path, csv_fn);
            else
                data.Data.csv_fn = fullfile(csv_fn.folder, csv_fn.name);
            end
        end
        % fetch all body parts
        fh = fopen(data.Data.csv_fn);
        fgetl(fh); % skip the first line
        colnames = strsplit(fgetl(fh),','); %extract column names
        % check if this is old DLC result or new  maDLC result
        if strcmp(colnames{1},'individuals')
            disp('maDLC');
            colnames = strsplit(fgetl(fh),',');
            M = csvread(data.Data.csv_fn, 4,0); % read in all the numbers
        else
            disp('single animal DLC');
            M = csvread(data.Data.csv_fn, 3,0); % read in all the numbers
        end
        fclose(fh);
        
        data.Data.Track.Ori_frame_ind = M(:,1)+1;
        for i_part = 1:(length(colnames)-1)/3 % skip the first column which is frame number
            %set ori
            data.Data.Track.Ori.(colnames{3*(i_part-1)+1+1}).x = M(:,1+1+3*(i_part-1));
            data.Data.Track.Ori.(colnames{3*(i_part-1)+1+1}).y = M(:,1+2+3*(i_part-1));
            data.Data.Track.Ori.(colnames{3*(i_part-1)+1+1}).Likelihood = M(:,1+3+3*(i_part-1));
        end
        
        
    else
        csv_fn = NaN;
        data.Data.csv_fn = data.Data.Track.csv_fn; % display the loaded csv fn in
    end
elseif ~isempty(dir([data.Data.movie_path, data.Data.movie_fn(1:end-4) '*.DLCcmb']))
    disp('New examining DLCcmb')
    %% combined DLC result file . DLCcmb
    csv_fn = dir([data.Data.movie_path, data.Data.movie_fn(1:end-4) '*.DLCcmb']);
    data.Data.csv_fn = fullfile(csv_fn.folder, csv_fn.name);
    temp = load(data.Data.csv_fn, '-MAT');
    data.Data.Track = temp;
    
else
    % ask if DLC result .csv file or SLEAP result .h5
    result_type = input('Are you using the result of DLC (.csv) -- 1 or SLEAP (.h5) -- 2: Please type in the answer');
    while ~any(result_type)
           result_type = input('Are you using the result of DLC (.csv) -- 1 or SLEAP (.h5) -- 2: Please type in the answer'); 
    end
    switch result_type
        case 1
    %% regular csv result from DLC ouput
    disp('New examining DLC csv file')
    
    % get corresponding .csv file (DLC result)
    csv_fn = dir([data.Data.movie_path, data.Data.movie_fn(1:end-4) '*.csv']);
    %     csv_fn_Side = dir([data.Data.movie_path, data.Data.movie_fn_Side(1:end-4) '*.csv']);
    % HL 2021-4-14 add in .csvcmb file type, which is the combined DLC result
    % in .mat format
    
    if isempty(csv_fn)
        warning('No csv Front file found in movie folder, Select the CSV elsewhere');
        % just open GUI selection
        [csv_fn, csv_path ]= uigetfile([data.Data.movie_path, '*.csv'], ['Select CSV file for: ' data.Data.movie_fn(1:end-4)]);
        data.Data.csv_fn = fullfile(csv_path, csv_fn);
        
    else
        % if multple files, ask to select
        if length(csv_fn)>1
            [csv_fn,~ ]= uigetfile([data.Data.movie_path, data.Data.movie_fn(1:end-4) '*.csv'], ['Select CSV file for: ' data.Data.movie_fn(1:end-4)]);
            data.Data.csv_fn = fullfile(data.Data.movie_path, csv_fn);
        else
            data.Data.csv_fn = fullfile(csv_fn.folder, csv_fn.name);
        end
    end
    
    % fetch all body parts
    fh = fopen(data.Data.csv_fn);
    fgetl(fh); % skip the first line
    colnames = strsplit(fgetl(fh),','); %extract column names
    % check if this is old DLC result or new  maDLC result
    if strcmp(colnames{1},'individuals')
        disp('maDLC');
        colnames = strsplit(fgetl(fh),',');
        M = csvread(data.Data.csv_fn, 4,0); % read in all the numbers
    else
        disp('single animal DLC');
        M = csvread(data.Data.csv_fn, 3,0); % read in all the numbers
    end
    fclose(fh);
    
    data.Data.Track.Corrected_frame_ind = M(:,1)+1; % the frame number starts from 0, due to python
    data.Data.Track.Ori_frame_ind = data.Data.Track.Corrected_frame_ind;
    for i_part = 1:(length(colnames)-1)/3 % skip the first column which is frame number
        data.Data.Track.Corrected.(colnames{3*(i_part-1)+1+1}).x = M(:,1+1+3*(i_part-1));
        data.Data.Track.Corrected.(colnames{3*(i_part-1)+1+1}).y = M(:,1+2+3*(i_part-1));
        data.Data.Track.Corrected.(colnames{3*(i_part-1)+1+1}).Likelihood = M(:,1+3+3*(i_part-1));
        %set ori
        data.Data.Track.Ori.(colnames{3*(i_part-1)+1+1}).x = M(:,1+1+3*(i_part-1));
        data.Data.Track.Ori.(colnames{3*(i_part-1)+1+1}).y = M(:,1+2+3*(i_part-1));
        data.Data.Track.Ori.(colnames{3*(i_part-1)+1+1}).Likelihood = M(:,1+3+3*(i_part-1));
    end
    
        case 2 % SLEAP .h5
    % get corresponding .h file (DLC result)
    csv_fn = dir([data.Data.movie_path, data.Data.movie_fn(1:end-4) '*.h5']);
    %     csv_fn_Side = dir([data.Data.movie_path, data.Data.movie_fn_Side(1:end-4) '*.csv']);
    % HL 2021-4-14 add in .csvcmb file type, which is the combined DLC result
    % in .mat format
    
    if isempty(csv_fn)
        warning('No h5 Front file found in movie folder, Select the CSV elsewhere');
        % just open GUI selection
        [csv_fn, csv_path ]= uigetfile([data.Data.movie_path, '*.h5'], ['Select h5 file for: ' data.Data.movie_fn(1:end-4)]);
        data.Data.csv_fn = fullfile(csv_path, csv_fn);
        
    else
        % if multple files, ask to select
        if length(csv_fn)>1
            [csv_fn,~ ]= uigetfile([data.Data.movie_path, data.Data.movie_fn(1:end-4) '*.h5'], ['Select h5 file for: ' data.Data.movie_fn(1:end-4)]);
            data.Data.csv_fn = fullfile(data.Data.movie_path, csv_fn);
        else
            data.Data.csv_fn = fullfile(csv_fn.folder, csv_fn.name);
        end
    end
    
    % fetch all body parts
%     occupancy_matrix = h5read(data.Data.csv_fn,'/track_occupancy'); % for muilti animal
    tracks_matrix = h5read(data.Data.csv_fn,'/tracks'); % fr x body parts x 2 (x,y)
%     track_names = h5read(data.Data.csv_fn,'/track_names');
%         tracking_scores = h5read(data.Data.csv_fn,'/tracking_scores'); %?? what is this
%         instance_scores = h5read(data.Data.csv_fn,'/instance_scores'); %?? what is this
        node_names = h5read(data.Data.csv_fn,'/node_names'); % body label
 point_scores = h5read(data.Data.csv_fn,'/point_scores'); % confidence interval
%     info = h5info(data.Data.csv_fn);

% node_names = arrayfun(@(x) x{1}, node_names, 'UniformOutput', false)
% now have not figured out how to remove the space after the name... just
% use first 4 letters

    data.Data.Track.Corrected_frame_ind = [1:size(tracks_matrix,1)]';% % the frame number starts from 0, due to python
    data.Data.Track.Ori_frame_ind = data.Data.Track.Corrected_frame_ind;
    for i_part = 1:length(node_names)
        data.Data.Track.Corrected.(node_names{i_part}(1:4)).x = tracks_matrix(:,i_part,1);
        data.Data.Track.Corrected.(node_names{i_part}(1:4)).y = tracks_matrix(:,i_part,2);
        data.Data.Track.Corrected.(node_names{i_part}(1:4)).Likelihood = point_scores(:,i_part);
        %set ori
        data.Data.Track.Ori.(node_names{i_part}(1:4)).x = data.Data.Track.Corrected.(node_names{i_part}(1:4)).x;
        data.Data.Track.Ori.(node_names{i_part}(1:4)).y = data.Data.Track.Corrected.(node_names{i_part}(1:4)).y;
        data.Data.Track.Ori.(node_names{i_part}(1:4)).Likelihood = data.Data.Track.Corrected.(node_names{i_part}(1:4)).Likelihood;
    end
            
        otherwise
            error('File type not implemented yet')
    end
end

% add in variables needed
if ~isfield(data.Data.Track, 'idx_bad_trial')
    data.Data.Track.idx_bad_trial  = [];
end
if ~isfield(data.Data.Track, 'fr_idx_add2deeplab')
    data.Data.Track.fr_idx_add2deeplab  = [];
end



%get video

data.Data.Movie_Obj = VideoReader(fullfile(data.Data.movie_path, data.Data.movie_fn));

% set current frame number to 1
data.Data.curr_fr = 1;
data.Data.N_fr_tol = data.Data.Movie_Obj.NumberOfFrames;


if isempty(csv_fn)
    erorr('No CSV file name found')
    % need to implement the way to just view movie not generating any plots
end

data.Data.frame_n_trial = str2double(get(handles.FrameNumPerTrial,'String')); %get default frame number per trial
data.Data.n_trial = ceil(data.Data.N_fr_tol/data.Data.frame_n_trial); % skip the last several points not a complete trial
% warning('Currently skip the last data points NOT completing a trial')
data.Data.curr_fr_trial = 1;

guidata(hObject,data);

%% update text file
% Filename_Callback(data.Filename, eventdata, data)
set(handles.MovieFileName,'String', fullfile(data.Data.movie_path, data.Data.movie_fn));
if ischar(data.Data.csv_fn)
    set(handles.CSVFileName,'String',  data.Data.csv_fn);
else
    set(handles.CSVFileName,'String',  cat(2,data.Data.csv_fn{:}));
end
% TotalFrame_Callback(handles.TotalFrame, eventdata, handles)
set(handles.TotalFrameNum,'String', num2str(data.Data.N_fr_tol));
% CurrFrame_Callback(handles.CurrFrame, eventdata, handles)
set(handles.NumofTrials,'String', num2str(data.Data.n_trial));
set(handles.CurrTrialNum,'String', num2str(data.Data.curr_fr_trial));

data.Data.idx_current_trial_frs = (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);

% delete corner data points
data.Data.body_parts = fieldnames(data.Data.Track.Corrected);
for i_part = 1:length(data.Data.body_parts)
    temp = find(data.Data.Track.Corrected.(data.Data.body_parts{i_part}).x<50 & ...
        data.Data.Track.Corrected.(data.Data.body_parts{i_part}).y<50);
    data.Data.Track.Corrected.(data.Data.body_parts{i_part}).x(temp) = NaN;
    data.Data.Track.Corrected.(data.Data.body_parts{i_part}).y(temp) = NaN;
end
%% prob threshold
data.Data.prob_thred = 0.9; % need to fetch from GUI
%% Offset due to cropping
data.Data.Track.offset_x = str2double(get(handles.Offset_X,'String'));
data.Data.Track.offset_y = str2double(get(handles.Offset_Y,'String')); % need to fech from GUI, after adding those edit boxes
% data.trial_init_point = str2double(get(handles.InitiatePointFrNum,'String'));

%% initiate plots and body panel
data.Data.N_bodypart = length(data.Data.body_parts);
% showing all parts is too busy, just show the X Y of one selected part
% i_part = 1; % selection, or default 1
data.Data.part_color = [1 0 0; 0 0 1; 0 1 0];
if data.Data.N_bodypart >= 3
    data.Data.part2plot = [1 2 3];
elseif data.Data.N_bodypart >= 2
    data.Data.part2plot = [1 2];
elseif data.Data.N_bodypart == 1
    data.Data.part2plot = [1];
else
    error('body parts not available')
end
% get first frame
temp = rgb2gray( read(data.Data.Movie_Obj,1));
data.Data.im_plot_axis_x = 1:size(temp,2);
data.Data.im_plot_axis_y = 1:size(temp,1);

data.Data.fig_im_h = figure;
cla;
data.Data.plot_h.im = imagesc(data.Data.im_plot_axis_x, data.Data.im_plot_axis_y, temp);%, 'Parent', data.axes_im_Front);
pbaspect([data.Data.im_plot_axis_x(end)/data.Data.im_plot_axis_y(end) 1 1]);
colormap(gray)
hold on;
xlim([data.Data.im_plot_axis_x(1) data.Data.im_plot_axis_x(end)]);
ylim([data.Data.im_plot_axis_y(1) data.Data.im_plot_axis_y(end)]);

plot_num_b = 5; % to fetch in the future
plot_num_a = 20;
curr_plot_range = [(data.Data.curr_fr_n_in_trial-plot_num_b) (data.Data.curr_fr_n_in_trial+plot_num_a)];
if curr_plot_range(1)< 1
    curr_plot_range(1) = 1;
end
if curr_plot_range(2) > data.Data.frame_n_trial
    curr_plot_range(2) =  data.Data.frame_n_trial;
end
for i_part = 1:length(data.Data.part2plot)
    data.Data.plot_h.im_line{i_part}  =  plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2))) +data.Data.Track.offset_x, ...
        data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2))) +data.Data.Track.offset_y, 'g.-');
    data.Data.plot_h.im_range{i_part} =  plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs(curr_plot_range(1))) +data.Data.Track.offset_x, ...
        data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs(curr_plot_range(1))) +data.Data.Track.offset_y, 'yx','MarkerFaceColor','y');
    data.Data.plot_h.im_curr{i_part}  =  plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr)+data.Data.Track.offset_x, ...
        data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr)+data.Data.Track.offset_y,...
        'o','MarkerFaceColor',data.Data.part_color(i_part,:),'MarkerEdgeColor',data.Data.part_color(i_part,:));
end


% plot coordinate 1-D
data.Data.fig_coor_h = figure;

for i_part = 1:length(data.Data.part2plot)
    
    data.Data.coor_axes_h.x{i_part}  = subplot(length(data.Data.part2plot)*2,1,i_part*2-1); cla; hold on;
    data.Data.plot_h.Ori_line.x{i_part}  = ...
        plot(data.Data.Track.Ori.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs)+data.Data.Track.offset_x(1), 'b'); % original label result plot first layer
    data.Data.plot_h.Correct_dot.x{i_part}   = ...
        plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs)+data.Data.Track.offset_x(1), 'k.');
    
    temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.idx_current_trial_frs) < data.Data.prob_thred);
    if isempty(temp_idx)
        data.Data.plot_h.X_prob{i_part} = plot(data.Data.curr_fr_n_in_trial, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr)+data.Data.Track.offset_x, 'ks');
    else
        data.Data.plot_h.X_prob{i_part} = plot(temp_idx, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs(temp_idx))+data.Data.Track.offset_x, 'ks');
    end
    data.Data.plot_h.X_curr_circle{i_part}  = plot(data.Data.curr_fr_n_in_trial, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr)+data.Data.Track.offset_x, 'ro');
    data.Data.title_h{i_part} = title(data.Data.body_parts{data.Data.part2plot(i_part)});
    ylabel('X');
    % Y
    data.Data.coor_axes_h.y{i_part}  = subplot(length(data.Data.part2plot)*2,1,i_part*2); cla; hold on;
    data.Data.plot_h.Ori_line.y{i_part}  = ...
        plot(data.Data.Track.Ori.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs)+data.Data.Track.offset_y, 'b'); % original label result plot first layer
    data.Data.plot_h.Correct_dot.y{i_part}   = ...
        plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs)+data.Data.Track.offset_y, 'k.');
    
    temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.idx_current_trial_frs) < data.Data.prob_thred);
    if isempty(temp_idx)
        data.Data.plot_h.Y_prob{i_part} = plot(data.Data.curr_fr_n_in_trial, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr)+data.Data.Track.offset_y, 'ks');
    else
        data.Data.plot_h.Y_prob{i_part} = plot(temp_idx, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs(temp_idx))+data.Data.Track.offset_y, 'ks');
    end
    data.Data.plot_h.Y_curr_circle{i_part}  = plot(data.Data.curr_fr_n_in_trial, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr)+data.Data.Track.offset_y, 'ro');
    ylabel('Y');
end
xlabel('Frame # in current trial')

linkaxes([data.Data.coor_axes_h.x{:} data.Data.coor_axes_h.y{:}], 'x');

%% Body part panel
set(handles.ObjectList,'String',data.Data.body_parts);
set(handles.ObjectList,'Value',data.Data.part2plot);
% Body part name and coordiantes
for i_part = 1:length(data.Data.part2plot)
    switch i_part
        case 1
            set(handles.Position_body1,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
            set(handles.Position_body1,'BackgroundColor',data.Data.part_color(1,:));
            set(handles.Position_body1,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
            set(handles.YCoor_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
            set(handles.ProbValue_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
        case 2
            set(handles.Position_body2,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
            set(handles.Position_body2,'BackgroundColor',data.Data.part_color(2,:));
            set(handles.Position_body2,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
            set(handles.Ycoor_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
            set(handles.ProbValue_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
            
        case 3
            set(handles.Position_body3,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
            set(handles.Position_body3,'BackgroundColor',data.Data.part_color(3,:));
            set(handles.Position_body3,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
            set(handles.Ycoor_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
            set(handles.ProbValue_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
            
    end
end

% Body part list in Correction control
set(handles.CorrectionList,'String',{data.Data.body_parts{data.Data.part2plot}});
data.Data.correction_ind_in_part2plot = 1;
set(handles.CorrectionList,'Value',data.Data.correction_ind_in_part2plot);
set(handles.CorrectionList,'BackgroundColor',data.Data.part_color(data.Data.correction_ind_in_part2plot,:));
set(handles.CorrectionList,'ForegroundColor',[1 1 1]);



%% update guidata
guidata(hObject,data)

%% change to initate point for current trial, then update plot
data.Data.trial_init_point = str2double(get(handles.InitiatePointFrNum,'String'));
data.Data.curr_fr_n_in_trial = data.Data.trial_init_point;
data.Data.curr_fr = data.Data.idx_current_trial_frs(data.Data.trial_init_point);

guidata(hObject,data)

plot_current_frame (hObject, eventdata, handles)
%% show some parameters model: Optinal
% fprintf('ReachCropFront crop params: x - %i, y - %i\n', 330, 70 );
% fprintf('ReachCropSide crop params : x - %i, y - %i\n', 880, 130);
% Front: x: 330; y:70
% Side:  x: 880; y: 130


function plot_current_frame (hObject, eventdata, handles)
% tic
data = guidata(hObject);
%% check if figures are closed. if so, reiniated
if ~ishandle(data.Data.fig_im_h)
    re_initiate_im_fig (hObject, eventdata, handles);
    data = guidata(hObject);
end
if ~ishandle(data.Data.fig_coor_h)
    re_initiate_coor_fig (hObject, eventdata, handles);
    data = guidata(hObject);
end
%%
data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);

%% make sure the index do not exceed the total; pad the trial with the last frame

if data.Data.idx_current_trial_frs(end) > data.Data.N_fr_tol
    data.Data.idx_current_trial_frs (data.Data.idx_current_trial_frs > data.Data.N_fr_tol) = data.Data.N_fr_tol;
end
%% update the CDATA
% im
curr_im_Front = rgb2gray( read(data.Data.Movie_Obj,data.Data.curr_fr));
if sum(curr_im_Front(:)) == 0
    disp('Failed reading')
    data.Data.Movie_Obj = VideoReader(fullfile(data.Data.movie_path, data.Data.movie_fn));
    curr_im_Front = rgb2gray( read(data.Data.Movie_Obj,data.Data.curr_fr));
end

plot_num_b = 5;
plot_num_a = 20;
curr_plot_range = [(data.Data.curr_fr_n_in_trial-plot_num_b) (data.Data.curr_fr_n_in_trial+plot_num_a)];
if curr_plot_range(1)< 1
    curr_plot_range(1) = 1;
end
if curr_plot_range(2) > data.Data.frame_n_trial
    curr_plot_range(2) =  data.Data.frame_n_trial;
end
% update im
set(data.Data.plot_h.im,'CData',curr_im_Front);
% update lines in im
for i_part = 1:length(data.Data.part2plot)
    set(data.Data.plot_h.im_line{i_part},...
        'XData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2)))+data.Data.Track.offset_x);
    set(data.Data.plot_h.im_line{i_part},...
        'YData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2)))+data.Data.Track.offset_y);
    
    set(data.Data.plot_h.im_range{i_part},...
        'XData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs(curr_plot_range(1)))+data.Data.Track.offset_x);
    set(data.Data.plot_h.im_range{i_part},...
        'YData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs(curr_plot_range(1)))+data.Data.Track.offset_y);
    
    set(data.Data.plot_h.im_curr{i_part},...
        'XData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr)+data.Data.Track.offset_x);
    set(data.Data.plot_h.im_curr{i_part},...
        'YData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr)+data.Data.Track.offset_y);
    
end

% 1-D
for i_part = 1:length(data.Data.part2plot)
    % title
    if isfield(data.Data, 'title_h')
        set(data.Data.title_h{i_part} , 'String', data.Data.body_parts{data.Data.part2plot(i_part)});
    end
    %X
    set(data.Data.plot_h.Ori_line.x{i_part},'YData',data.Data.Track.Ori.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs)'+data.Data.Track.offset_x);
    set(data.Data.plot_h.Correct_dot.x{i_part},'YData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs)'+data.Data.Track.offset_x);
    
    temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.idx_current_trial_frs) < data.Data.prob_thred);
    if isempty(temp_idx)
        set(data.Data.plot_h.X_prob{i_part},'XData',[]);
        set(data.Data.plot_h.X_prob{i_part},'YData',[]);
    else
        set(data.Data.plot_h.X_prob{i_part},'XData',temp_idx); % data.Data.plot_h.X_Front_prob.XData = [];
        set(data.Data.plot_h.X_prob{i_part},'YData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs(temp_idx))+data.Data.Track.offset_x); %data.Data.plot_h.X_Front_prob.YData = [];
    end
    
    set(data.Data.plot_h.X_curr_circle{i_part},'XData', data.Data.curr_fr_n_in_trial);
    set(data.Data.plot_h.X_curr_circle{i_part},'YData', data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr)+data.Data.Track.offset_x);
    
    % Y
    set(data.Data.plot_h.Ori_line.y{i_part},'YData',data.Data.Track.Ori.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs)'+data.Data.Track.offset_y);
    set(data.Data.plot_h.Correct_dot.y{i_part},'YData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs)'+data.Data.Track.offset_y);
    
    temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.idx_current_trial_frs) < data.Data.prob_thred);
    if isempty(temp_idx)
        set(data.Data.plot_h.Y_prob{i_part},'XData',[]);
        set(data.Data.plot_h.Y_prob{i_part},'YData',[]);
    else
        set(data.Data.plot_h.Y_prob{i_part},'XData',temp_idx); % data.Data.plot_h.X_Front_prob.XData = [];
        set(data.Data.plot_h.Y_prob{i_part},'YData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs(temp_idx))+data.Data.Track.offset_y); %data.Data.plot_h.X_Front_prob.YData = [];
    end
    
    set(data.Data.plot_h.Y_curr_circle{i_part},'XData', data.Data.curr_fr_n_in_trial);
    set(data.Data.plot_h.Y_curr_circle{i_part},'YData', data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr)+data.Data.Track.offset_y);
    
end

guidata(hObject,data)
%% update other data
set(handles.CurrFrameNum,'String', data.Data.curr_fr);
% update Object Panel for the current frame coordinate data
for i_part = 1:length(data.Data.part2plot)
    switch i_part
        case 1
            set(handles.Position_body1,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
            set(handles.Position_body1,'BackgroundColor',data.Data.part_color(1,:));
            set(handles.Position_body1,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
            set(handles.YCoor_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
            set(handles.ProbValue_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
        case 2
            set(handles.Position_body2,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
            set(handles.Position_body2,'BackgroundColor',data.Data.part_color(2,:));
            set(handles.Position_body2,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
            set(handles.Ycoor_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
            set(handles.ProbValue_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
            
        case 3
            set(handles.Position_body3,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
            set(handles.Position_body3,'BackgroundColor',data.Data.part_color(3,:));
            set(handles.Position_body3,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
            set(handles.Ycoor_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
            set(handles.ProbValue_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
            
    end
end

%% check bad trial status
if ismember( data.Data.curr_fr_trial, data.Data.Track.idx_bad_trial)
    warning('Current Trial is bad trial!!!!')
    set(data.Data.fig_im_h,'color','r');
else
    set(data.Data.fig_im_h,'color','w');
end
%% if epoch figure, update
if isfield(data.Data, 'figure_epoch') && ishandle(data.Data.figure_epoch)
    figure(data.Data.figure_epoch);
    xlim(data.Data.Epoch_unite(data.Data.n_epoch_curr,:)+[-20 20]);
end
%% go back to main figure
figure(data.figure1); % GUI figure



% --- Executes on button press in BadTrial.
function BadTrial_Callback(hObject, eventdata, handles)
% hObject    handle to BadTrial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);
% remove if is already a bad trial
if ismember(data.Data.curr_fr_trial, data.Data.Track.idx_bad_trial)
    disp('REMOVED from bad trials');
    data.Data.Track.idx_bad_trial(data.Data.Track.idx_bad_trial == data.Data.curr_fr_trial) = [];
else
    if isempty(data.Data.Track.idx_bad_trial)
        data.Data.Track.idx_bad_trial = data.Data.curr_fr_trial;
    else
        data.Data.Track.idx_bad_trial = cat(1, data.Data.Track.idx_bad_trial, data.Data.curr_fr_trial);
    end
    disp('Labeled as bad trial');
    
end
guidata(hObject,data);
plot_current_frame (hObject, eventdata, handles)


% --- Executes on button press in pushbutton7. % this is
% LabelToAddToNextDLC
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);
data.Data.Track.fr_idx_add2deeplab = cat(1, data.Data.Track.fr_idx_add2deeplab,...
    data.Data.curr_fr);
data.Data.Track.fr_idx_add2deeplab = unique(data.Data.Track.fr_idx_add2deeplab);
disp('Labeled as frame to add to deeplab');

% extract the frame save as PNG for later deeplab process
% do this step after figuring out how deeplab process those data, the .h5
% data is just first made ?
guidata(hObject,data);
figure(data.figure1);


% --- Executes on button press in NaNSection.
function NaNSection_Callback(hObject, eventdata, handles)
% hObject    handle to NaNSection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);
% bring up the figure
figure(data.Data.fig_coor_h);
% get current selected part
disp(['For ', data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}])
disp('Select start and end of section to NaN, press ENTER after each point');
disp('Start')
[temp_pt_s,~] = getpts(data.Data.coor_axes_h.x{data.Data.correction_ind_in_part2plot});
temp_pt_s = round(temp_pt_s);
disp('End')
[temp_pt_e,~] = getpts(data.Data.coor_axes_h.x{data.Data.correction_ind_in_part2plot});
temp_pt_e = round(temp_pt_e);

if temp_pt_s < 1
    temp_pt_s = 1;
end
if temp_pt_e > data.Data.frame_n_trial
    temp_pt_s = data.Data.frame_n_trial;
end

data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs(temp_pt_s:temp_pt_e)) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs(temp_pt_s:temp_pt_e)) = NaN;
guidata(hObject,data);
plot_current_frame (hObject, eventdata, handles)
figure(data.Data.fig_im_h);
figure(data.Data.fig_coor_h);
figure(data.figure1);

% --- Executes on button press in NaNCurrFrame.
function NaNCurrFrame_Callback(hObject, eventdata, handles)
% hObject    handle to NaNCurrFrame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);
disp(['NaN current frame for ', data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}])

data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.curr_fr) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.curr_fr) = NaN;
guidata(hObject,data);
plot_current_frame (hObject, eventdata, handles)
figure(data.Data.fig_im_h);
figure(data.Data.fig_coor_h);
figure(data.figure1);
% Save_result_Callback(hObject, eventdata, handles);

% --- Executes on button press in SetBoundCurrDisplay.
function SetBoundCurrDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to SetBoundCurrDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);
% generate a new figure using curr frame, plot the dots for current
% correction selected parts in the current trial
temp_fig_h = figure;
%
% data.Data.N_bodypart = length(data.Data.body_parts);
% % showing all parts is too busy, just show the X Y of one selected part
% % i_part = 1; % selection, or default 1
% if data.Data.N_bodypart >= 3
% data.Data.part2plot = [1 2 3];
% data.Data.part_color = [1 0 0; 0 0 1; 0 1 0];
% elseif data.Data.N_bodypart >= 2
%     data.Data.part2plot = [1 2];
%     data.Data.part_color = [1 0 0; 0 0 1];
% elseif data.Data.N_bodypart == 1
%     data.Data.part2plot = [1];
%     data.Data.part_color = [1 0 0];
% else
%     error('body parts not available')
% end

curr_im_Front = rgb2gray( read(data.Data.Movie_Obj,data.Data.curr_fr));

% data.Data.im_plot_axis_x = 1:size(temp,2);
% data.Data.im_plot_axis_y = 1:size(temp,1);
%
% data.Data.fig_im_h = figure;
% cla;
imagesc(data.Data.im_plot_axis_x, data.Data.im_plot_axis_y, curr_im_Front);%, 'Parent', data.axes_im_Front);
pbaspect([data.Data.im_plot_axis_x(end)/data.Data.im_plot_axis_y(end) 1 1]);
colormap(gray)
hold on;
xlim([data.Data.im_plot_axis_x(1) data.Data.im_plot_axis_x(end)]);
ylim([data.Data.im_plot_axis_y(1) data.Data.im_plot_axis_y(end)]);


i_part =  get(data.CorrectionList, 'Value');

plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs) +data.Data.Track.offset_x, ...
    data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs) +data.Data.Track.offset_y, 'g.-');


disp(['Curr Display set the bound for ', data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}])
disp('Click 2 points start and end in X, press ENTER after each point');
disp('Start')
% figure(data.Data.fig_im_h);
[temp_pt_s,~] = getpts(gcf);
temp_pt_s = round(temp_pt_s);
disp('End')
[temp_pt_e,~] = getpts(gcf);
temp_pt_e = round(temp_pt_e);
temp_bound_x = [min([temp_pt_s temp_pt_e]) max([temp_pt_s temp_pt_e])];

disp('Click 2 points start and end in Y, press ENTER after each point');
disp('Start')
[~, temp_pt_s] = getpts(gcf);
temp_pt_s = round(temp_pt_s);
disp('End')
[~, temp_pt_e] = getpts(gcf);
temp_pt_e = round(temp_pt_e);
temp_bound_y = [min([temp_pt_s temp_pt_e]) max([temp_pt_s temp_pt_e])];

disp('Set bound for current trial')
% data.Data.idx_current_trial_frs
temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs) +data.Data.Track.offset_x > temp_bound_x(2) ...
    | data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs) +data.Data.Track.offset_x < temp_bound_x(1));
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs(temp_idx)) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs(temp_idx)) = NaN;
temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs) +data.Data.Track.offset_y> temp_bound_y(2) ...
    | data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs) +data.Data.Track.offset_y< temp_bound_y(1));
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs(temp_idx)) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs(temp_idx)) = NaN;

close(temp_fig_h);
% update result
guidata(hObject,data);
plot_current_frame (hObject, eventdata, handles)

% --- Executes on button press in SetBoundWholeSes.
function SetBoundWholeSes_Callback(hObject, eventdata, handles)
% hObject    handle to SetBoundWholeSes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);

% generate a new figure using curr frame, plot the dots for current
% correction selected parts in the current trial
temp_fig_h = figure;

curr_im_Front = rgb2gray( read(data.Data.Movie_Obj,data.Data.curr_fr));

imagesc(data.Data.im_plot_axis_x, data.Data.im_plot_axis_y, curr_im_Front);%, 'Parent', data.axes_im_Front);
pbaspect([data.Data.im_plot_axis_x(end)/data.Data.im_plot_axis_y(end) 1 1]);
colormap(gray)
hold on;
xlim([data.Data.im_plot_axis_x(1) data.Data.im_plot_axis_x(end)]);
ylim([data.Data.im_plot_axis_y(1) data.Data.im_plot_axis_y(end)]);


i_part =  get(data.CorrectionList, 'Value');

plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(:)+data.Data.Track.offset_x, ...
    data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(:) +data.Data.Track.offset_y, 'g.-');


disp(['Whole session: set the bound for ', data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}])
disp('Click 2 points start and end in X, press ENTER after each point');
disp('Start')
% figure(data.Data.fig_im_h);
[temp_pt_s,~] = getpts(gcf);
temp_pt_s = round(temp_pt_s);
disp('End')
[temp_pt_e,~] = getpts(gcf);
temp_pt_e = round(temp_pt_e);
temp_bound_x = [min([temp_pt_s temp_pt_e]) max([temp_pt_s temp_pt_e])];

disp('Click 2 points start and end in Y, press ENTER after each point');
disp('Start')
[~, temp_pt_s] = getpts(gcf);
temp_pt_s = round(temp_pt_s);
disp('End')
[~, temp_pt_e] = getpts(gcf);
temp_pt_e = round(temp_pt_e);
temp_bound_y = [min([temp_pt_s temp_pt_e]) max([temp_pt_s temp_pt_e])];

disp('Set bound for whole session')
temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x +data.Data.Track.offset_x > temp_bound_x(2) ...
    | data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x +data.Data.Track.offset_x < temp_bound_x(1));
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(temp_idx) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(temp_idx) = NaN;

temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y +data.Data.Track.offset_y > temp_bound_y(2) ...
    | data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y +data.Data.Track.offset_y < temp_bound_y(1));
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(temp_idx) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(temp_idx) = NaN;

close(temp_fig_h);
% update
guidata(hObject,data);
plot_current_frame (hObject, eventdata, handles)


% --- Executes on button press in FillNaNsCurrDisplay.
function FillNaNsCurrDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to FillNaNsCurrDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Fill NaNs for Curr Display')
data = guidata(hObject);

data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x (data.Data.idx_current_trial_frs) = ...
    inpaint_nans(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs),3);
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y (data.Data.idx_current_trial_frs) = ...
    inpaint_nans(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs),3);

guidata(hObject,data);
plot_current_frame (hObject, eventdata, handles)




% --- Executes on button press in CorrectLabel.
function CorrectLabel_Callback(hObject, eventdata, handles)
% hObject    handle to CorrectLabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);
figure(data.Data.fig_im_h);
%
disp('Click to get the correct postion, PRESS ENTER when done');
[xi,yi] = getpts(gcf);


data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x (data.Data.curr_fr) = ...
    xi - data.Data.Track.offset_x;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y (data.Data.curr_fr) = ...
    yi - data.Data.Track.offset_y;


guidata(hObject,data)
plot_current_frame (hObject, eventdata, handles)
% tic
% Save_Callback(hObject, eventdata, handles);
figure(data.figure1); % return to the panel

% toc


% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% tic
disp('Saving ...')
data = guidata(hObject);

temp_save = data.Data.Track;
if ~isfield(data.Data,'save_fn')
    if ~isfield(data.Data, 'csv_fn')
        [csv_fn,~ ]= uigetfile([data.Data.movie_path, data.Data.movie_fn(1:end-4) '*.csv']);
        data.Data.csv_fn = fullfile(data.Data.movie_path, csv_fn);
    end
    if isempty(data.Data.csv_fn)
        [csv_fn,~ ]= uigetfile([data.Data.movie_path, data.Data.movie_fn(1:end-4) '*.csv']);
        data.Data.csv_fn = fullfile(data.Data.movie_path, csv_fn);
    end
    temp_idx = strfind(data.Data.csv_fn,'_');
    %HL110_200127_SNc_onset0DeepCut_resnet50_ReachPlusOneViewSeparatet1.0Apr11shuffle1_850000_cmb
    % for combined csv file there is one more '_'
    % change to use resnet to find the right part
    if any(strfind(data.Data.csv_fn,'_cmb.csv'))
        temp_idx(end) = [];
    end
    % HL changed 2020-5-14
    % better to change useing regexp in the future
    
    % check if SLEAP, temp fix
        if any(strfind(data.Data.csv_fn,'.h5'))
data.Data.save_fn =...
        fullfile(data.Data.movie_path,...
        [data.Data.movie_fn(1:end-4), ...
        '_SLEAP',...
        '.mat']);
        else
    data.Data.save_fn =...
        fullfile(data.Data.movie_path,...
        [data.Data.movie_fn(1:end-4), ...
        data.Data.csv_fn(temp_idx(end-2):end-4),...
        '.mat']);
        end
    % when training, make different stop point
end
temp_save.csv_fn = data.Data.csv_fn;
temp_save.movie_fn = data.Data.movie_fn;
temp_save.curr_trial = data.Data.curr_fr_trial;
save(data.Data.save_fn,'-struct','temp_save');

guidata(hObject,data)

disp('SAVED!')
% toc

function CurrFrameNum_Callback(hObject, eventdata, handles)
% hObject    handle to CurrFrameNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CurrFrameNum as text
%        str2double(get(hObject,'String')) returns contents of CurrFrameNum as a double
data = guidata(hObject);

temp = str2double(get(hObject,'String'));
if temp > data.Data.N_fr_tol
    disp('Beyond the total frame number');
    set(hObject, 'String', num2str(data.Data.curr_fr));
else
    data.Data.curr_fr = temp;
    % update current trial and frame in current trial
    data.Data.curr_fr_trial = ceil(data.Data.curr_fr/data.Data.frame_n_trial);
    data.Data.idx_current_trial_frs = (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
    data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);
    
    guidata(hObject,data)
    % update curr trial nunmber
    plot_current_frame (hObject, eventdata, handles);
end

% --- Executes during object creation, after setting all properties.
function CurrFrameNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CurrFrameNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FrameNumPerTrial_Callback(hObject, eventdata, handles)
% hObject    handle to FrameNumPerTrial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FrameNumPerTrial as text
%        str2double(get(hObject,'String')) returns contents of FrameNumPerTrial as a double
data = guidata(hObject);

data.Data.frame_n_trial = str2double(get(hObject,'String'));
% update current trial and frame in current trial
data.Data.curr_fr_trial = ceil(data.Data.curr_fr/data.Data.frame_n_trial);
data.Data.idx_current_trial_frs = (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);
data.Data.n_trial = ceil(data.Data.N_fr_tol/data.Data.frame_n_trial);

% update curr trial nunmber, total trial number
set(data.CurrTrialNum, 'String', num2str(data.Data.curr_fr_trial))
set(data.NumofTrials, 'String', num2str(data.Data.n_trial))

if data.Data.trial_init_point > data.Data.frame_n_trial
    data.Data.trial_init_point = ceil(data.Data.frame_n_trial/2);
    set(data.InitiatePointFrNum, 'String', num2str(data.Data.trial_init_point))
end
guidata(hObject,data)
% for coordinate plot lim x axis
for ii = 1:length(data.Data.coor_axes_h.x)
    xlim(data.Data.coor_axes_h.x{ii}, [1 data.Data.frame_n_trial ]) ;
    xlim(data.Data.coor_axes_h.y{ii}, [1 data.Data.frame_n_trial ]) ;
end
plot_current_frame (hObject, eventdata, handles);


% --- Executes during object creation, after setting all properties.
function FrameNumPerTrial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FrameNumPerTrial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumofTrials_Callback(hObject, eventdata, handles)
% hObject    handle to NumofTrials (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumofTrials as text
%        str2double(get(hObject,'String')) returns contents of NumofTrials as a double


% --- Executes during object creation, after setting all properties.
function NumofTrials_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumofTrials (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CurrTrialNum_Callback(hObject, eventdata, handles)
% hObject    handle to CurrTrialNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CurrTrialNum as text
%        str2double(get(hObject,'String')) returns contents of CurrTrialNum as a double
data = guidata(hObject);

disp('Reading in curr trial movie')
data.Data.curr_fr_trial = str2double(get(hObject,'String'));
%reset current frame as the init frame of current trialdata.Data.idx_current_trial_frs
data.Data.idx_current_trial_frs = (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;

data.Data.curr_fr = data.Data.idx_current_trial_frs(data.Data.trial_init_point);
% data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);

set(handles.CurrFrameNum, 'String', num2str(data.Data.curr_fr));

guidata(hObject,data);

plot_current_frame (hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function CurrTrialNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CurrTrialNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function InitiatePointFrNum_Callback(hObject, eventdata, handles)
% hObject    handle to InitiatePointFrNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InitiatePointFrNum as text
%        str2double(get(hObject,'String')) returns contents of InitiatePointFrNum as a double

data = guidata(hObject);

data.Data.trial_init_point = str2double(get(hObject,'String'));

guidata(hObject,data);


% --- Executes during object creation, after setting all properties.
function InitiatePointFrNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InitiatePointFrNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PreviousTrial.
function PreviousTrial_Callback(hObject, eventdata, handles)
% hObject    handle to PreviousTrial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);

data.Data.curr_fr_trial = data.Data.curr_fr_trial-1;

if data.Data.curr_fr_trial < 1
    warning('First trial already!!!');
    data.Data.curr_fr_trial = 1;
else
    disp('Previous Trial')
    set(handles.CurrTrialNum, 'String', num2str(data.Data.curr_fr_trial));
    data.Data.idx_current_trial_frs = ...
        (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
    
    data.Data.curr_fr = data.Data.idx_current_trial_frs(data.Data.trial_init_point); % start of the trial
    
    set(handles.CurrFrameNum, 'String', num2str(data.Data.curr_fr));
    
    guidata(hObject,data);
    
    plot_current_frame (hObject, eventdata, handles)
end


% --- Executes on button press in NextTrial.
function NextTrial_Callback(hObject, eventdata, handles)
% hObject    handle to NextTrial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);

data.Data.curr_fr_trial = data.Data.curr_fr_trial+1;

if data.Data.curr_fr_trial > data.Data.n_trial
    warning('Last trial already!!!');
    data.Data.curr_fr_trial = data.Data.n_trial;
else
    disp('Next Trial')
    set(handles.CurrTrialNum, 'String', num2str(data.Data.curr_fr_trial));
    data.Data.idx_current_trial_frs = ...
        (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
    
    data.Data.curr_fr = data.Data.idx_current_trial_frs(data.Data.trial_init_point); % start of the trial
    
    set(handles.CurrFrameNum, 'String', num2str(data.Data.curr_fr));
    
    guidata(hObject,data);
    
    plot_current_frame (hObject, eventdata, handles)
end

% --- Executes on button press in GoToFr.
function GoToFr_Callback(hObject, eventdata, handles)
% hObject    handle to GoToFr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);

figure(data.Data.fig_coor_h);
disp('Click to get the postion in X coordinate plot, PRESS ENTER when done');
[xi,yi] = getpts(gcf);

if (round(xi)+ (data.Data.curr_fr_trial-1)*data.Data.frame_n_trial)> data.Data.N_fr_tol
    disp('Beyond the total frame number');
else
    data.Data.curr_fr_n_in_trial= round(xi);
    data.Data.curr_fr = data.Data.curr_fr_n_in_trial + (data.Data.curr_fr_trial-1)*data.Data.frame_n_trial;
    
    guidata(hObject,data)
    plot_current_frame (hObject, eventdata, handles)
    figure(data.figure1); % return to the panel
end




function Xcoor_body1_Callback(hObject, eventdata, handles)
% hObject    handle to Xcoor_body1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Xcoor_body1 as text
%        str2double(get(hObject,'String')) returns contents of Xcoor_body1 as a double


% --- Executes during object creation, after setting all properties.
function Xcoor_body1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xcoor_body1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function YCoor_body1_Callback(hObject, eventdata, handles)
% hObject    handle to YCoor_body1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YCoor_body1 as text
%        str2double(get(hObject,'String')) returns contents of YCoor_body1 as a double


% --- Executes during object creation, after setting all properties.
function YCoor_body1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YCoor_body1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ProbValue_body1_Callback(hObject, eventdata, handles)
% hObject    handle to ProbValue_body1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ProbValue_body1 as text
%        str2double(get(hObject,'String')) returns contents of ProbValue_body1 as a double


% --- Executes during object creation, after setting all properties.
function ProbValue_body1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ProbValue_body1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in KeyBoardShortCut.
function KeyBoardShortCut_Callback(hObject, eventdata, handles)
% hObject    handle to KeyBoardShortCut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = msgbox({...
    'Availabel KS:';
    'd-     next frame';
    'a-     previous frame';
    'space- jump to next 10 frame';
    'b-     jump to next 200 frame';
    'e-     goto mouse selection frame';
    'f-     next trial';
    'v-     previous trial';
    's-     save';
    'n-     NaN current frame';
    'm-     NaN a selected section';
    'x-     Fill NaNs of Curr Display';
    'c-     correct label for curr frame';
    't-     set bound for curr. display';
    'y-     set bound for the whole session';
    'g-     next epoch';
    'z-     previous epoch'},...
    'Key Board Short Cuts');
disp(['d-next frame, a-previous frame, space-jump 10 frames, b- jump 200 frames, e- goto mouse selection frame, ' ...
    'f-next trial, v-previous trial, s- save, n- NaN current frame, m- NaN a selected section, x- Fill NaNs of Curr Display'...
    'c-correct label for curr frame, t-set bound for curr. display, y-set bound for the whole session' ...
    'g-next epoch, z-previous epoch'])


function Xcoor_body2_Callback(hObject, eventdata, handles)
% hObject    handle to Xcoor_body2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Xcoor_body2 as text
%        str2double(get(hObject,'String')) returns contents of Xcoor_body2 as a double


% --- Executes during object creation, after setting all properties.
function Xcoor_body2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xcoor_body2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ycoor_body2_Callback(hObject, eventdata, handles)
% hObject    handle to Ycoor_body2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ycoor_body2 as text
%        str2double(get(hObject,'String')) returns contents of Ycoor_body2 as a double


% --- Executes during object creation, after setting all properties.
function Ycoor_body2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ycoor_body2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ProbValue_body2_Callback(hObject, eventdata, handles)
% hObject    handle to ProbValue_body2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ProbValue_body2 as text
%        str2double(get(hObject,'String')) returns contents of ProbValue_body2 as a double


% --- Executes during object creation, after setting all properties.
function ProbValue_body2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ProbValue_body2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Xcoor_body3_Callback(hObject, eventdata, handles)
% hObject    handle to Xcoor_body3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Xcoor_body3 as text
%        str2double(get(hObject,'String')) returns contents of Xcoor_body3 as a double


% --- Executes during object creation, after setting all properties.
function Xcoor_body3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xcoor_body3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ycoor_body3_Callback(hObject, eventdata, handles)
% hObject    handle to Ycoor_body3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ycoor_body3 as text
%        str2double(get(hObject,'String')) returns contents of Ycoor_body3 as a double


% --- Executes during object creation, after setting all properties.
function Ycoor_body3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ycoor_body3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ProbValue_body3_Callback(hObject, eventdata, handles)
% hObject    handle to ProbValue_body3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ProbValue_body3 as text
%        str2double(get(hObject,'String')) returns contents of ProbValue_body3 as a double


% --- Executes during object creation, after setting all properties.
function ProbValue_body3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ProbValue_body3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in CorrectionList.
function CorrectionList_Callback(hObject, eventdata, handles)
% hObject    handle to CorrectionList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CorrectionList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CorrectionList

data = guidata(hObject);

data.Data.correction_ind_in_part2plot = get(hObject,'Value');
set(hObject,'BackgroundColor',data.Data.part_color(data.Data.correction_ind_in_part2plot,:));

guidata(hObject,data) % plot_current_frame (hObject, eventdata, handles)
figure(data.figure1);

% --- Executes during object creation, after setting all properties.
function CorrectionList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CorrectionList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);

% eventdata; % Let's see the KeyPress event data
disp(eventdata.Key) % Let's display the key, for fun!
switch eventdata.Key
    case 'd' % next frame
        if data.Data.curr_fr+ 1 >= data.Data.N_fr_tol
            data.Data.curr_fr = data.Data.N_fr_tol;
            warning('END of Movie');
        elseif data.Data.curr_fr+ 1 >= data.Data.idx_current_trial_frs(end)
            warning('END of curr display, move to next trial/disp, please!!');
        else
            disp('Next Frame')
            data.Data.curr_fr = data.Data.curr_fr + 1;
            
            guidata(hObject,data);
            set(handles.CurrFrameNum,'String', data.Data.curr_fr);
            plot_current_frame (hObject, eventdata, handles);
        end
    case 'a' % previous frame
        if data.Data.curr_fr <=1
            warning('BEGINING of Movie');
        elseif data.Data.curr_fr <= data.Data.idx_current_trial_frs(1)
            warning('Beginning of curr display, move to previous trial/disp, please!!');
        else
            disp('Previous Frame')
            data.Data.curr_fr = data.Data.curr_fr - 1;
            guidata(hObject,data);
            set(handles.CurrFrameNum,'String', data.Data.curr_fr);
            plot_current_frame (hObject, eventdata, handles);
        end
        
    case 'space' % jump 10 frames
        if data.Data.curr_fr+ 10 >= data.Data.N_fr_tol
            data.Data.curr_fr = data.Data.N_fr_tol;
            warning('END of Movie');
        elseif data.Data.curr_fr+ 10 >= data.Data.idx_current_trial_frs(end)
            warning('END of curr display, move to next trial/disp, please!!');
        else
            disp('Jump 10 Frames Forward')
            data.Data.curr_fr = data.Data.curr_fr + 20;
            guidata(hObject,data);
            set(handles.CurrFrameNum,'String', data.Data.curr_fr);
            plot_current_frame (hObject, eventdata, handles);
        end
    case 'b' % jump 200 frames
        if data.Data.curr_fr+ 200 >= data.Data.N_fr_tol
            data.Data.curr_fr = data.Data.N_fr_tol;
            warning('END of Movie');
        elseif data.Data.curr_fr+ 200 >= data.Data.idx_current_trial_frs(end)
            warning('END of curr display, move to next trial/disp, please!!');
        else
            disp('Jump 200 Frames')
            data.Data.curr_fr = data.Data.curr_fr + 200;
            guidata(hObject,data);
            set(handles.CurrFrameNum,'String', data.Data.curr_fr);
            plot_current_frame (hObject, eventdata, handles);
        end
    case 'f' % go to next trial
        NextTrial_Callback(hObject, eventdata, handles);
    case 'g' % go to next epoch
        NexEpoch_Callback(hObject, eventdata, handles);
    case 'z' % go to previous epoch
        PreEpoch_Callback(hObject, eventdata, handles);
    case 'v' % go to next trial
        PreviousTrial_Callback(hObject, eventdata, handles);
    case 'e' % go to
        GoToFr_Callback(hObject, eventdata, handles);
    case 's' % help
        Save_Callback(hObject, eventdata, handles);
    case 'n' % nan current frame
        NaNCurrFrame_Callback(hObject, eventdata, handles);
    case 'm'
        NaNSection_Callback(hObject, eventdata, handles);
    case 't'
        SetBoundCurrDisplay_Callback(hObject, eventdata, handles);
    case 'y'
        SetBoundWholeSes_Callback(hObject, eventdata, handles);
    case 'x'
        FillNaNsCurrDisplay_Callback(hObject, eventdata, handles);
    case 'c'
        CorrectLabel_Callback(hObject, eventdata, handles);
    case '1'  % set correction list to the 1st in the list
        SetCorrectionList_Callback_1(hObject, eventdata, handles)
    case '2'
        SetCorrectionList_Callback_2(hObject, eventdata, handles);
    case '3'
        SetCorrectionList_Callback_3(hObject, eventdata, handles);
    case 'p'
        BadTrial_Callback(hObject, eventdata, handles)
    case 'h' % help
        disp('Availabel KeyboardShortCut');
        disp(['d-next frame, a-previous frame, space-jump 10 frames, b- jump 200 frames, e- goto mouse selection frame, ' ...
            'f-next trial, v-previous trial, s- save, n- NaN current frame, m- NaN a selected section, x- Fill NaNs of Curr Display'...
            'c-correct label for curr frame, t-set bound for curr. display, y-set bound for the whole session' ...
            'g-next epoch, z-previous epoch, p-label current trial as bad or reverse'])
    otherwise
        disp('Not a defined Keyboard Shortcut');
        disp(['d-next frame, a-previous frame, space-jump 10 frames, b- jump 200 frames, e- goto mouse selection frame, ' ...
            'f-next trial, v-previous trial, s- save, n- NaN current frame, m- NaN a selected section, x- Fill NaNs of Curr Display'...
            'c-correct label for curr frame, t-set bound for curr. display, y-set bound for the whole session'...
            'g-next epoch, z-previous epoch, p-label current trial as bad or reverse'])
        
end


%% reinitiated

function re_initiate_im_fig (hObject, eventdata, handles)

data = guidata(hObject);

data.Data.fig_im_h = figure;
cla;
temp = rgb2gray( read(data.Data.Movie_Obj,data.Data.curr_fr));
data.Data.plot_h.im = imagesc(data.Data.im_plot_axis_x, data.Data.im_plot_axis_y, temp);%, 'Parent', data.axes_im_Front);
pbaspect([data.Data.im_plot_axis_x(end)/data.Data.im_plot_axis_y(end) 1 1]);
colormap(gray)
hold on;
xlim([data.Data.im_plot_axis_x(1) data.Data.im_plot_axis_x(end)]);
ylim([data.Data.im_plot_axis_y(1) data.Data.im_plot_axis_y(end)]);

plot_num_b = 5; % to fetch in the future
plot_num_a = 20;
curr_plot_range = [(data.Data.curr_fr_n_in_trial-plot_num_b) (data.Data.curr_fr_n_in_trial+plot_num_a)];
if curr_plot_range(1)< 1
    curr_plot_range(1) = 1;
end
if curr_plot_range(2) > data.Data.frame_n_trial
    curr_plot_range(2) =  data.Data.frame_n_trial;
end

% fist make default (3) lines, then replace with current selected
if data.Data.N_bodypart >= 3
    data.Data.part2plot = [1 2 3];
    data.Data.part_color = [1 0 0; 0 0 1; 0 1 0];
elseif data.Data.N_bodypart >= 2
    data.Data.part2plot = [1 2];
    data.Data.part_color = [1 0 0; 0 0 1];
elseif data.Data.N_bodypart == 1
    data.Data.part2plot = [1];
    data.Data.part_color = [1 0 0];
else
    error('body parts not available')
end
for i_part = 1:length(data.Data.part2plot)
    data.Data.plot_h.im_line{i_part}  =  plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2))) +data.Data.Track.offset_x, ...
        data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2))) +data.Data.Track.offset_y, 'g.-');
    data.Data.plot_h.im_range{i_part} =  plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs(curr_plot_range(1))) +data.Data.Track.offset_x, ...
        data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs(curr_plot_range(1))) +data.Data.Track.offset_y, 'yx','MarkerFaceColor','y');
    data.Data.plot_h.im_curr{i_part}  =  plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr)+data.Data.Track.offset_x, ...
        data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr)+data.Data.Track.offset_y,...
        'o','MarkerFaceColor',data.Data.part_color(i_part,:),'MarkerEdgeColor',data.Data.part_color(i_part,:));
end

%  then replace with current selected
data.Data.part2plot = get(data.ObjectList,'Value');
for i_part = 1:length(data.Data.part2plot)
    set(data.Data.plot_h.im_line{i_part},...
        'XData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2)))+data.Data.Track.offset_x);
    set(data.Data.plot_h.im_line{i_part},...
        'YData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2)))+data.Data.Track.offset_y);
    
    set(data.Data.plot_h.im_range{i_part},...
        'XData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs(curr_plot_range(1)))+data.Data.Track.offset_x);
    set(data.Data.plot_h.im_range{i_part},...
        'YData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs(curr_plot_range(1)))+data.Data.Track.offset_y);
    
    set(data.Data.plot_h.im_curr{i_part},...
        'XData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr)+data.Data.Track.offset_x);
    set(data.Data.plot_h.im_curr{i_part},...
        'YData',data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr)+data.Data.Track.offset_y);
    
end



% update
guidata(hObject,data)


function re_initiate_coor_fig (hObject, eventdata, handles)

data = guidata(hObject);

% plot coordinate 1-D
% temp_n = get(data.ObjectList,'Max');
data.Data.fig_coor_h = figure;
% re initaite plots
if data.Data.N_bodypart >= 3
    data.Data.part2plot = [1 2 3];
    data.Data.part_color = [1 0 0; 0 0 1; 0 1 0];
elseif data.Data.N_bodypart >= 2
    data.Data.part2plot = [1 2];
    data.Data.part_color = [1 0 0; 0 0 1];
elseif data.Data.N_bodypart == 1
    data.Data.part2plot = [1];
    data.Data.part_color = [1 0 0];
else
    error('body parts not available')
end

for i_part = 1:length(data.Data.part2plot)
    data.Data.coor_axes_h.x{i_part}  = subplot(length(data.Data.part2plot)*2,1,i_part*2-1); cla; hold on;
    data.Data.plot_h.Ori_line.x{i_part}  = ...
        plot(data.Data.Track.Ori.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs)+data.Data.Track.offset_x(1), 'b'); % original label result plot first layer
    data.Data.plot_h.Correct_dot.x{i_part}   = ...
        plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs)+data.Data.Track.offset_x(1), 'k.');
    
    temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.idx_current_trial_frs) < data.Data.prob_thred);
    if isempty(temp_idx)
        data.Data.plot_h.X_prob{i_part} = plot(data.Data.curr_fr_n_in_trial, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr)+data.Data.Track.offset_x, 'ks');
    else
        data.Data.plot_h.X_prob{i_part} = plot(temp_idx, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs(temp_idx))+data.Data.Track.offset_x, 'ks');
    end
    data.Data.plot_h.X_curr_circle{i_part}  = plot(data.Data.curr_fr_n_in_trial, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr)+data.Data.Track.offset_x, 'ro');
    data.Data.title_h{i_part} = title(data.Data.body_parts{data.Data.part2plot(i_part)});
    ylabel('X');
    % Y
    data.Data.coor_axes_h.y{i_part}  = subplot(length(data.Data.part2plot)*2,1,i_part*2); cla; hold on;
    data.Data.plot_h.Ori_line.y{i_part}  = ...
        plot(data.Data.Track.Ori.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs)+data.Data.Track.offset_y, 'b'); % original label result plot first layer
    data.Data.plot_h.Correct_dot.y{i_part}   = ...
        plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs)+data.Data.Track.offset_y, 'k.');
    
    temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.idx_current_trial_frs) < data.Data.prob_thred);
    if isempty(temp_idx)
        data.Data.plot_h.Y_prob{i_part} = plot(data.Data.curr_fr_n_in_trial, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr)+data.Data.Track.offset_y, 'ks');
    else
        data.Data.plot_h.Y_prob{i_part} = plot(temp_idx, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs(temp_idx))+data.Data.Track.offset_y, 'ks');
    end
    data.Data.plot_h.Y_curr_circle{i_part}  = plot(data.Data.curr_fr_n_in_trial, data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr)+data.Data.Track.offset_y, 'ro');
    ylabel('Y');
end
xlabel('Frame # in current trial')

linkaxes([data.Data.coor_axes_h.x{:} data.Data.coor_axes_h.y{:}], 'x');

% fill in numbers
% refetch selected parts
data.Data.part2plot = get(data.ObjectList,'Value');
max_select = get(data.ObjectList,'Max');

% first reset selected panel data, then fill in new
for i_part = 1:max_select
    set(data.Data.title_h{i_part}, 'String', data.Data.body_parts{i_part});
    switch i_part
        case 1
            set(handles.Position_body1,'String',num2str(NaN));
            set(handles.Position_body1,'BackgroundColor',data.Data.part_color(1,:));
            set(handles.Position_body1,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body1,'String',num2str(NaN));
            set(handles.YCoor_body1,'String',num2str(NaN));
            set(handles.ProbValue_body1,'String',num2str(NaN));
        case 2
            set(handles.Position_body2,'String',num2str(NaN));
            set(handles.Position_body2,'BackgroundColor',data.Data.part_color(2,:));
            set(handles.Position_body2,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body2,'String',num2str(NaN));
            set(handles.Ycoor_body2,'String',num2str(NaN));
            set(handles.ProbValue_body2,'String',num2str(NaN));
            
        case 3
            set(handles.Position_body3,'String',num2str(NaN));
            set(handles.Position_body3,'BackgroundColor',data.Data.part_color(3,:));
            set(handles.Position_body3,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body3,'String',num2str(NaN));
            set(handles.Ycoor_body3,'String',num2str(NaN));
            set(handles.ProbValue_body3,'String',num2str(NaN));
            
    end
end
for i_part = 1:length(data.Data.part2plot)
    switch i_part
        case 1
            set(handles.Position_body1,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
            set(handles.Position_body1,'BackgroundColor',data.Data.part_color(1,:));
            set(handles.Position_body1,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
            set(handles.YCoor_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
            set(handles.ProbValue_body1,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
            
        case 2
            set(handles.Position_body2,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
            set(handles.Position_body2,'BackgroundColor',data.Data.part_color(2,:));
            set(handles.Position_body2,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
            set(handles.Ycoor_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
            set(handles.ProbValue_body2,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
            
        case 3
            set(handles.Position_body3,'String',data.Data.body_parts{data.Data.part2plot(i_part)});
            set(handles.Position_body3,'BackgroundColor',data.Data.part_color(3,:));
            set(handles.Position_body3,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.curr_fr) ));
            set(handles.Ycoor_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.curr_fr) ));
            set(handles.ProbValue_body3,'String',num2str(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).Likelihood(data.Data.curr_fr) ));
            
    end
    set(data.Data.title_h{i_part} , 'String', data.Data.body_parts{data.Data.part2plot(i_part)});
    
end


% also update the correction panel's list
set(handles.CorrectionList,'String',{data.Data.body_parts{data.Data.part2plot}});
data.Data.correction_ind_in_part2plot = 1;
set(handles.CorrectionList,'Value',data.Data.correction_ind_in_part2plot);
set(handles.CorrectionList,'BackgroundColor',data.Data.part_color(data.Data.correction_ind_in_part2plot,:));

% update
guidata(hObject,data)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
data = guidata(hObject);

% save the data ?
answer = questdlg('Would you like to save the data again before exit?', ...
    'Saving?', ...
    'Yes','No close anyway','Do not close! mistake','Yes');
switch  answer
    case 'Yes'
        Save_Callback(hObject, eventdata, handles);
    case 'No close anyway'
        disp('Not Saved, closing');
    case 'Do not close! mistake'
        disp('Returned');return;
    otherwise
        error('!')
end

if isfield(data, 'Data')
if isfield(data.Data, 'fig_im_h')
    if ishandle(data.Data.fig_im_h)
        close (data.Data.fig_im_h)
    end
end
if isfield(data.Data, 'fig_coor_h')
    if ishandle(data.Data.fig_coor_h)
        close (data.Data.fig_coor_h)
    end
end
end
delete(hObject);
% clear


function SetCorrectionList_Callback_1(hObject, eventdata, handles)
% hObject    handle to CorrectionList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CorrectionList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CorrectionList

data = guidata(hObject);

% data.Data.correction_ind_in_part2plot = get(hObject,'Value');
% data.Data.part2plot
% data.Data.correction_ind_in_part2plot
% set to 1st choice
data.Data.correction_ind_in_part2plot = 1;

%update
set(data.CorrectionList,'Value',data.Data.correction_ind_in_part2plot);
set(data.CorrectionList,'BackgroundColor',data.Data.part_color(data.Data.correction_ind_in_part2plot,:));

guidata(hObject,data) % plot_current_frame (hObject, eventdata, handles)
figure(data.figure1);

function SetCorrectionList_Callback_2(hObject, eventdata, handles)
% hObject    handle to CorrectionList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CorrectionList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CorrectionList

data = guidata(hObject);

if length(data.Data.part2plot) < 2
    disp('Selected Body Parts less < 2');
else
    
    data.Data.correction_ind_in_part2plot = 2;
    
    %update
    set(data.CorrectionList,'Value',data.Data.correction_ind_in_part2plot);
    set(data.CorrectionList,'BackgroundColor',data.Data.part_color(data.Data.correction_ind_in_part2plot,:));
    
    guidata(hObject,data) % plot_current_frame (hObject, eventdata, handles)
end
figure(data.figure1);

function SetCorrectionList_Callback_3(hObject, eventdata, handles)
% hObject    handle to CorrectionList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CorrectionList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CorrectionList

data = guidata(hObject);

if length(data.Data.part2plot) < 3
    disp('Selected Body Parts less < 3');
else
    data.Data.correction_ind_in_part2plot = 3;
    
    %update
    set(data.CorrectionList,'Value',data.Data.correction_ind_in_part2plot);
    set(data.CorrectionList,'BackgroundColor',data.Data.part_color(data.Data.correction_ind_in_part2plot,:));
    
    guidata(hObject,data) % plot_current_frame (hObject, eventdata, handles)
end
figure(data.figure1);


% --- Executes on button press in DelAreaCurrDisp.
function DelAreaCurrDisp_Callback(hObject, eventdata, handles)
% hObject    handle to DelAreaCurrDisp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);
% generate a new figure using curr frame, plot the dots for current
% correction selected parts in the current trial
temp_fig_h = figure;
%
curr_im_Front = rgb2gray( read(data.Data.Movie_Obj,data.Data.curr_fr));

imagesc(data.Data.im_plot_axis_x, data.Data.im_plot_axis_y, curr_im_Front);%, 'Parent', data.axes_im_Front);
pbaspect([data.Data.im_plot_axis_x(end)/data.Data.im_plot_axis_y(end) 1 1]);
colormap(gray)
hold on;
xlim([data.Data.im_plot_axis_x(1) data.Data.im_plot_axis_x(end)]);
ylim([data.Data.im_plot_axis_y(1) data.Data.im_plot_axis_y(end)]);


i_part =  get(data.CorrectionList, 'Value');

plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x(data.Data.idx_current_trial_frs) +data.Data.Track.offset_x, ...
    data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y(data.Data.idx_current_trial_frs) +data.Data.Track.offset_y, 'g.-');


disp(['Curr Display: Delete Points within a retangular area for ', data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}])
disp('Click 2 points start and end in X, press ENTER after each point');
disp('Start')
% figure(data.Data.fig_im_h);
[temp_pt_s,~] = getpts(gcf);
temp_pt_s = round(temp_pt_s);
disp('End')
[temp_pt_e,~] = getpts(gcf);
temp_pt_e = round(temp_pt_e);
temp_bound_x = [min([temp_pt_s temp_pt_e]) max([temp_pt_s temp_pt_e])];

disp('Click 2 points start and end in Y, press ENTER after each point');
disp('Start')
[~, temp_pt_s] = getpts(gcf);
temp_pt_s = round(temp_pt_s);
disp('End')
[~, temp_pt_e] = getpts(gcf);
temp_pt_e = round(temp_pt_e);
temp_bound_y = [min([temp_pt_s temp_pt_e]) max([temp_pt_s temp_pt_e])];

disp('Delete Points for current trial')
% data.Data.idx_current_trial_frs
temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs) +data.Data.Track.offset_x< temp_bound_x(2) ...
    & data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs) +data.Data.Track.offset_x> temp_bound_x(1) ...
    & data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs) +data.Data.Track.offset_y< temp_bound_y(2) ...
    & data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs) +data.Data.Track.offset_y> temp_bound_y(1));

data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs(temp_idx)) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs(temp_idx)) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs(temp_idx)) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs(temp_idx)) = NaN;

close(temp_fig_h);
% update result
guidata(hObject,data);
plot_current_frame (hObject, eventdata, handles)

% --- Executes on button press in DelAreaSession.
function DelAreaSession_Callback(hObject, eventdata, handles)
% hObject    handle to DelAreaSession (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);
% generate a new figure using curr frame, plot the dots for current
% correction selected parts in the current trial
temp_fig_h = figure;
%
% data.Data.N_bodypart = length(data.Data.body_parts);
% % showing all parts is too busy, just show the X Y of one selected part
% % i_part = 1; % selection, or default 1
% if data.Data.N_bodypart >= 3
% data.Data.part2plot = [1 2 3];
% data.Data.part_color = [1 0 0; 0 0 1; 0 1 0];
% elseif data.Data.N_bodypart >= 2
%     data.Data.part2plot = [1 2];
%     data.Data.part_color = [1 0 0; 0 0 1];
% elseif data.Data.N_bodypart == 1
%     data.Data.part2plot = [1];
%     data.Data.part_color = [1 0 0];
% else
%     error('body parts not available')
% end

curr_im_Front = rgb2gray( read(data.Data.Movie_Obj,data.Data.curr_fr));

% data.Data.im_plot_axis_x = 1:size(temp,2);
% data.Data.im_plot_axis_y = 1:size(temp,1);
%
% data.Data.fig_im_h = figure;
% cla;
imagesc(data.Data.im_plot_axis_x, data.Data.im_plot_axis_y, curr_im_Front);%, 'Parent', data.axes_im_Front);
pbaspect([data.Data.im_plot_axis_x(end)/data.Data.im_plot_axis_y(end) 1 1]);
colormap(gray)
hold on;
xlim([data.Data.im_plot_axis_x(1) data.Data.im_plot_axis_x(end)]);
ylim([data.Data.im_plot_axis_y(1) data.Data.im_plot_axis_y(end)]);


i_part =  get(data.CorrectionList, 'Value');

plot(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).x +data.Data.Track.offset_x, ...
    data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(i_part)}).y +data.Data.Track.offset_y, 'g.-');


disp(['Whole Session: Delete Points within a retangular area for ', data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}])
disp('Click 2 points start and end in X, press ENTER after each point');
disp('Start')
% figure(data.Data.fig_im_h);
[temp_pt_s,~] = getpts(gcf);
temp_pt_s = round(temp_pt_s);
disp('End')
[temp_pt_e,~] = getpts(gcf);
temp_pt_e = round(temp_pt_e);
temp_bound_x = [min([temp_pt_s temp_pt_e]) max([temp_pt_s temp_pt_e])];

disp('Click 2 points start and end in Y, press ENTER after each point');
disp('Start')
[~, temp_pt_s] = getpts(gcf);
temp_pt_s = round(temp_pt_s);
disp('End')
[~, temp_pt_e] = getpts(gcf);
temp_pt_e = round(temp_pt_e);
temp_bound_y = [min([temp_pt_s temp_pt_e]) max([temp_pt_s temp_pt_e])];

disp('Delete points for whole session')
% data.Data.idx_current_trial_frs
temp_idx = find(data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x +data.Data.Track.offset_x< temp_bound_x(2) ...
    & data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x +data.Data.Track.offset_x> temp_bound_x(1) ...
    & data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y +data.Data.Track.offset_y< temp_bound_y(2) ...
    & data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y +data.Data.Track.offset_y> temp_bound_y(1));
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(temp_idx) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(temp_idx) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(temp_idx) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(temp_idx) = NaN;

close(temp_fig_h);
% update result
guidata(hObject,data);
plot_current_frame (hObject, eventdata, handles)



function Offset_X_Callback(hObject, eventdata, handles)
% hObject    handle to Offset_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Offset_X as text
%        str2double(get(hObject,'String')) returns contents of Offset_X as a double
data = guidata(hObject);

data.Data.Track.offset_x = str2double(get(hObject,'String'));
% update current trial and frame in current trial

guidata(hObject,data)
plot_current_frame (hObject, eventdata, handles);



% --- Executes during object creation, after setting all properties.
function Offset_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Offset_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Offset_Y_Callback(hObject, eventdata, handles)
% hObject    handle to Offset_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Offset_Y as text
%        str2double(get(hObject,'String')) returns contents of Offset_Y as a double
data = guidata(hObject);

data.Data.Track.offset_y = str2double(get(hObject,'String'));
% update current trial and frame in current trial

guidata(hObject,data)
plot_current_frame (hObject, eventdata, handles);


% --- Executes during object creation, after setting all properties.
function Offset_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Offset_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in EpochFrame.
function EpochFrame_Callback(hObject, eventdata, handles)
% hObject    handle to EpochFrame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% open another panel to load the FrameIdx file from server
data = guidata(hObject);

% already loaded previously
if isfield (data.Data, 'EpochFrameIdx_fn')
    disp('EpochFrame Idx file loaded');
    tmp_input = input('Do you want reload the EpochFrameIdx file? Yes-1 No-0. Press ENTER');
else
    tmp_input = 1;
end

if tmp_input
    % get the file
    %parse movie name to get the FrameIndex file
    tokens = regexp(data.Data.movie_fn, ...
        '(?<animalname>\w\w\d\d\d)_(?<datename>\d\d\d\d\d\d)_(?<proc_name>\w+)*', 'names');% include all initials HLXXX GZXXX etc
    animalname = tokens.animalname;
    ses_date = tokens.datename;
    proc_name = tokens.proc_name;
    
    default_folders;
    try [data.Data.EpochFrameIdx_fn,data.Data.EpochFrameIdx_path] = uigetfile(fullfile(save_path, animalname, ses_date, '*.mat'),'Select EpochFrameIndex mat file');
    catch [data.Data.EpochFrameIdx_fn,data.Data.EpochFrameIdx_path] = uigetfile('*.mat','Select EpochFrameIndex mat file (on server Data_mat folder or in your local folder)');
        
    end
end
% set the name of static txt box FrameIdx Filename
set(handles.FrameIdx_filename,'String', fullfile(data.Data.EpochFrameIdx_path, data.Data.EpochFrameIdx_fn));

% epoch frame indx mat file
data.Data.EpochFrameIdx = load(fullfile(data.Data.EpochFrameIdx_path,data.Data.EpochFrameIdx_fn ));

% determine the file type and make the epoch sequence to go through
if isfield(data.Data.EpochFrameIdx, 'Epoch_FrameIdx_OppWin_ON') % OptoTim session
    data.Data.Epoch_unite = data.Data.EpochFrameIdx.Epoch_FrameIdx_OppWin_ON;
    data.Data.n_epoch = size(data.Data.Epoch_unite,1);
    
elseif isfield(data.Data.EpochFrameIdx, 'Epoch_FrameIdx_OptoTrig_ON') % OptoTim session
    data.Data.Epoch_unite = cat(1, data.Data.EpochFrameIdx.Epoch_FrameIdx_OptoTrig_ON, data.Data.EpochFrameIdx.Epoch_FrameIdx_ControlTrig_ON); %
    data.Data.n_epoch = size(data.Data.Epoch_unite,1);
    
else
    error('unknow EpochFrameIdx session type');
end

data.Data.n_epoch_curr = 1; % initiated

% set curr frame accordingly
fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.Data.n_epoch_curr,  data.Data.Epoch_unite(1,1), data.Data.Epoch_unite(1,2));
set(handles.CurrEpochFr_start,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,1)));
set(handles.CurrEpochFr_end,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,2)));

data.Data.curr_fr = data.Data.Epoch_unite(1,1);

set(handles.Curr_Epoch_Num, 'String', num2str(data.Data.n_epoch_curr));
set(handles.N_TotalEpoch, 'String', num2str(size(data.Data.Epoch_unite,1)));
set(handles.CurrFrameNum, 'String', num2str(data.Data.curr_fr));

% CurrFrameNum_Callback(hObject, eventdata, handles)
data.Data.curr_fr_trial = ceil(data.Data.curr_fr/data.Data.frame_n_trial);
data.Data.idx_current_trial_frs = (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);

% return data
guidata(hObject,data)
% update curr trial nunmber
plot_current_frame (hObject, eventdata, handles);


% --- Executes on button press in NaNCurrEpoch.
function NaNCurrEpoch_Callback(hObject, eventdata, handles)
% hObject    handle to NaNCurrEpoch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);
[NaN_start NaN_end ]= data.Data.Epoch_unite (data.Data.n_epoch_curr,:);
idx2NaN = NaN_start:NaN_end;
disp(['NaN epoch frames for ', data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}]);
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(idx2NaN) = NaN;
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(idx2NaN) = NaN;
guidata(hObject,data);

% return data
guidata(hObject,data)
% update curr trial nunmber
plot_current_frame (hObject, eventdata, handles);




function Curr_Epoch_Num_Callback(hObject, eventdata, handles)
% hObject    handle to Curr_Epoch_Num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Curr_Epoch_Num as text
%        str2double(get(hObject,'String')) returns contents of Curr_Epoch_Num as a double

data = guidata(hObject);

temp = str2double(get(hObject,'String'));
if temp > size(data.Data.Epoch_unite,1)
    disp('Beyond the total Epoch number');
    set(hObject, 'String', num2str(data.Data.n_epoch_curr));
    fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.Data.n_epoch_curr, ...
        data.Data.Epoch_unite(data.Data.n_epoch_curr,1), data.Data.Epoch_unite(data.Data.n_epoch_curr,2));
    set(handles.CurrEpochFr_start,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,1)));
    set(handles.CurrEpochFr_end,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,2)));
    
else
    data.Data.n_epoch_curr = temp;
    data.Data.curr_fr = data.Data.Epoch_unite(data.Data.n_epoch_curr,1);
    fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.Data.n_epoch_curr, ...
        data.Data.Epoch_unite(data.Data.n_epoch_curr,1), data.Data.Epoch_unite(data.Data.n_epoch_curr,2));
    set(handles.CurrEpochFr_start,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,1)));
    set(handles.CurrEpochFr_end,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,2)));
    
    % update current frame
    set(handles.CurrFrameNum, 'String', num2str(data.Data.curr_fr));
    
    % CurrFrameNum_Callback(hObject, eventdata, handles)
    data.Data.curr_fr_trial = ceil(data.Data.curr_fr/data.Data.frame_n_trial);
    data.Data.idx_current_trial_frs = (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
    data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);
    
    % return data
    guidata(hObject,data)
    % update curr trial nunmber
    plot_current_frame (hObject, eventdata, handles);
    
end


% --- Executes during object creation, after setting all properties.
function Curr_Epoch_Num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Curr_Epoch_Num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in NexEpoch.
function NexEpoch_Callback(hObject, eventdata, handles)
% hObject    handle to NexEpoch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);

data.Data.n_epoch_curr = data.Data.n_epoch_curr+1;

if data.Data.n_epoch_curr > size(data.Data.Epoch_unite,1)
    warning('Last Epoch already!!!');
    data.Data.n_epoch_curr = size(data.Data.Epoch_unite,1);
    fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.Data.n_epoch_curr, ...
        data.Data.Epoch_unite(data.Data.n_epoch_curr,1), data.Data.Epoch_unite(data.Data.n_epoch_curr,2));
    set(handles.CurrEpochFr_start,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,1)));
    set(handles.CurrEpochFr_end,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,2)));
    
else
    disp('Next Epoch')
    set(handles.Curr_Epoch_Num, 'String', num2str(data.Data.n_epoch_curr));
    data.Data.curr_fr = data.Data.Epoch_unite(data.Data.n_epoch_curr,1);
    fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.Data.n_epoch_curr, ...
        data.Data.Epoch_unite(data.Data.n_epoch_curr,1), data.Data.Epoch_unite(data.Data.n_epoch_curr,2));
    set(handles.CurrEpochFr_start,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,1)));
    set(handles.CurrEpochFr_end,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,2)));
    
    % first update global data?
    set(handles.CurrFrameNum, 'String', num2str(data.Data.curr_fr));
    % CurrFrameNum_Callback(hObject, eventdata, handles)
    data.Data.curr_fr_trial = ceil(data.Data.curr_fr/data.Data.frame_n_trial);
    data.Data.idx_current_trial_frs = (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
    data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);
    
    % return data
    guidata(hObject,data)
    % update curr trial nunmber
    plot_current_frame (hObject, eventdata, handles);
end


% --- Executes on button press in PreEpoch.
function PreEpoch_Callback(hObject, eventdata, handles)
% hObject    handle to PreEpoch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);

data.Data.n_epoch_curr = data.Data.n_epoch_curr-1;

if data.Data.n_epoch_curr < 1
    warning('First Epoch already!!!');
    data.Data.n_epoch_curr = 1;
    fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.Data.n_epoch_curr, ...
        data.Data.Epoch_unite(data.Data.n_epoch_curr,1), data.Data.Epoch_unite(data.Data.n_epoch_curr,2));
    set(handles.CurrEpochFr_start,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,1)));
    set(handles.CurrEpochFr_end,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,2)));
    
else
    disp('Previous Epoch')
    set(handles.Curr_Epoch_Num, 'String', num2str(data.Data.n_epoch_curr));
    data.Data.curr_fr = data.Data.Epoch_unite(data.Data.n_epoch_curr,1);
    fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.Data.n_epoch_curr, ...
        data.Data.Epoch_unite(data.Data.n_epoch_curr,1), data.Data.Epoch_unite(data.Data.n_epoch_curr,2));
    set(handles.CurrEpochFr_start,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,1)));
    set(handles.CurrEpochFr_end,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,2)));
    
    set(handles.CurrFrameNum, 'String', num2str(data.Data.curr_fr));
    
    % CurrFrameNum_Callback(hObject, eventdata, handles)
    data.Data.curr_fr_trial = ceil(data.Data.curr_fr/data.Data.frame_n_trial);
    data.Data.idx_current_trial_frs = (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
    data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);
    
    % return data
    guidata(hObject,data)
    % update curr trial nunmber
    plot_current_frame (hObject, eventdata, handles);
    
end


% --- Executes during object creation, after setting all properties.
function CurrEpochFr_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CurrEpochFr_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function CurrEpochFr_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CurrEpochFr_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in ResetSection.
function ResetSection_Callback(hObject, eventdata, handles)
% hObject    handle to ResetSection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Ask user to define start and end, then reset those tracked position to
% original DLC result
data = guidata(hObject);

% bring up the figure
figure(data.Data.fig_coor_h);
% get current selected part
disp(['For ', data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}])
disp('Select start and end of section to NaN, press ENTER after each point');
disp('Start')
[temp_pt_s,~] = getpts(data.Data.coor_axes_h.x{data.Data.correction_ind_in_part2plot});
temp_pt_s = round(temp_pt_s);
disp('End')
[temp_pt_e,~] = getpts(data.Data.coor_axes_h.x{data.Data.correction_ind_in_part2plot});
temp_pt_e = round(temp_pt_e);

if temp_pt_s < 1
    temp_pt_s = 1;
end
if temp_pt_e > data.Data.frame_n_trial
    temp_pt_s = data.Data.frame_n_trial;
end

data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs(temp_pt_s:temp_pt_e)) = ...
    data.Data.Track.Ori.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x(data.Data.idx_current_trial_frs(temp_pt_s:temp_pt_e));
data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs(temp_pt_s:temp_pt_e)) = ...
    data.Data.Track.Ori.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y(data.Data.idx_current_trial_frs(temp_pt_s:temp_pt_e));
% update data
guidata(hObject,data)

plot_current_frame (hObject, eventdata, handles)
figure(data.figure1); % return to the panel

% --- Executes on button press in OF_autoEpoch_headbar.
function OF_autoEpoch_headbar_Callback(hObject, eventdata, handles)
% hObject    handle to OF_autoEpoch_headbar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% use data in corrected tracking, to run auto correction, generate
% inspection epochs, load inot the EpochFrame module
data = guidata(hObject);
body_parts = fieldnames(data.Data.Track.Corrected);
% check body parts with model
if ~any(ismember(body_parts, 'snout')) || ...
        ~any(ismember(body_parts, 'leftear')) || ...
        ~any(ismember(body_parts, 'rightear')) || ...
        ~any(ismember(body_parts, 'tailbase')) || ...
        ~any(ismember(body_parts, 'neck')) || length(body_parts) ~= 5
    warning('DLC result does not match OpenField_maDLC-Gate-2021-02-13 model. REturned');
    return
end
disp('Use leftear - righear distance and angle with the snout and neck to generate potential bad tracking epochs')
disp('leftear should be on the left side of neck-snout vector');
disp('rightear should be on the left side of neck-snout vector');
disp('left-right distance should be a stable value');


% default parameters for autocorrection
prompt = {'angle neck2snout To neck2left min', ...
    'angle neck2snout To neck2left max', ...
    'angle neck2snout To neck2right min', ...
    'angle neck2snout To neck2right max', ...
    'times of STD as boundary for distance from left2right' ...
    };
dlg_title = 'AutoEpoch parameters';
num_lines = 1;
defaultans = {'0', '180', '180', '360', '4'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
%
bound.neck2snoutTneck2left = [str2double(answer{1}) str2double(answer{2})];
bound.neck2snoutTneck2right = [str2double(answer{3}) str2double(answer{4})];
paras_bound.l_left2right = str2double(answer{5});


%% do not use rlowes filter method
%{
    disp('rlowess filter method to get epochs ...')
    tmp_idx_toFill = [];
    for i_b = 1:length(body_parts)
        tmp_smo.x = smooth(data.Data.Track.Corrected.(body_parts{i_b}).x, n_smo, 'rlowess' ); % rlowess takes a while
        tmp_smo.y = smooth(data.Data.Track.Corrected.(body_parts{i_b}).y, n_smo, 'rlowess' ); % rlowess takes a while
        tmp_smo_Dist = ((data.Data.Track.Corrected.(body_parts{i_b}).x - tmp_smo.x) .^2 + ...
            (data.Data.Track.Corrected.(body_parts{i_b}).y - tmp_smo.y) .^2) .^0.5;
        
        noise_std = std(tmp_smo_Dist);
        dist_median = nanmedian(tmp_smo_Dist);
        tmp_idx_toFill = cat(1, tmp_idx_toFill, find(tmp_smo_Dist > (dist_median + 3 * noise_std)));

%         data.Data.Track.Corrected.(body_parts{i_b}).x(tmp_idx_toFill) = NaN;
%         data.Data.Track.Corrected.(body_parts{i_b}).y(tmp_idx_toFill) = NaN;
%         data.Data.Track.Corrected.(body_parts{i_b}).x = inpaint_nans(data.Data.Track.Corrected.(body_parts{i_b}).x,3);
%         data.Data.Track.Corrected.(body_parts{i_b}).y = inpaint_nans(data.Data.Track.Corrected.(body_parts{i_b}).y,3);
%
%         data.Data.Track.Corrected.(body_parts{i_b}).x = medfilt1(data.Data.Track.Corrected.(body_parts{i_b}).x,n_medfilt);
%         data.Data.Track.Corrected.(body_parts{i_b}).y = medfilt1(data.Data.Track.Corrected.(body_parts{i_b}).y,n_medfilt);
        
    end
%}
%% get the epoches for further manual inspection
disp('Use object vector angles to get epoches for inspection ...')
% angle
vector_neck2left = [data.Data.Track.Corrected.leftear.x - data.Data.Track.Corrected.neck.x ...
    data.Data.Track.Corrected.leftear.y - data.Data.Track.Corrected.neck.y];
vector_neck2right = [data.Data.Track.Corrected.rightear.x - data.Data.Track.Corrected.neck.x ...
    data.Data.Track.Corrected.rightear.y - data.Data.Track.Corrected.neck.y];
vector_neck2snout = [data.Data.Track.Corrected.snout.x - data.Data.Track.Corrected.neck.x ...
    data.Data.Track.Corrected.snout.y - data.Data.Track.Corrected.neck.y];
vector_left2right = [data.Data.Track.Corrected.rightear.x - data.Data.Track.Corrected.leftear.x ...
                        data.Data.Track.Corrected.rightear.y - data.Data.Track.Corrected.leftear.y];

for i_fr = 1:length(data.Data.Track.Corrected.neck.x)
    [angle.neck2snoutTneck2left(i_fr), l_neck2snout(i_fr), l_neck2left(i_fr)]= ...
        HL_OF_AngleOfTwoVectors(vector_neck2snout(i_fr,:), vector_neck2left(i_fr,:));
    [angle.neck2snoutTneck2right(i_fr), ~,                 l_neck2right(i_fr)]= ...
        HL_OF_AngleOfTwoVectors(vector_neck2snout(i_fr,:), vector_neck2right(i_fr,:));
%     [angle.neck2leftTneck2right(i_fr), ~, ~]= ...
%         HL_OF_AngleOfTwoVectors(vector_neck2left(i_fr,:), vector_neck2right(i_fr,:));
    
    l_left2right(i_fr) = sqrt(sum(arrayfun(@(x) x^2, vector_left2right(i_fr,:))) );
end
% convert to  0 - 360
angle_fn = fieldnames(angle);
for i_f = 1:length(angle_fn)
    angle.(angle_fn{i_f})(angle.(angle_fn{i_f})<0) = angle.(angle_fn{i_f})(angle.(angle_fn{i_f})<0) + 360;
end
% set boundary for detection error:
%{
    l_left2right: use median +/- 2 STD
    angle_neck2snoutTneck2left: median +/ 30
    angle_neck2snoutTneck2right: median +/ 30
    angle_neck2leftTneck2right: median +/ 60
    angle_neck2tailTneck2left: median +/ 80
    angle_neck2tailTneck2right: median +/ 80
    angle_neck2snoutTneck2tail: median +/ 80
%}
bound.l_left2right = [-1 1]*paras_bound.l_left2right*nanstd(l_left2right)+nanmedian(l_left2right);

%% get epochs need to check
tmp_idx = [];
for i_f = 1:length(angle_fn)
    tmp_idx = union(tmp_idx, ...
        find(angle.(angle_fn{i_f})>bound.(angle_fn{i_f})(2) |  angle.(angle_fn{i_f})<bound.(angle_fn{i_f})(1)) );
end
%% get the epoch start and end
if  isempty(tmp_idx )
    Frame_Epoch = [];
else
    tmp_idx_diff = [inf; diff(tmp_idx)];
    tmp_idx_gap = find(tmp_idx_diff>1);
    Frame_Epoch(:,1)= tmp_idx(tmp_idx_gap);
    Frame_Epoch(end,2)=tmp_idx(end);
    Frame_Epoch(1:end-1,2)=tmp_idx(tmp_idx_gap(2:end)-1);
end
%% plot the angle result and Epoches :: also keep this figure for fast check
data.Data.figure_epoch=figure;
a = [];

a(1) = subplot(4,2,1);
plot(l_left2right);
title('Left-Right distance');
hold on;
plot([1 length(l_left2right)], ones(1,2)*bound.l_left2right(1), 'r')
plot([1 length(l_left2right)], ones(1,2)*bound.l_left2right(2), 'r')
a(3) = subplot(4,2,3);
plot(l_neck2snout);
title('Neck2Snout distance');
a(5) = subplot(4,2,5);
plot(l_neck2left);
title('Neck2Left distance');
a(7) = subplot(4,2,7);
plot(l_neck2right);
title('Neck2Right distance');





a(2) = subplot(4,2,2);
plot(angle.neck2snoutTneck2left);
title('Angle neck2sount -> neck2left');
hold on;
plot([1 length(l_left2right)], ones(1,2)*bound.neck2snoutTneck2left(1), 'r')
plot([1 length(l_left2right)], ones(1,2)*bound.neck2snoutTneck2left(2), 'r')
a(4) = subplot(4,2,4);
plot(angle.neck2snoutTneck2right);
title('Angle neck2sount -> neck2right');
hold on;
plot([1 length(l_left2right)], ones(1,2)*bound.neck2snoutTneck2right(1), 'r')
plot([1 length(l_left2right)], ones(1,2)*bound.neck2snoutTneck2right(2), 'r')


linkaxes(a, 'x');
%% sign Epoch
% set the name of static txt box FrameIdx Filename
set(handles.FrameIdx_filename,'String', 'HeadBar Epochs');

% epoch frame indx mat file
data.Data.EpochFrameIdx = [];%load(fullfile(data.Data.EpochFrameIdx_path,data.Data.EpochFrameIdx_fn ));
data.Data.Epoch_unite = Frame_Epoch;
data.Data.n_epoch = size(data.Data.Epoch_unite,1);

data.Data.n_epoch_curr = 1; % initiated
% % zoom in around the 1st epoch -- updated in plot_curr_frame function
% figure(data.Data.figure_epoch);
% xlim(data.Data.Epoch_unite(1,:)+[-20 20]);
% set curr frame accordingly
fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.Data.n_epoch_curr,  data.Data.Epoch_unite(1,1), data.Data.Epoch_unite(1,2));
set(handles.CurrEpochFr_start,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,1)));
set(handles.CurrEpochFr_end,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,2)));

data.Data.curr_fr = data.Data.Epoch_unite(1,1);

set(handles.Curr_Epoch_Num, 'String', num2str(data.Data.n_epoch_curr));
set(handles.N_TotalEpoch, 'String', num2str(size(data.Data.Epoch_unite,1)));
set(handles.CurrFrameNum, 'String', num2str(data.Data.curr_fr));

% CurrFrameNum_Callback(hObject, eventdata, handles)
data.Data.curr_fr_trial = ceil(data.Data.curr_fr/data.Data.frame_n_trial);
data.Data.idx_current_trial_frs = (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);



%% update guidata/return revised data to GUI
guidata(hObject,data)

plot_current_frame (hObject, eventdata, handles)

% tic
% Save_Callback(hObject, eventdata, handles);
figure(data.figure1); % return to the panel


% --- Executes on button press in ResetAll.
function ResetAll_Callback(hObject, eventdata, handles)
% hObject    handle to ResetAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% reset all data to original DLC result for the selected object

data = guidata(hObject);

tmp = input('Are you sure to reset all corrected data points back to DLC original result?\nYes-1, No-0: ');
if tmp
    data.Data.Track.Corrected = data.Data.Track.Ori;
    % update data
    guidata(hObject,data)
    
end
plot_current_frame (hObject, eventdata, handles)
% tic
% Save_Callback(hObject, eventdata, handles);
figure(data.figure1); % return to the panel


% --- Executes on button press in AutoEpoch_Jump.
function AutoEpoch_Jump_Callback(hObject, eventdata, handles)
% hObject    handle to AutoEpoch_Jump (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);
tmp_obj = data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)};
disp(['Get JumpEpoch for ', data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}])

% get distance 
tmp.x = data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).x;
tmp.y = data.Data.Track.Corrected.(data.Data.body_parts{data.Data.part2plot(data.Data.correction_ind_in_part2plot)}).y;
tmp_diff.x = [NaN; diff(tmp.x )];
tmp_diff.y = [NaN; diff(tmp.y )];

tmp_d = (tmp_diff.x.^2 + tmp_diff.y.^2).^0.5;
figure; 
cdfplot(tmp_d);
title('CDF of the Distance')
% default parameters for autocorrection
prompt = {'Threshold for Jump detection'};
dlg_title = 'AutoEpoch parameters';
num_lines = 1;
defaultans = {'20'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
%
jump_thred = str2double(answer{1});

%%
tmp_idx = find(tmp_d>jump_thred);

%% get the epoch start and end
if  isempty(tmp_idx )
    Frame_Epoch = [];
else
    tmp_idx_diff = [inf; diff(tmp_idx)];
    tmp_idx_gap = find(tmp_idx_diff>1);
    Frame_Epoch(:,1)= tmp_idx(tmp_idx_gap);
    Frame_Epoch(end,2)=tmp_idx(end);
    Frame_Epoch(1:end-1,2)=tmp_idx(tmp_idx_gap(2:end)-1);
end
%% plot the angle result and Epoches :: also keep this figure for fast check
data.Data.figure_epoch=figure;
plot(tmp_d);
title(['Distance by frame: ' tmp_obj] );
hold on;
plot([1 length(tmp_d)], ones(1,2)*jump_thred, 'r')
   %% sign Epoch
% set the name of static txt box FrameIdx Filename
set(handles.FrameIdx_filename,'String', [tmp_obj ' Epochs']);

% epoch frame indx mat file
data.Data.EpochFrameIdx = [];%load(fullfile(data.Data.EpochFrameIdx_path,data.Data.EpochFrameIdx_fn ));
data.Data.Epoch_unite = Frame_Epoch;
data.Data.n_epoch = size(data.Data.Epoch_unite,1);

data.Data.n_epoch_curr = 1; % initiated
% % zoom in around the 1st epoch -- updated in plot_curr_frame function
% figure(data.Data.figure_epoch);
% xlim(data.Data.Epoch_unite(1,:)+[-20 20]);
% set curr frame accordingly
fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.Data.n_epoch_curr,  data.Data.Epoch_unite(1,1), data.Data.Epoch_unite(1,2));
set(handles.CurrEpochFr_start,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,1)));
set(handles.CurrEpochFr_end,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,2)));

data.Data.curr_fr = data.Data.Epoch_unite(1,1);

set(handles.Curr_Epoch_Num, 'String', num2str(data.Data.n_epoch_curr));
set(handles.N_TotalEpoch, 'String', num2str(size(data.Data.Epoch_unite,1)));
set(handles.CurrFrameNum, 'String', num2str(data.Data.curr_fr));

% CurrFrameNum_Callback(hObject, eventdata, handles)
data.Data.curr_fr_trial = ceil(data.Data.curr_fr/data.Data.frame_n_trial);
data.Data.idx_current_trial_frs = (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);



%% update guidata/return revised data to GUI
guidata(hObject,data)
plot_current_frame (hObject, eventdata, handles)

figure(data.figure1); % return to the panel

% --- Executes on button press in OF_autoEpoch_SnoutTail.
function OF_autoEpoch_SnoutTail_Callback(hObject, eventdata, handles)
% hObject    handle to OF_autoEpoch_SnoutTail (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);
body_parts = fieldnames(data.Data.Track.Corrected);
% check body parts with model
if ~any(ismember(body_parts, 'snout')) || ...
        ~any(ismember(body_parts, 'leftear')) || ...
        ~any(ismember(body_parts, 'rightear')) || ...
        ~any(ismember(body_parts, 'tailbase')) || ...
        ~any(ismember(body_parts, 'neck')) || length(body_parts) ~= 5
    warning('DLC result does not match OpenField_maDLC-Gate-2021-02-13 model. REturned');
    return
end
disp('Use snout-neck-tailbase distance and angle to generate potential bad tracking epochs')
disp('neck should be between snout and tailbase');


% default parameters for autocorrection
prompt = {'angle neck2snout To nect2tail min', ...
    'angle neck2snout To nect2tail max', ...
      };
dlg_title = 'AutoEpoch parameters';
num_lines = 1;
defaultans = {'80', '280'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
%
bound.neck2snoutTneck2tail = [str2double(answer{1}) str2double(answer{2})];

%% get the epoches for further manual inspection
disp('Use object vector angles to get epoches for inspection ...')
% angle
vector_neck2snout = [data.Data.Track.Corrected.snout.x - data.Data.Track.Corrected.neck.x ...
    data.Data.Track.Corrected.snout.y - data.Data.Track.Corrected.neck.y];
vector_neck2tail = [data.Data.Track.Corrected.tailbase.x - data.Data.Track.Corrected.neck.x ...
    data.Data.Track.Corrected.tailbase.y - data.Data.Track.Corrected.neck.y];

for i_fr = 1:length(data.Data.Track.Corrected.neck.x)
    [angle.neck2snoutTneck2tail(i_fr), ~, ~]= ...
        HL_OF_AngleOfTwoVectors(vector_neck2snout(i_fr,:), vector_neck2tail(i_fr,:));
end
% convert to  0 - 360
angle_fn = fieldnames(angle);
for i_f = 1:length(angle_fn)
    angle.(angle_fn{i_f})(angle.(angle_fn{i_f})<0) = angle.(angle_fn{i_f})(angle.(angle_fn{i_f})<0) + 360;
end
% set boundary for detection error:
%{
    l_left2right: use median +/- 2 STD
    angle_neck2snoutTneck2left: median +/ 30
    angle_neck2snoutTneck2right: median +/ 30
    angle_neck2leftTneck2right: median +/ 60
    angle_neck2tailTneck2left: median +/ 80
    angle_neck2tailTneck2right: median +/ 80
    angle_neck2snoutTneck2tail: median +/ 80
%}

%% get epochs need to check
tmp_idx = [];
for i_f = 1:length(angle_fn)
    tmp_idx = union(tmp_idx, ...
        find(angle.(angle_fn{i_f})>bound.(angle_fn{i_f})(2) |  angle.(angle_fn{i_f})<bound.(angle_fn{i_f})(1)) );
end
%% get the epoch start and end
if  isempty(tmp_idx )
    Frame_Epoch = [];
else
    tmp_idx_diff = [inf; diff(tmp_idx)];
    tmp_idx_gap = find(tmp_idx_diff>1);
    Frame_Epoch(:,1)= tmp_idx(tmp_idx_gap);
    Frame_Epoch(end,2)=tmp_idx(end);
    Frame_Epoch(1:end-1,2)=tmp_idx(tmp_idx_gap(2:end)-1);
end
%% plot the angle result and Epoches :: also keep this figure for fast check
data.Data.figure_epoch=figure;
plot(angle.neck2snoutTneck2tail);
title('Angle neck2snout -> neck2tail');
hold on;
plot([1 length(angle.neck2snoutTneck2tail)], ones(1,2)*bound.neck2snoutTneck2tail(1), 'r')
plot([1 length(angle.neck2snoutTneck2tail)], ones(1,2)*bound.neck2snoutTneck2tail(2), 'r')
   %% sign Epoch
% set the name of static txt box FrameIdx Filename
set(handles.FrameIdx_filename,'String', 'Snout-Neck-Tailbase Epochs');

% epoch frame indx mat file
data.Data.EpochFrameIdx = [];%load(fullfile(data.Data.EpochFrameIdx_path,data.Data.EpochFrameIdx_fn ));
data.Data.Epoch_unite = Frame_Epoch;
data.Data.n_epoch = size(data.Data.Epoch_unite,1);

data.Data.n_epoch_curr = 1; % initiated
% % zoom in around the 1st epoch -- updated in plot_curr_frame function
% figure(data.Data.figure_epoch);
% xlim(data.Data.Epoch_unite(1,:)+[-20 20]);
% set curr frame accordingly
fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.Data.n_epoch_curr,  data.Data.Epoch_unite(1,1), data.Data.Epoch_unite(1,2));
set(handles.CurrEpochFr_start,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,1)));
set(handles.CurrEpochFr_end,'String', num2str(data.Data.Epoch_unite(data.Data.n_epoch_curr,2)));

data.Data.curr_fr = data.Data.Epoch_unite(1,1);

set(handles.Curr_Epoch_Num, 'String', num2str(data.Data.n_epoch_curr));
set(handles.N_TotalEpoch, 'String', num2str(size(data.Data.Epoch_unite,1)));
set(handles.CurrFrameNum, 'String', num2str(data.Data.curr_fr));

% CurrFrameNum_Callback(hObject, eventdata, handles)
data.Data.curr_fr_trial = ceil(data.Data.curr_fr/data.Data.frame_n_trial);
data.Data.idx_current_trial_frs = (data.Data.curr_fr_trial - 1)*data.Data.frame_n_trial + [1:data.Data.frame_n_trial] ;
data.Data.curr_fr_n_in_trial = find( data.Data.idx_current_trial_frs == data.Data.curr_fr);



%% update guidata/return revised data to GUI
guidata(hObject,data)
plot_current_frame (hObject, eventdata, handles)

% tic
% Save_Callback(hObject, eventdata, handles);
figure(data.figure1); % return to the panel