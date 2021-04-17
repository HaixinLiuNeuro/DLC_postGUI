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

% Last Modified by GUIDE v2.5 03-Apr-2021 06:25:24

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

data.part2plot = get(hObject,'Value');
max_select = get(hObject,'Max');

if length(data.part2plot) > 3
    data.part2plot = data.part2plot(1:3);
    set(hObject,'Value',data.part2plot);
    figure(data.figure1);

else
% first reset selected panel data, then fill in new
for i_part = 1:max_select
    switch i_part
        case 1
            set(handles.Position_body1,'String',num2str(NaN));
            set(handles.Position_body1,'BackgroundColor',data.part_color(1,:));
            set(handles.Position_body1,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body1,'String',num2str(NaN));
            set(handles.YCoor_body1,'String',num2str(NaN));
            set(handles.ProbValue_body1,'String',num2str(NaN));
        case 2
            set(handles.Position_body2,'String',num2str(NaN));
            set(handles.Position_body2,'BackgroundColor',data.part_color(2,:));
            set(handles.Position_body2,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body2,'String',num2str(NaN));
            set(handles.Ycoor_body2,'String',num2str(NaN));
            set(handles.ProbValue_body2,'String',num2str(NaN));
            
        case 3
            set(handles.Position_body3,'String',num2str(NaN));
            set(handles.Position_body3,'BackgroundColor',data.part_color(3,:));
            set(handles.Position_body3,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body3,'String',num2str(NaN));
            set(handles.Ycoor_body3,'String',num2str(NaN));
            set(handles.ProbValue_body3,'String',num2str(NaN));            
    end
