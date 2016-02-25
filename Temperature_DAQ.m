function varargout = Temperature_DAQ(varargin)
% TEMPERATURE_DAQ MATLAB code for Temperature_DAQ.fig
%      TEMPERATURE_DAQ, by itself, creates a new TEMPERATURE_DAQ or raises the existing
%      singleton*.
%
%      H = TEMPERATURE_DAQ returns the handle to a new TEMPERATURE_DAQ or the handle to
%      the existing singleton*.
%
%      TEMPERATURE_DAQ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEMPERATURE_DAQ.M with the given input arguments.
%
%      TEMPERATURE_DAQ('Property','Value',...) creates a new TEMPERATURE_DAQ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Temperature_DAQ_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Temperature_DAQ_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Temperature_DAQ

% Last Modified by GUIDE v2.5 22-Feb-2016 22:26:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Temperature_DAQ_OpeningFcn, ...
                   'gui_OutputFcn',  @Temperature_DAQ_OutputFcn, ...
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



% --- Executes just before Temperature_DAQ is made visible.
function Temperature_DAQ_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Temperature_DAQ (see VARARGIN)

% Choose default command line output for Temperature_DAQ
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Temperature_DAQ wait for user response (see UIRESUME)
% uiwait(handles.figure1);
delete(instrfind({'Port'},{'COM3'}))
clear all;
global ard;
ard = arduino('COM3');


% --- Outputs from this function are returned to the command line.
function varargout = Temperature_DAQ_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function sample_rate_Callback(hObject, eventdata, handles)
% hObject    handle to sample_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sample_rate as text
%        str2double(get(hObject,'String')) returns contents of sample_rate as a double
handles.data1=get(hObject,'String');
handles.sample_rate=str2double(handles.data1);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function sample_rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sample_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
handles.data2=get(hObject,'String');
handles.total_samples=str2double(handles.data2);
guidata(hObject,handles);

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


% --- Executes on button press in begin_sample.
function begin_sample_Callback(hObject, eventdata, handles)
% hObject    handle to begin_sample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of begin_sample
global x k ard;
x=0;
for k=1:(1/handles.sample_rate):handles.total_samples
    voltage = readVoltage(ard, 'A0');
    %millivolts = (voltage *(5/1024));
    deg_c = ((voltage*1000)-500)/10;
    x=[x,deg_c];
    plot(x,'LineWidth',2); grid on;
    axis([0 handles.total_samples -10 90]);
    pause(1/handles.sample_rate);
end
return;
