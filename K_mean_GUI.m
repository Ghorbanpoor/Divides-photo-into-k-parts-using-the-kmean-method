function varargout = K_mean_GUI(varargin)
% K_MEAN_GUI MATLAB code for K_mean_GUI.fig
%      K_MEAN_GUI, by itself, creates a new K_MEAN_GUI or raises the existing
%      singleton*.
%
%      H = K_MEAN_GUI returns the handle to a new K_MEAN_GUI or the handle to
%      the existing singleton*.
%
%      K_MEAN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in K_MEAN_GUI.M with the given input arguments.
%
%      K_MEAN_GUI('Property','Value',...) creates a new K_MEAN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before K_mean_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to K_mean_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help K_mean_GUI

% Last Modified by GUIDE v2.5 31-May-2019 11:24:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @K_mean_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @K_mean_GUI_OutputFcn, ...
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


% --- Executes just before K_mean_GUI is made visible.
function K_mean_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to K_mean_GUI (see VARARGIN)

% Choose default command line output for K_mean_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes K_mean_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = K_mean_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile({'*.*'},'Open Directory');
if isequal(filename,0) || isequal(pathname,0)
    return
end

set(handles.edit1,'String',strcat(pathname,filename));



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc

Im=get(handles.edit1,'String');
kk=str2double(get(handles.edit2,'String'));

I=imread(Im);
I=im2bw(I);

k=1;
for i=1:size(I,1)
    for j=1:size(I,2)
        if I(i,j)==1
            a(k,1)=i;
            a(k,2)=j;
            k=k+1;
        end
    end
end

opts=statset('Display','final');
idx=kmeans(a,kk,'Distance','cityblock','Replicates',5,'Options',opts);

hold on
for i=1:size(idx,1)
    if idx(i,1)==1
        plot(a(i,1),a(i,2),'r.')
    elseif idx(i,1)==2
        plot(a(i,1),a(i,2),'w.')
    elseif idx(i,1)==3
        plot(a(i,1),a(i,2),'g.')
    elseif idx(i,1)==4
        plot(a(i,1),a(i,2),'y.')    
    elseif idx(i,1)==5
        plot(a(i,1),a(i,2),'c.')
    elseif idx(i,1)==6
        plot(a(i,1),a(i,2),'m.')
    elseif idx(i,1)==7
        plot(a(i,1),a(i,2),'k.')
    end
        
end

hold off