end
for i_part = 1:length(data.part2plot)
    switch i_part
        case 1
            set(handles.Position_body1,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body1,'BackgroundColor',data.part_color(1,:));
            set(handles.Position_body1,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.YCoor_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
        case 2
            set(handles.Position_body2,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body2,'BackgroundColor',data.part_color(2,:));
            set(handles.Position_body2,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.Ycoor_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
            
        case 3
            set(handles.Position_body3,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body3,'BackgroundColor',data.part_color(3,:));
            set(handles.Position_body3,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.Ycoor_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
            
    end
end


% also update the correction panel's list
set(handles.CorrectionList,'String',{data.body_parts{data.part2plot}});
data.correction_ind_in_part2plot = 1;
set(handles.CorrectionList,'Value',data.correction_ind_in_part2plot);
set(handles.CorrectionList,'BackgroundColor',data.part_color(data.correction_ind_in_part2plot,:));

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
warndlg('For a new session, you NEED to start the GUI again. Kill or PRESS ENTER to continue');
% need to refresh the data
disp('For a new session, you NEED to start the GUI again. Kill or PRESS ENTER to continue')
pause
data = guidata(hObject);
% temp = fieldnames(data,'-full');
% temp_logic = cellfun(@(x)isobject( data.(x)),temp);
% % for ii = 1:length(temp)
% %    disp([ temp{ii}, ' ', num2str(temp_logic(ii))]) 
% % end
% data = rmfield(data,temp(~temp_logic));
% disp(data)
[data.movie_fn,data.movie_path] = uigetfile('*.mp4*','Select Video');

% if processed already load mat file
matfile = dir([data.movie_path, data.movie_fn(1:(end-4)) '_*.mat']);
if length(matfile)>1 % different version of matlab files    
    [matfile_temp,~ ]= uigetfile([data.movie_path, data.movie_fn(1:end-4) '_*.mat'], ...
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
    temp = load(fullfile(data.movie_path,matfile.name));
    data.Track = temp;
    disp(['Last left at trial: ', num2str(data.Track.curr_trial)]);
    % take care of previous dataset, add ori field
    % load data properly
    if ~isfield(data.Track, 'Ori') % reload original data
        csv_fn = dir([data.movie_path, data.movie_fn(1:end-4) '*.csv']);
        
        if isempty(csv_fn)
            warning('No csv Front file found in movie folder, Select the CSV elsewhere');
            % just open GUI selection
            [csv_fn, csv_path ]= uigetfile([data.movie_path, '*.csv'], ['Select CSV file for: ' data.movie_fn(1:end-4)]);
            data.csv_fn = fullfile(csv_path, csv_fn);

        else
            % if multple files, ask to select
            if length(csv_fn)>1
                [csv_fn,~ ]= uigetfile([data.movie_path, data.movie_fn(1:end-4) '*.csv']);
                data.csv_fn = fullfile(data.movie_path, csv_fn);
            else
                data.csv_fn = fullfile(csv_fn.folder, csv_fn.name);
            end
        end
               % fetch all body parts
        fh = fopen(data.csv_fn);
        fgetl(fh); % skip the first line
        colnames = strsplit(fgetl(fh),','); %extract column names
        % check if this is old DLC result or new  maDLC result
        if strcmp(colnames{1},'individuals')
            disp('maDLC');
            colnames = strsplit(fgetl(fh),',');
            M = csvread(data.csv_fn, 4,0); % read in all the numbers
        else
            disp('single animal DLC');
            M = csvread(data.csv_fn, 3,0); % read in all the numbers
        end
        fclose(fh);
              
        data.Track.Ori_frame_ind = M(:,1)+1;
        for i_part = 1:(length(colnames)-1)/3 % skip the first column which is frame number
            %set ori
            data.Track.Ori.(colnames{3*(i_part-1)+1+1}).x = M(:,1+1+3*(i_part-1));
            data.Track.Ori.(colnames{3*(i_part-1)+1+1}).y = M(:,1+2+3*(i_part-1));
            data.Track.Ori.(colnames{3*(i_part-1)+1+1}).Likelihood = M(:,1+3+3*(i_part-1));
        end

        
    else
       csv_fn = NaN;
       data.csv_fn = data.Track.csv_fn; % display the loaded csv fn in 
    end
elseif ~isempty(dir([data.movie_path, data.movie_fn(1:end-4) '*.DLCcmb']))
    disp('New examining DLCcmb')
    %% combined DLC result file . DLCcmb
    csv_fn = dir([data.movie_path, data.movie_fn(1:end-4) '*.DLCcmb']);
    data.csv_fn = fullfile(csv_fn.folder, csv_fn.name);
    temp = load(data.csv_fn, '-MAT');
    data.Track = temp;
    
else
    %% regular csv result from DLC ouput
    disp('New examining DLC csv file')

    % get corresponding .csv file (DLC result)
    csv_fn = dir([data.movie_path, data.movie_fn(1:end-4) '*.csv']);
%     csv_fn_Side = dir([data.movie_path, data.movie_fn_Side(1:end-4) '*.csv']);
% HL 2021-4-14 add in .csvcmb file type, which is the combined DLC result
% in .mat format
    
    if isempty(csv_fn)
            warning('No csv Front file found in movie folder, Select the CSV elsewhere');
            % just open GUI selection
            [csv_fn, csv_path ]= uigetfile([data.movie_path, '*.csv'], ['Select CSV file for: ' data.movie_fn(1:end-4)]);
            data.csv_fn = fullfile(csv_path, csv_fn);

    else
        % if multple files, ask to select
        if length(csv_fn)>1
            [csv_fn,~ ]= uigetfile([data.movie_path, data.movie_fn(1:end-4) '*.csv'], ['Select CSV file for: ' data.movie_fn(1:end-4)]);
            data.csv_fn = fullfile(data.movie_path, csv_fn);
        else
            data.csv_fn = fullfile(csv_fn.folder, csv_fn.name);
        end
    end
        
        % fetch all body parts
        fh = fopen(data.csv_fn);
        fgetl(fh); % skip the first line
        colnames = strsplit(fgetl(fh),','); %extract column names
        % check if this is old DLC result or new  maDLC result
        if strcmp(colnames{1},'individuals')
            disp('maDLC');
            colnames = strsplit(fgetl(fh),',');
            M = csvread(data.csv_fn, 4,0); % read in all the numbers
        else
            disp('single animal DLC');
            M = csvread(data.csv_fn, 3,0); % read in all the numbers
        end
        fclose(fh);
                      
        data.Track.Corrected_frame_ind = M(:,1)+1; % the frame number starts from 0, due to python
        data.Track.Ori_frame_ind = data.Track.Corrected_frame_ind;
        for i_part = 1:(length(colnames)-1)/3 % skip the first column which is frame number
            data.Track.Corrected.(colnames{3*(i_part-1)+1+1}).x = M(:,1+1+3*(i_part-1));
            data.Track.Corrected.(colnames{3*(i_part-1)+1+1}).y = M(:,1+2+3*(i_part-1));
            data.Track.Corrected.(colnames{3*(i_part-1)+1+1}).Likelihood = M(:,1+3+3*(i_part-1));
            %set ori
            data.Track.Ori.(colnames{3*(i_part-1)+1+1}).x = M(:,1+1+3*(i_part-1));
            data.Track.Ori.(colnames{3*(i_part-1)+1+1}).y = M(:,1+2+3*(i_part-1));
            data.Track.Ori.(colnames{3*(i_part-1)+1+1}).Likelihood = M(:,1+3+3*(i_part-1));
        end
    
end

% add in variables needed
if ~isfield(data.Track, 'idx_bad_trial')
    data.Track.idx_bad_trial  = [];
end
if ~isfield(data.Track, 'fr_idx_add2deeplab')
    data.Track.fr_idx_add2deeplab  = [];
end



%get video 

data.Movie_Obj = VideoReader(fullfile(data.movie_path, data.movie_fn));

% set current frame number to 1
data.curr_fr = 1;
data.N_fr_tol = data.Movie_Obj.NumberOfFrames;


if isempty(csv_fn)
    erorr('No CSV file name found')
    % need to implement the way to just view movie not generating any plots
end

data.frame_n_trial = str2double(get(data.FrameNumPerTrial,'String')); %get default frame number per trial
data.n_trial = ceil(data.N_fr_tol/data.frame_n_trial); % skip the last several points not a complete trial
% warning('Currently skip the last data points NOT completing a trial')
data.curr_trial = 1;

guidata(hObject,data);

%% update text file
% Filename_Callback(data.Filename, eventdata, data)
set(handles.MovieFileName,'String', fullfile(data.movie_path, data.movie_fn));
if ischar(data.csv_fn)
    set(handles.CSVFileName,'String',  data.csv_fn);
else
    set(handles.CSVFileName,'String',  cat(2,data.csv_fn{:}));
end
% TotalFrame_Callback(handles.TotalFrame, eventdata, handles)
set(handles.TotalFrameNum,'String', num2str(data.N_fr_tol));
% CurrFrame_Callback(handles.CurrFrame, eventdata, handles)
set(handles.NumofTrials,'String', num2str(data.n_trial));
set(handles.CurrTrialNum,'String', num2str(data.curr_trial));

data.idx_current_trial_frs = (data.curr_trial - 1)*data.frame_n_trial + [1:data.frame_n_trial] ;
data.curr_fr_n_in_trial = find( data.idx_current_trial_frs == data.curr_fr);

% delete corner data points
data.body_parts = fieldnames(data.Track.Corrected);
for i_part = 1:length(data.body_parts)
    temp = find(data.Track.Corrected.(data.body_parts{i_part}).x<50 & ...
        data.Track.Corrected.(data.body_parts{i_part}).y<50);
    data.Track.Corrected.(data.body_parts{i_part}).x(temp) = NaN;
    data.Track.Corrected.(data.body_parts{i_part}).y(temp) = NaN;
end
%% prob threshold
data.prob_thred = 0.9; % need to fetch from GUI
%% Offset due to cropping
data.Track.offset_x = str2double(get(handles.Offset_X,'String'));
data.Track.offset_y = str2double(get(handles.Offset_Y,'String')); % need to fech from GUI, after adding those edit boxes
% data.trial_init_point = str2double(get(handles.InitiatePointFrNum,'String'));

%% initiate plots and body panel
data.N_bodypart = length(data.body_parts);
% showing all parts is too busy, just show the X Y of one selected part
% i_part = 1; % selection, or default 1
data.part_color = [1 0 0; 0 0 1; 0 1 0];
if data.N_bodypart >= 3
data.part2plot = [1 2 3]; 
elseif data.N_bodypart >= 2
    data.part2plot = [1 2]; 
elseif data.N_bodypart == 1
    data.part2plot = [1]; 
else
    error('body parts not available')
end
% get first frame
temp = rgb2gray( read(data.Movie_Obj,1));
data.im_plot_axis_x = 1:size(temp,2);
data.im_plot_axis_y = 1:size(temp,1);

data.fig_im_h = figure; 
cla;
data.plot_h.im = imagesc(data.im_plot_axis_x, data.im_plot_axis_y, temp);%, 'Parent', data.axes_im_Front);
pbaspect([data.im_plot_axis_x(end)/data.im_plot_axis_y(end) 1 1]); 
colormap(gray)
hold on;
xlim([data.im_plot_axis_x(1) data.im_plot_axis_x(end)]);
ylim([data.im_plot_axis_y(1) data.im_plot_axis_y(end)]);

plot_num_b = 5; % to fetch in the future
plot_num_a = 20;
curr_plot_range = [(data.curr_fr_n_in_trial-plot_num_b) (data.curr_fr_n_in_trial+plot_num_a)];
if curr_plot_range(1)< 1
    curr_plot_range(1) = 1;
end
if curr_plot_range(2) > data.frame_n_trial
    curr_plot_range(2) =  data.frame_n_trial;
end
for i_part = 1:length(data.part2plot)
data.plot_h.im_line{i_part}  =  plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2))) +data.Track.offset_x, ...
                             data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2))) +data.Track.offset_y, 'g.-');
data.plot_h.im_range{i_part} =  plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs(curr_plot_range(1))) +data.Track.offset_x, ...
                             data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs(curr_plot_range(1))) +data.Track.offset_y, 'yx','MarkerFaceColor','y');
data.plot_h.im_curr{i_part}  =  plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr)+data.Track.offset_x, ...
                             data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr)+data.Track.offset_y,...
                             'o','MarkerFaceColor',data.part_color(i_part,:),'MarkerEdgeColor',data.part_color(i_part,:));
end


% plot coordinate 1-D
data.fig_coor_h = figure; 

for i_part = 1:length(data.part2plot)

data.coor_axes_h.x{i_part}  = subplot(length(data.part2plot)*2,1,i_part*2-1); cla; hold on;
data.plot_h.Ori_line.x{i_part}  = ...
    plot(data.Track.Ori.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs)+data.Track.offset_x(1), 'b'); % original label result plot first layer
data.plot_h.Correct_dot.x{i_part}   = ...
    plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs)+data.Track.offset_x(1), 'k.');

temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.idx_current_trial_frs) < data.prob_thred);
if isempty(temp_idx)
    data.plot_h.X_prob{i_part} = plot(data.curr_fr_n_in_trial, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr)+data.Track.offset_x, 'ks');
else
    data.plot_h.X_prob{i_part} = plot(temp_idx, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs(temp_idx))+data.Track.offset_x, 'ks');
end
data.plot_h.X_curr_circle{i_part}  = plot(data.curr_fr_n_in_trial, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr)+data.Track.offset_x, 'ro');
data.title_h{i_part} = title(data.body_parts{data.part2plot(i_part)});
ylabel('X');
% Y
data.coor_axes_h.y{i_part}  = subplot(length(data.part2plot)*2,1,i_part*2); cla; hold on;
data.plot_h.Ori_line.y{i_part}  = ...
    plot(data.Track.Ori.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs)+data.Track.offset_y, 'b'); % original label result plot first layer
data.plot_h.Correct_dot.y{i_part}   = ...
    plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs)+data.Track.offset_y, 'k.');

temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.idx_current_trial_frs) < data.prob_thred);
if isempty(temp_idx)
    data.plot_h.Y_prob{i_part} = plot(data.curr_fr_n_in_trial, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr)+data.Track.offset_y, 'ks');
else
    data.plot_h.Y_prob{i_part} = plot(temp_idx, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs(temp_idx))+data.Track.offset_y, 'ks');
end
data.plot_h.Y_curr_circle{i_part}  = plot(data.curr_fr_n_in_trial, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr)+data.Track.offset_y, 'ro');
ylabel('Y');
end
xlabel('Frame # in current trial')

linkaxes([data.coor_axes_h.x{:} data.coor_axes_h.y{:}], 'x');

%% Body part panel
set(handles.ObjectList,'String',data.body_parts);
set(handles.ObjectList,'Value',data.part2plot);
% Body part name and coordiantes
for i_part = 1:length(data.part2plot)
    switch i_part
        case 1
            set(handles.Position_body1,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body1,'BackgroundColor',data.part_color(1,:));
            set(handles.Position_body1,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.YCoor_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
        case 2
            set(handles.Position_body2,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body2,'BackgroundColor',data.part_color(2,:));
            set(handles.Position_body2,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.Ycoor_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
            
        case 3
            set(handles.Position_body3,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body3,'BackgroundColor',data.part_color(3,:));
            set(handles.Position_body3,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.Ycoor_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
            
    end
end

% Body part list in Correction control
set(handles.CorrectionList,'String',{data.body_parts{data.part2plot}});
data.correction_ind_in_part2plot = 1;
set(handles.CorrectionList,'Value',data.correction_ind_in_part2plot);
set(handles.CorrectionList,'BackgroundColor',data.part_color(data.correction_ind_in_part2plot,:));
set(handles.CorrectionList,'ForegroundColor',[1 1 1]);



%% update guidata
guidata(hObject,data)

%% change to initate point for current trial, then update plot
data.trial_init_point = str2double(get(handles.InitiatePointFrNum,'String'));
data.curr_fr_n_in_trial = data.trial_init_point;
data.curr_fr = data.idx_current_trial_frs(data.trial_init_point);

guidata(hObject,data)

plot_current_frame (hObject, eventdata, handles)
%% show some parameters model: Optinal
fprintf('ReachCropFront crop params: x - %i, y - %i\n', 330, 70 );
fprintf('ReachCropSide crop params : x - %i, y - %i\n', 880, 130);
% Front: x: 330; y:70
% Side:  x: 880; y: 130


function plot_current_frame (hObject, eventdata, handles)
% tic
data = guidata(hObject);
%% check if figures are closed. if so, reiniated 
if ~ishandle(data.fig_im_h)
    re_initiate_im_fig (hObject, eventdata, handles);
    data = guidata(hObject);    
end
if ~ishandle(data.fig_coor_h)
    re_initiate_coor_fig (hObject, eventdata, handles);
    data = guidata(hObject);    
end
%%
data.curr_fr_n_in_trial = find( data.idx_current_trial_frs == data.curr_fr);

%% make sure the index do not exceed the total; pad the trial with the last frame

if data.idx_current_trial_frs(end) > data.N_fr_tol
    data.idx_current_trial_frs (data.idx_current_trial_frs > data.N_fr_tol) = data.N_fr_tol;     
end
%% update the CDATA
% im
curr_im_Front = rgb2gray( read(data.Movie_Obj,data.curr_fr));
if sum(curr_im_Front(:)) == 0
    disp('Failed reading')
    data.Movie_Obj = VideoReader(fullfile(data.movie_path, data.movie_fn));
    curr_im_Front = rgb2gray( read(data.Movie_Obj,data.curr_fr));
end

plot_num_b = 5;
plot_num_a = 20;
curr_plot_range = [(data.curr_fr_n_in_trial-plot_num_b) (data.curr_fr_n_in_trial+plot_num_a)];
if curr_plot_range(1)< 1
    curr_plot_range(1) = 1;
end
if curr_plot_range(2) > data.frame_n_trial
    curr_plot_range(2) =  data.frame_n_trial;
end
% update im
set(data.plot_h.im,'CData',curr_im_Front);
% update lines in im
for i_part = 1:length(data.part2plot)
    set(data.plot_h.im_line{i_part},...
        'XData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2)))+data.Track.offset_x);
    set(data.plot_h.im_line{i_part},...
        'YData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2)))+data.Track.offset_y);

    set(data.plot_h.im_range{i_part},...
        'XData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs(curr_plot_range(1)))+data.Track.offset_x);
    set(data.plot_h.im_range{i_part},...
        'YData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs(curr_plot_range(1)))+data.Track.offset_y);

    set(data.plot_h.im_curr{i_part},...
        'XData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr)+data.Track.offset_x);
    set(data.plot_h.im_curr{i_part},...
        'YData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr)+data.Track.offset_y);

end

% 1-D
for i_part = 1:length(data.part2plot)
    % title
    if isfield(data, 'title_h')
    set(data.title_h{i_part} , 'String', data.body_parts{data.part2plot(i_part)});
    end
    %X
set(data.plot_h.Ori_line.x{i_part},'YData',data.Track.Ori.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs)'+data.Track.offset_x);
set(data.plot_h.Correct_dot.x{i_part},'YData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs)'+data.Track.offset_x);

temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.idx_current_trial_frs) < data.prob_thred);
if isempty(temp_idx)
    set(data.plot_h.X_prob{i_part},'XData',[]);
    set(data.plot_h.X_prob{i_part},'YData',[]);
else
    set(data.plot_h.X_prob{i_part},'XData',temp_idx); % data.plot_h.X_Front_prob.XData = [];
    set(data.plot_h.X_prob{i_part},'YData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs(temp_idx))+data.Track.offset_x); %data.plot_h.X_Front_prob.YData = [];
end

set(data.plot_h.X_curr_circle{i_part},'XData', data.curr_fr_n_in_trial);
set(data.plot_h.X_curr_circle{i_part},'YData', data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr)+data.Track.offset_x);
                                               
% Y
set(data.plot_h.Ori_line.y{i_part},'YData',data.Track.Ori.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs)'+data.Track.offset_y);
set(data.plot_h.Correct_dot.y{i_part},'YData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs)'+data.Track.offset_y);

temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.idx_current_trial_frs) < data.prob_thred);
if isempty(temp_idx)
    set(data.plot_h.Y_prob{i_part},'XData',[]);
    set(data.plot_h.Y_prob{i_part},'YData',[]);
else
    set(data.plot_h.Y_prob{i_part},'XData',temp_idx); % data.plot_h.X_Front_prob.XData = [];
    set(data.plot_h.Y_prob{i_part},'YData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs(temp_idx))+data.Track.offset_y); %data.plot_h.X_Front_prob.YData = [];
end

set(data.plot_h.Y_curr_circle{i_part},'XData', data.curr_fr_n_in_trial);
set(data.plot_h.Y_curr_circle{i_part},'YData', data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr)+data.Track.offset_y);
                                               
end

guidata(hObject,data)
%% update other data
set(handles.CurrFrameNum,'String', data.curr_fr);
% update Object Panel for the current frame coordinate data
for i_part = 1:length(data.part2plot)
    switch i_part
        case 1
            set(handles.Position_body1,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body1,'BackgroundColor',data.part_color(1,:));
            set(handles.Position_body1,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.YCoor_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
        case 2
            set(handles.Position_body2,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body2,'BackgroundColor',data.part_color(2,:));
            set(handles.Position_body2,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.Ycoor_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
            
        case 3
            set(handles.Position_body3,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body3,'BackgroundColor',data.part_color(3,:));
            set(handles.Position_body3,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.Ycoor_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
            
    end
end

%% check bad trial status
if ismember( data.curr_trial, data.Track.idx_bad_trial)
    warning('Current Trial is bad trial!!!!')
    set(data.fig_im_h,'color','r');
else
    set(data.fig_im_h,'color','w');
end
% go back to main figure
figure(data.figure1);



% --- Executes on button press in BadTrial.
function BadTrial_Callback(hObject, eventdata, handles)
% hObject    handle to BadTrial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);
% remove if is already a bad trial
if ismember(data.curr_trial, data.Track.idx_bad_trial)
    disp('REMOVED from bad trials');
    data.Track.idx_bad_trial(data.Track.idx_bad_trial == data.curr_trial) = [];
else
    if isempty(data.Track.idx_bad_trial)
        data.Track.idx_bad_trial = data.curr_trial;
    else
        data.Track.idx_bad_trial = cat(1, data.Track.idx_bad_trial, data.curr_trial);
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
data.Track.fr_idx_add2deeplab = cat(1, data.Track.fr_idx_add2deeplab,...
    data.curr_fr);
data.Track.fr_idx_add2deeplab = unique(data.Track.fr_idx_add2deeplab);
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
figure(data.fig_coor_h);
% get current selected part
disp(['For ', data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}])
disp('Select start and end of section to NaN, press ENTER after each point');
disp('Start')
[temp_pt_s,~] = getpts(data.coor_axes_h.x{data.correction_ind_in_part2plot});
temp_pt_s = round(temp_pt_s);
disp('End')
[temp_pt_e,~] = getpts(data.coor_axes_h.x{data.correction_ind_in_part2plot});
temp_pt_e = round(temp_pt_e);

if temp_pt_s < 1
    temp_pt_s = 1;
end
if temp_pt_e > data.frame_n_trial
    temp_pt_s = data.frame_n_trial;
end

data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(data.idx_current_trial_frs(temp_pt_s:temp_pt_e)) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(data.idx_current_trial_frs(temp_pt_s:temp_pt_e)) = NaN;
guidata(hObject,data);
plot_current_frame (hObject, eventdata, handles)
figure(data.fig_im_h);
figure(data.fig_coor_h);
figure(data.figure1);

% --- Executes on button press in NaNCurrFrame.
function NaNCurrFrame_Callback(hObject, eventdata, handles)
% hObject    handle to NaNCurrFrame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);
disp(['NaN current frame for ', data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}])

data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(data.curr_fr) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(data.curr_fr) = NaN;
guidata(hObject,data);
plot_current_frame (hObject, eventdata, handles)
figure(data.fig_im_h);
figure(data.fig_coor_h);
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
% data.N_bodypart = length(data.body_parts);
% % showing all parts is too busy, just show the X Y of one selected part
% % i_part = 1; % selection, or default 1
% if data.N_bodypart >= 3
% data.part2plot = [1 2 3]; 
% data.part_color = [1 0 0; 0 0 1; 0 1 0];
% elseif data.N_bodypart >= 2
%     data.part2plot = [1 2]; 
%     data.part_color = [1 0 0; 0 0 1];
% elseif data.N_bodypart == 1
%     data.part2plot = [1]; 
%     data.part_color = [1 0 0];    
% else
%     error('body parts not available')
% end

curr_im_Front = rgb2gray( read(data.Movie_Obj,data.curr_fr));

% data.im_plot_axis_x = 1:size(temp,2);
% data.im_plot_axis_y = 1:size(temp,1);
% 
% data.fig_im_h = figure; 
% cla;
imagesc(data.im_plot_axis_x, data.im_plot_axis_y, curr_im_Front);%, 'Parent', data.axes_im_Front);
pbaspect([data.im_plot_axis_x(end)/data.im_plot_axis_y(end) 1 1]); 
colormap(gray)
hold on;
xlim([data.im_plot_axis_x(1) data.im_plot_axis_x(end)]);
ylim([data.im_plot_axis_y(1) data.im_plot_axis_y(end)]);


i_part =  get(data.CorrectionList, 'Value');

plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs) +data.Track.offset_x, ...
                             data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs) +data.Track.offset_y, 'g.-');


disp(['Curr Display set the bound for ', data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}])
disp('Click 2 points start and end in X, press ENTER after each point');
disp('Start')
% figure(data.fig_im_h);
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
% data.idx_current_trial_frs
temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(data.idx_current_trial_frs) +data.Track.offset_x > temp_bound_x(2) ...
              | data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(data.idx_current_trial_frs) +data.Track.offset_x < temp_bound_x(1));
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(data.idx_current_trial_frs(temp_idx)) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(data.idx_current_trial_frs(temp_idx)) = NaN;
temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(data.idx_current_trial_frs) +data.Track.offset_y> temp_bound_y(2) ...
              | data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(data.idx_current_trial_frs) +data.Track.offset_y< temp_bound_y(1));
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(data.idx_current_trial_frs(temp_idx)) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(data.idx_current_trial_frs(temp_idx)) = NaN;

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

curr_im_Front = rgb2gray( read(data.Movie_Obj,data.curr_fr));

imagesc(data.im_plot_axis_x, data.im_plot_axis_y, curr_im_Front);%, 'Parent', data.axes_im_Front);
pbaspect([data.im_plot_axis_x(end)/data.im_plot_axis_y(end) 1 1]); 
colormap(gray)
hold on;
xlim([data.im_plot_axis_x(1) data.im_plot_axis_x(end)]);
ylim([data.im_plot_axis_y(1) data.im_plot_axis_y(end)]);


i_part =  get(data.CorrectionList, 'Value');

plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(:)+data.Track.offset_x, ...
                             data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(:) +data.Track.offset_y, 'g.-');


disp(['Whole session: set the bound for ', data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}])
disp('Click 2 points start and end in X, press ENTER after each point');
disp('Start')
% figure(data.fig_im_h);
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
temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x +data.Track.offset_x > temp_bound_x(2) ...
              | data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x +data.Track.offset_x < temp_bound_x(1));
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(temp_idx) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(temp_idx) = NaN;

temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y +data.Track.offset_y > temp_bound_y(2) ...
              | data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y +data.Track.offset_y < temp_bound_y(1));
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(temp_idx) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(temp_idx) = NaN;

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

data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x (data.idx_current_trial_frs) = ...
    inpaint_nans(data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(data.idx_current_trial_frs),3);
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y (data.idx_current_trial_frs) = ...
    inpaint_nans(data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(data.idx_current_trial_frs),3);

guidata(hObject,data);
plot_current_frame (hObject, eventdata, handles)




% --- Executes on button press in CorrectLabel.
function CorrectLabel_Callback(hObject, eventdata, handles)
% hObject    handle to CorrectLabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);
figure(data.fig_im_h);
%
disp('Click to get the correct postion, PRESS ENTER when done');
[xi,yi] = getpts(gcf);


data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x (data.curr_fr) = ...
    xi - data.Track.offset_x;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y (data.curr_fr) = ...
    yi - data.Track.offset_y;


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

temp_save = data.Track;
if ~isfield(data,'save_fn')
    if ~isfield(data, 'csv_fn')
        [csv_fn,~ ]= uigetfile([data.movie_path, data.movie_fn(1:end-4) '*.csv']);
        data.csv_fn = fullfile(data.movie_path, csv_fn);
    end
    if isempty(data.csv_fn)
        [csv_fn,~ ]= uigetfile([data.movie_path, data.movie_fn(1:end-4) '*.csv']);
        data.csv_fn = fullfile(data.movie_path, csv_fn);
    end
    temp_idx = strfind(data.csv_fn,'_');
    %HL110_200127_SNc_onset0DeepCut_resnet50_ReachPlusOneViewSeparatet1.0Apr11shuffle1_850000_cmb
    % for combined csv file there is one more '_'
    % change to use resnet to find the right part
    if any(strfind(data.csv_fn,'_cmb.csv'))
        temp_idx(end) = [];
    end
    % HL changed 2020-5-14 
    % better to change useing regexp in the future
    data.save_fn =...
    fullfile(data.movie_path,...
    [data.movie_fn(1:end-4), ...
    data.csv_fn(temp_idx(end-2):end-4),...
    '.mat']);
% when training, make different stop point
end
temp_save.csv_fn = data.csv_fn;
temp_save.movie_fn = data.movie_fn;
temp_save.curr_trial = data.curr_trial;
save(data.save_fn,'-struct','temp_save');

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
if temp > data.N_fr_tol
    disp('Beyond the total frame number');
    set(hObject, 'String', num2str(data.curr_fr));
else
    data.curr_fr = temp;
    % update current trial and frame in current trial
    data.curr_trial = ceil(data.curr_fr/data.frame_n_trial);
    data.idx_current_trial_frs = (data.curr_trial - 1)*data.frame_n_trial + [1:data.frame_n_trial] ;
    data.curr_fr_n_in_trial = find( data.idx_current_trial_frs == data.curr_fr);
    
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

data.frame_n_trial = str2double(get(hObject,'String'));
% update current trial and frame in current trial
data.curr_trial = ceil(data.curr_fr/data.frame_n_trial);
data.idx_current_trial_frs = (data.curr_trial - 1)*data.frame_n_trial + [1:data.frame_n_trial] ;
data.curr_fr_n_in_trial = find( data.idx_current_trial_frs == data.curr_fr);
data.n_trial = ceil(data.N_fr_tol/data.frame_n_trial); 

% update curr trial nunmber, total trial number
set(data.CurrTrialNum, 'String', num2str(data.curr_trial))
set(data.NumofTrials, 'String', num2str(data.n_trial))

if data.trial_init_point > data.frame_n_trial
    data.trial_init_point = ceil(data.frame_n_trial/2);
    set(data.InitiatePointFrNum, 'String', num2str(data.trial_init_point))
end
guidata(hObject,data)
% for coordinate plot lim x axis
for ii = 1:length(data.coor_axes_h.x)
   xlim(data.coor_axes_h.x{ii}, [1 data.frame_n_trial ]) ;
   xlim(data.coor_axes_h.y{ii}, [1 data.frame_n_trial ]) ;
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
data.curr_trial = str2double(get(hObject,'String'));
%reset current frame as the init frame of current trialdata.idx_current_trial_frs
data.idx_current_trial_frs = (data.curr_trial - 1)*data.frame_n_trial + [1:data.frame_n_trial] ;

data.curr_fr = data.idx_current_trial_frs(data.trial_init_point);
% data.curr_fr_n_in_trial = find( data.idx_current_trial_frs == data.curr_fr);

set(handles.CurrFrameNum, 'String', num2str(data.curr_fr));

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

data.trial_init_point = str2double(get(hObject,'String'));

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

data.curr_trial = data.curr_trial-1;

if data.curr_trial < 1
    warning('First trial already!!!');
    data.curr_trial = 1;
else
    disp('Previous Trial')
    set(handles.CurrTrialNum, 'String', num2str(data.curr_trial));
    data.idx_current_trial_frs = ...
        (data.curr_trial - 1)*data.frame_n_trial + [1:data.frame_n_trial] ;
    
    data.curr_fr = data.idx_current_trial_frs(data.trial_init_point); % start of the trial
    
    set(handles.CurrFrameNum, 'String', num2str(data.curr_fr));
    
    guidata(hObject,data);
    
    plot_current_frame (hObject, eventdata, handles)
end


% --- Executes on button press in NextTrial.
function NextTrial_Callback(hObject, eventdata, handles)
% hObject    handle to NextTrial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = guidata(hObject);

data.curr_trial = data.curr_trial+1;

if data.curr_trial > data.n_trial
    warning('Last trial already!!!');
    data.curr_trial = data.n_trial;
else
    disp('Next Trial')
    set(handles.CurrTrialNum, 'String', num2str(data.curr_trial));
    data.idx_current_trial_frs = ...
        (data.curr_trial - 1)*data.frame_n_trial + [1:data.frame_n_trial] ;
    
    data.curr_fr = data.idx_current_trial_frs(data.trial_init_point); % start of the trial
    
    set(handles.CurrFrameNum, 'String', num2str(data.curr_fr));
    
    guidata(hObject,data);
    
    plot_current_frame (hObject, eventdata, handles)
end

% --- Executes on button press in GoToFr.
function GoToFr_Callback(hObject, eventdata, handles)
% hObject    handle to GoToFr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);

figure(data.fig_coor_h);
disp('Click to get the postion in X coordinate plot, PRESS ENTER when done');
[xi,yi] = getpts(gcf);

if (round(xi)+ (data.curr_trial-1)*data.frame_n_trial)> data.N_fr_tol
    disp('Beyond the total frame number');    
else
data.curr_fr_n_in_trial= round(xi);
data.curr_fr = data.curr_fr_n_in_trial + (data.curr_trial-1)*data.frame_n_trial;

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
    'space- jump to next 20 frame';
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
    disp(['d-next frame, a-previous frame, space-jump 20 frames, b- jump 200 frames, e- goto mouse selection frame, ' ...
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

data.correction_ind_in_part2plot = get(hObject,'Value');
set(hObject,'BackgroundColor',data.part_color(data.correction_ind_in_part2plot,:));

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
        if data.curr_fr+ 1 >= data.N_fr_tol
            data.curr_fr = data.N_fr_tol; 
            warning('END of Movie');
        elseif data.curr_fr+ 1 >= data.idx_current_trial_frs(end)
            warning('END of curr display, move to next trial/disp, please!!');
        else
            disp('Next Frame')
            data.curr_fr = data.curr_fr + 1;
        
        guidata(hObject,data);
        set(handles.CurrFrameNum,'String', data.curr_fr);
        plot_current_frame (hObject, eventdata, handles);
        end
    case 'a' % previous frame        
        if data.curr_fr <=1
            warning('BEGINING of Movie');
        elseif data.curr_fr <= data.idx_current_trial_frs(1)
            warning('Beginning of curr display, move to previous trial/disp, please!!');
        else
            disp('Previous Frame')
            data.curr_fr = data.curr_fr - 1;
        guidata(hObject,data);
        set(handles.CurrFrameNum,'String', data.curr_fr);
        plot_current_frame (hObject, eventdata, handles); 
        end

    case 'space' % jump 20 frames
        if data.curr_fr+ 20 >= data.N_fr_tol
            data.curr_fr = data.N_fr_tol;
            warning('END of Movie');
        elseif data.curr_fr+ 20 >= data.idx_current_trial_frs(end)
            warning('END of curr display, move to next trial/disp, please!!');
        else
            disp('Jump 20 Frames Forward')
            data.curr_fr = data.curr_fr + 20;            
            guidata(hObject,data);
            set(handles.CurrFrameNum,'String', data.curr_fr);
            plot_current_frame (hObject, eventdata, handles);
        end
    case 'b' % jump 200 frames
         if data.curr_fr+ 200 >= data.N_fr_tol
            data.curr_fr = data.N_fr_tol;
            warning('END of Movie');
        elseif data.curr_fr+ 200 >= data.idx_current_trial_frs(end)
            warning('END of curr display, move to next trial/disp, please!!');
        else
            disp('Jump 200 Frames')
            data.curr_fr = data.curr_fr + 200;            
            guidata(hObject,data);
            set(handles.CurrFrameNum,'String', data.curr_fr);
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
    case 'h' % help
        disp('Availabel KeyboardShortCut');
        disp(['d-next frame, a-previous frame, space-jump 20 frames, b- jump 200 frames, e- goto mouse selection frame, ' ...
            'f-next trial, v-previous trial, s- save, n- NaN current frame, m- NaN a selected section, x- Fill NaNs of Curr Display'...
            'c-correct label for curr frame, t-set bound for curr. display, y-set bound for the whole session' ...
            'g-next epoch, z-previous epoch'])
    otherwise
        disp('Not a defined Keyboard Shortcut');
        disp(['d-next frame, a-previous frame, space-jump 20 frames, b- jump 200 frames, e- goto mouse selection frame, ' ...
            'f-next trial, v-previous trial, s- save, n- NaN current frame, m- NaN a selected section, x- Fill NaNs of Curr Display'...
            'c-correct label for curr frame, t-set bound for curr. display, y-set bound for the whole session'...
            'g-next epoch, z-previous epoch'])
       
end


%% reinitiated 

function re_initiate_im_fig (hObject, eventdata, handles)

data = guidata(hObject);

data.fig_im_h = figure; 
cla;
temp = rgb2gray( read(data.Movie_Obj,data.curr_fr));
data.plot_h.im = imagesc(data.im_plot_axis_x, data.im_plot_axis_y, temp);%, 'Parent', data.axes_im_Front);
pbaspect([data.im_plot_axis_x(end)/data.im_plot_axis_y(end) 1 1]); 
colormap(gray)
hold on;
xlim([data.im_plot_axis_x(1) data.im_plot_axis_x(end)]);
ylim([data.im_plot_axis_y(1) data.im_plot_axis_y(end)]);

plot_num_b = 5; % to fetch in the future
plot_num_a = 20;
curr_plot_range = [(data.curr_fr_n_in_trial-plot_num_b) (data.curr_fr_n_in_trial+plot_num_a)];
if curr_plot_range(1)< 1
    curr_plot_range(1) = 1;
end
if curr_plot_range(2) > data.frame_n_trial
    curr_plot_range(2) =  data.frame_n_trial;
end

% fist make default (3) lines, then replace with current selected 
if data.N_bodypart >= 3
data.part2plot = [1 2 3]; 
data.part_color = [1 0 0; 0 0 1; 0 1 0];
elseif data.N_bodypart >= 2
    data.part2plot = [1 2]; 
    data.part_color = [1 0 0; 0 0 1];
elseif data.N_bodypart == 1
    data.part2plot = [1]; 
    data.part_color = [1 0 0];    
else
    error('body parts not available')
end
for i_part = 1:length(data.part2plot)
data.plot_h.im_line{i_part}  =  plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2))) +data.Track.offset_x, ...
                             data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2))) +data.Track.offset_y, 'g.-');
data.plot_h.im_range{i_part} =  plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs(curr_plot_range(1))) +data.Track.offset_x, ...
                             data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs(curr_plot_range(1))) +data.Track.offset_y, 'yx','MarkerFaceColor','y');
data.plot_h.im_curr{i_part}  =  plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr)+data.Track.offset_x, ...
                             data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr)+data.Track.offset_y,...
                             'o','MarkerFaceColor',data.part_color(i_part,:),'MarkerEdgeColor',data.part_color(i_part,:));
end

%  then replace with current selected
data.part2plot = get(data.ObjectList,'Value');
for i_part = 1:length(data.part2plot)
    set(data.plot_h.im_line{i_part},...
        'XData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2)))+data.Track.offset_x);
    set(data.plot_h.im_line{i_part},...
        'YData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs(curr_plot_range(1):curr_plot_range(2)))+data.Track.offset_y);

    set(data.plot_h.im_range{i_part},...
        'XData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs(curr_plot_range(1)))+data.Track.offset_x);
    set(data.plot_h.im_range{i_part},...
        'YData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs(curr_plot_range(1)))+data.Track.offset_y);

    set(data.plot_h.im_curr{i_part},...
        'XData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr)+data.Track.offset_x);
    set(data.plot_h.im_curr{i_part},...
        'YData',data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr)+data.Track.offset_y);

end



% update 
guidata(hObject,data)


function re_initiate_coor_fig (hObject, eventdata, handles)

data = guidata(hObject);

% plot coordinate 1-D
% temp_n = get(data.ObjectList,'Max');
data.fig_coor_h = figure; 
% re initaite plots
if data.N_bodypart >= 3
data.part2plot = [1 2 3]; 
data.part_color = [1 0 0; 0 0 1; 0 1 0];
elseif data.N_bodypart >= 2
    data.part2plot = [1 2]; 
    data.part_color = [1 0 0; 0 0 1];
elseif data.N_bodypart == 1
    data.part2plot = [1]; 
    data.part_color = [1 0 0];    
else
    error('body parts not available')
end

for i_part = 1:length(data.part2plot)
data.coor_axes_h.x{i_part}  = subplot(length(data.part2plot)*2,1,i_part*2-1); cla; hold on;
data.plot_h.Ori_line.x{i_part}  = ...
    plot(data.Track.Ori.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs)+data.Track.offset_x(1), 'b'); % original label result plot first layer
data.plot_h.Correct_dot.x{i_part}   = ...
    plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs)+data.Track.offset_x(1), 'k.');

temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.idx_current_trial_frs) < data.prob_thred);
if isempty(temp_idx)
    data.plot_h.X_prob{i_part} = plot(data.curr_fr_n_in_trial, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr)+data.Track.offset_x, 'ks');
else
    data.plot_h.X_prob{i_part} = plot(temp_idx, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs(temp_idx))+data.Track.offset_x, 'ks');
end
data.plot_h.X_curr_circle{i_part}  = plot(data.curr_fr_n_in_trial, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr)+data.Track.offset_x, 'ro');
data.title_h{i_part} = title(data.body_parts{data.part2plot(i_part)});
ylabel('X');
% Y
data.coor_axes_h.y{i_part}  = subplot(length(data.part2plot)*2,1,i_part*2); cla; hold on;
data.plot_h.Ori_line.y{i_part}  = ...
    plot(data.Track.Ori.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs)+data.Track.offset_y, 'b'); % original label result plot first layer
data.plot_h.Correct_dot.y{i_part}   = ...
    plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs)+data.Track.offset_y, 'k.');

temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.idx_current_trial_frs) < data.prob_thred);
if isempty(temp_idx)
    data.plot_h.Y_prob{i_part} = plot(data.curr_fr_n_in_trial, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr)+data.Track.offset_y, 'ks');
else
    data.plot_h.Y_prob{i_part} = plot(temp_idx, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs(temp_idx))+data.Track.offset_y, 'ks');
end
data.plot_h.Y_curr_circle{i_part}  = plot(data.curr_fr_n_in_trial, data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr)+data.Track.offset_y, 'ro');
ylabel('Y');
end
xlabel('Frame # in current trial')

linkaxes([data.coor_axes_h.x{:} data.coor_axes_h.y{:}], 'x');

% fill in numbers 
% refetch selected parts
data.part2plot = get(data.ObjectList,'Value');
max_select = get(data.ObjectList,'Max');

% first reset selected panel data, then fill in new
for i_part = 1:max_select
    set(data.title_h{i_part}, 'String', data.body_parts{i_part});
    switch i_part
        case 1
            set(handles.Position_body1,'String',num2str(NaN));
            set(handles.Position_body1,'BackgroundColor',data.part_color(1,:));
            set(handles.Position_body1,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body1,'String',num2str(NaN));
            set(handles.YCoor_body1,'String',num2str(NaN));
            set(handles.ProbValue_body1,'String',num2str(NaN));
        case 2
            set(handles.Position_body2,'String',num2str(NaN));
            set(handles.Position_body2,'BackgroundColor',data.part_color(2,:));
            set(handles.Position_body2,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body2,'String',num2str(NaN));
            set(handles.Ycoor_body2,'String',num2str(NaN));
            set(handles.ProbValue_body2,'String',num2str(NaN));
            
        case 3
            set(handles.Position_body3,'String',num2str(NaN));
            set(handles.Position_body3,'BackgroundColor',data.part_color(3,:));
            set(handles.Position_body3,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body3,'String',num2str(NaN));
            set(handles.Ycoor_body3,'String',num2str(NaN));
            set(handles.ProbValue_body3,'String',num2str(NaN));
            
    end
end
for i_part = 1:length(data.part2plot)
    switch i_part
        case 1
            set(handles.Position_body1,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body1,'BackgroundColor',data.part_color(1,:));
            set(handles.Position_body1,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.YCoor_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body1,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
            
        case 2
            set(handles.Position_body2,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body2,'BackgroundColor',data.part_color(2,:));
            set(handles.Position_body2,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.Ycoor_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body2,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
            
        case 3
            set(handles.Position_body3,'String',data.body_parts{data.part2plot(i_part)});
            set(handles.Position_body3,'BackgroundColor',data.part_color(3,:));
            set(handles.Position_body3,'ForegroundColor',[1 1 1]);
            set(handles.Xcoor_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.curr_fr) ));
            set(handles.Ycoor_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.curr_fr) ));
            set(handles.ProbValue_body3,'String',num2str(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).Likelihood(data.curr_fr) ));
            
    end
    set(data.title_h{i_part} , 'String', data.body_parts{data.part2plot(i_part)});
    
end


% also update the correction panel's list
set(handles.CorrectionList,'String',{data.body_parts{data.part2plot}});
data.correction_ind_in_part2plot = 1;
set(handles.CorrectionList,'Value',data.correction_ind_in_part2plot);
set(handles.CorrectionList,'BackgroundColor',data.part_color(data.correction_ind_in_part2plot,:));

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


if isfield(data, 'fig_im_h')
    if ishandle(data.fig_im_h)
        close (data.fig_im_h)
    end
end
if isfield(data, 'fig_coor_h')
    if ishandle(data.fig_coor_h)
        close (data.fig_coor_h)
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

% data.correction_ind_in_part2plot = get(hObject,'Value');
% data.part2plot
% data.correction_ind_in_part2plot
% set to 1st choice
data.correction_ind_in_part2plot = 1;

%update
set(data.CorrectionList,'Value',data.correction_ind_in_part2plot);
set(data.CorrectionList,'BackgroundColor',data.part_color(data.correction_ind_in_part2plot,:));

guidata(hObject,data) % plot_current_frame (hObject, eventdata, handles)
figure(data.figure1);

function SetCorrectionList_Callback_2(hObject, eventdata, handles)
% hObject    handle to CorrectionList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CorrectionList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CorrectionList

data = guidata(hObject);

if length(data.part2plot) < 2
    disp('Selected Body Parts less < 2');
else

data.correction_ind_in_part2plot = 2;

%update
set(data.CorrectionList,'Value',data.correction_ind_in_part2plot);
set(data.CorrectionList,'BackgroundColor',data.part_color(data.correction_ind_in_part2plot,:));

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

if length(data.part2plot) < 3
    disp('Selected Body Parts less < 3');
else
data.correction_ind_in_part2plot = 3;

%update
set(data.CorrectionList,'Value',data.correction_ind_in_part2plot);
set(data.CorrectionList,'BackgroundColor',data.part_color(data.correction_ind_in_part2plot,:));

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
curr_im_Front = rgb2gray( read(data.Movie_Obj,data.curr_fr));

imagesc(data.im_plot_axis_x, data.im_plot_axis_y, curr_im_Front);%, 'Parent', data.axes_im_Front);
pbaspect([data.im_plot_axis_x(end)/data.im_plot_axis_y(end) 1 1]); 
colormap(gray)
hold on;
xlim([data.im_plot_axis_x(1) data.im_plot_axis_x(end)]);
ylim([data.im_plot_axis_y(1) data.im_plot_axis_y(end)]);


i_part =  get(data.CorrectionList, 'Value');

plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x(data.idx_current_trial_frs) +data.Track.offset_x, ...
                             data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y(data.idx_current_trial_frs) +data.Track.offset_y, 'g.-');


disp(['Curr Display: Delete Points within a retangular area for ', data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}])
disp('Click 2 points start and end in X, press ENTER after each point');
disp('Start')
% figure(data.fig_im_h);
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
% data.idx_current_trial_frs
temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(data.idx_current_trial_frs) +data.Track.offset_x< temp_bound_x(2) ...
              & data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(data.idx_current_trial_frs) +data.Track.offset_x> temp_bound_x(1) ...
              & data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(data.idx_current_trial_frs) +data.Track.offset_y< temp_bound_y(2) ...
              & data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(data.idx_current_trial_frs) +data.Track.offset_y> temp_bound_y(1));

data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(data.idx_current_trial_frs(temp_idx)) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(data.idx_current_trial_frs(temp_idx)) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(data.idx_current_trial_frs(temp_idx)) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(data.idx_current_trial_frs(temp_idx)) = NaN;

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
% data.N_bodypart = length(data.body_parts);
% % showing all parts is too busy, just show the X Y of one selected part
% % i_part = 1; % selection, or default 1
% if data.N_bodypart >= 3
% data.part2plot = [1 2 3]; 
% data.part_color = [1 0 0; 0 0 1; 0 1 0];
% elseif data.N_bodypart >= 2
%     data.part2plot = [1 2]; 
%     data.part_color = [1 0 0; 0 0 1];
% elseif data.N_bodypart == 1
%     data.part2plot = [1]; 
%     data.part_color = [1 0 0];    
% else
%     error('body parts not available')
% end

curr_im_Front = rgb2gray( read(data.Movie_Obj,data.curr_fr));

% data.im_plot_axis_x = 1:size(temp,2);
% data.im_plot_axis_y = 1:size(temp,1);
% 
% data.fig_im_h = figure; 
% cla;
imagesc(data.im_plot_axis_x, data.im_plot_axis_y, curr_im_Front);%, 'Parent', data.axes_im_Front);
pbaspect([data.im_plot_axis_x(end)/data.im_plot_axis_y(end) 1 1]); 
colormap(gray)
hold on;
xlim([data.im_plot_axis_x(1) data.im_plot_axis_x(end)]);
ylim([data.im_plot_axis_y(1) data.im_plot_axis_y(end)]);


i_part =  get(data.CorrectionList, 'Value');

plot(data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).x +data.Track.offset_x, ...
                             data.Track.Corrected.(data.body_parts{data.part2plot(i_part)}).y +data.Track.offset_y, 'g.-');


disp(['Whole Session: Delete Points within a retangular area for ', data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}])
disp('Click 2 points start and end in X, press ENTER after each point');
disp('Start')
% figure(data.fig_im_h);
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
% data.idx_current_trial_frs
temp_idx = find(data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x +data.Track.offset_x< temp_bound_x(2) ...
              & data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x +data.Track.offset_x> temp_bound_x(1) ...
              & data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y +data.Track.offset_y< temp_bound_y(2) ...
              & data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y +data.Track.offset_y> temp_bound_y(1));
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(temp_idx) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(temp_idx) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(temp_idx) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(temp_idx) = NaN;

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

data.Track.offset_x = str2double(get(hObject,'String'));
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

data.Track.offset_y = str2double(get(hObject,'String'));
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
if isfield (data, 'EpochFrameIdx_fn')
    disp('EpochFrame Idx file loaded')
else % get the file
    %parse movie name to get the FrameIndex file
tokens = regexp(data.movie_fn, ...
    '(?<animalname>\w\w\d\d\d)_(?<datename>\d\d\d\d\d\d)_(?<proc_name>\w+)*', 'names');% include all initials HLXXX GZXXX etc
animalname = tokens.animalname;
ses_date = tokens.datename;
proc_name = tokens.proc_name;

default_folders;
try [data.EpochFrameIdx_fn,data.EpochFrameIdx_path] = uigetfile(fullfile(save_path, animalname, ses_date, '*.mat'),'Select EpochFrameIndex mat file');
catch [data.EpochFrameIdx_fn,data.EpochFrameIdx_path] = uigetfile('*.mat','Select EpochFrameIndex mat file (on server Data_mat folder)');
    
end
end
% set the name of static txt box FrameIdx Filename
set(handles.FrameIdx_filename,'String', fullfile(data.EpochFrameIdx_path, data.EpochFrameIdx_fn));

% epoch frame indx mat file
data.EpochFrameIdx = load(fullfile(data.EpochFrameIdx_path,data.EpochFrameIdx_fn ));

% determine the file type and make the epoch sequence to go through 
if isfield(data.EpochFrameIdx, 'Epoch_FrameIdx_OppWin_ON') % OptoTim session 
    data.Epoch_unite = data.EpochFrameIdx.Epoch_FrameIdx_OppWin_ON;
    data.n_epoch = size(data.Epoch_unite,1);
    
elseif isfield(data.EpochFrameIdx, 'Epoch_FrameIdx_OptoTrig_ON') % OptoTim session 
    data.Epoch_unite = cat(1, data.EpochFrameIdx.Epoch_FrameIdx_OptoTrig_ON, data.EpochFrameIdx.Epoch_FrameIdx_ControlTrig_ON); % 
    data.n_epoch = size(data.Epoch_unite,1);
    
else
    error('unknow EpochFrameIdx session type');
end

data.n_epoch_curr = 1; % initiated

% set curr frame accordingly 
fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.n_epoch_curr,  data.Epoch_unite(1,1), data.Epoch_unite(1,2));
data.curr_fr = data.Epoch_unite(1,1);

set(handles.Curr_Epoch_Num, 'String', num2str(data.n_epoch_curr));
set(handles.N_TotalEpoch, 'String', num2str(size(data.Epoch_unite,1)));
set(handles.CurrFrameNum, 'String', num2str(data.curr_fr));

% CurrFrameNum_Callback(hObject, eventdata, handles)
data.curr_trial = ceil(data.curr_fr/data.frame_n_trial);
data.idx_current_trial_frs = (data.curr_trial - 1)*data.frame_n_trial + [1:data.frame_n_trial] ;
data.curr_fr_n_in_trial = find( data.idx_current_trial_frs == data.curr_fr);

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
[NaN_start NaN_end ]= data.Epoch_unite (data.n_epoch_curr,:);
idx2NaN = NaN_start:NaN_end;
disp(['NaN epoch frames for ', data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}]);
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).x(idx2NaN) = NaN;
data.Track.Corrected.(data.body_parts{data.part2plot(data.correction_ind_in_part2plot)}).y(idx2NaN) = NaN;
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
if temp > size(data.Epoch_unite,1)
    disp('Beyond the total Epoch number');
    set(hObject, 'String', num2str(data.n_epoch_curr));
else
    data.n_epoch_curr = temp;
    data.curr_fr = data.Epoch_unite(data.n_epoch_curr,1);
fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.n_epoch_curr, ...
    data.Epoch_unite(data.n_epoch_curr,1), data.Epoch_unite(data.n_epoch_curr,2));

    % update current frame
    set(handles.CurrFrameNum, 'String', num2str(data.curr_fr));
    
% CurrFrameNum_Callback(hObject, eventdata, handles)
data.curr_trial = ceil(data.curr_fr/data.frame_n_trial);
data.idx_current_trial_frs = (data.curr_trial - 1)*data.frame_n_trial + [1:data.frame_n_trial] ;
data.curr_fr_n_in_trial = find( data.idx_current_trial_frs == data.curr_fr);

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

data.n_epoch_curr = data.n_epoch_curr+1;

if data.n_epoch_curr > size(data.Epoch_unite,1)
    warning('Last Epoch already!!!');
    data.n_epoch_curr = size(data.Epoch_unite,1);
else
    disp('Next Epoch')
    set(handles.Curr_Epoch_Num, 'String', num2str(data.n_epoch_curr));
    data.curr_fr = data.Epoch_unite(data.n_epoch_curr,1);
fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.n_epoch_curr, ...
    data.Epoch_unite(data.n_epoch_curr,1), data.Epoch_unite(data.n_epoch_curr,2));
    % first update global data?
    set(handles.CurrFrameNum, 'String', num2str(data.curr_fr));
    set(handles.CurrFrameNum, 'String', num2str(data.curr_fr));
% CurrFrameNum_Callback(hObject, eventdata, handles)
data.curr_trial = ceil(data.curr_fr/data.frame_n_trial);
data.idx_current_trial_frs = (data.curr_trial - 1)*data.frame_n_trial + [1:data.frame_n_trial] ;
data.curr_fr_n_in_trial = find( data.idx_current_trial_frs == data.curr_fr);

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

data.n_epoch_curr = data.n_epoch_curr-1;

if data.n_epoch_curr < 1
    warning('First Epoch already!!!');
    data.n_epoch_curr = 1;
else
    disp('Previous Epoch')
    set(handles.Curr_Epoch_Num, 'String', num2str(data.n_epoch_curr));
    data.curr_fr = data.Epoch_unite(data.n_epoch_curr,1);
fprintf('Curr Epoch# %i: Start Frame %i - End Frame %i \n', data.n_epoch_curr, ...
    data.Epoch_unite(data.n_epoch_curr,1), data.Epoch_unite(data.n_epoch_curr,2));
    
    set(handles.CurrFrameNum, 'String', num2str(data.curr_fr));  
  % CurrFrameNum_Callback(hObject, eventdata, handles)
data.curr_trial = ceil(data.curr_fr/data.frame_n_trial);
data.idx_current_trial_frs = (data.curr_trial - 1)*data.frame_n_trial + [1:data.frame_n_trial] ;
data.curr_fr_n_in_trial = find( data.idx_current_trial_frs == data.curr_fr);

% return data
guidata(hObject,data)
% update curr trial nunmber
plot_current_frame (hObject, eventdata, handles);

end