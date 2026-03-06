function varargout = ProyectoFinal(varargin)
% PROYECTOFINAL MATLAB code for ProyectoFinal.fig
%      PROYECTOFINAL, by itself, creates a new PROYECTOFINAL or raises the existing
%      singleton*.
%
%      H = PROYECTOFINAL returns the handle to a new PROYECTOFINAL or the handle to
%      the existing singleton*.
%
%      PROYECTOFINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROYECTOFINAL.M with the given input arguments.
%
%      PROYECTOFINAL('Property','Value',...) creates a new PROYECTOFINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProyectoFinal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProyectoFinal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProyectoFinal

% Last Modified by GUIDE v2.5 05-Mar-2026 18:26:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProyectoFinal_OpeningFcn, ...
                   'gui_OutputFcn',  @ProyectoFinal_OutputFcn, ...
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


% --- Executes just before ProyectoFinal is made visible.
function ProyectoFinal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProyectoFinal (see VARARGIN)

handles.output=hObject;
handles.selectore=0;
cla;
rotate3d(handles.axes1,'on');
axis([-18 18 -18 18 0 18]);
plot3(15,-15,15,-15,15,0);
T00=eye(4);
handles.ax1=0;
handles.ax2=0;
handles.ax3=0;
[T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
DrawRobots(T00,T01,T12,T23);
handles.X=T03(1,4);
handles.Y=T03(2,4);
handles.Z=T03(3,4);

% Update handles structure
guidata(hObject, handles);

function varargout = ProyectoFinal_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in xplus.
function xplus_Callback(hObject, eventdata, handles)
if (handles.selectore>0)
handles.output=hObject;
cla;
plot3(15,-15,15,-15,15,0);
T00=eye(4);
end
if (handles.selectore==1)
    handles.ax1=handles.ax1+1;
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
    handles.X=T03(1,4);
    handles.Y=T03(2,4);
    handles.Z=T03(3,4);
end
if (handles.selectore==2)
    timy=[1 0 0 0.25; ... 
      0 1 0 0; ...
      0 0 1 0; ...
      0 0 0 1];
    Tycon=Trans(handles.ramory,'Rz')*timy
    handles.X=handles.X+Tycon(1,4);
    handles.Y=handles.Y+Tycon(2,4);
    nani=CI3GDL(handles.X,handles.Y,handles.Z);
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
if (handles.selectore==3)
    handles.X=handles.X+0.25;
    nani=CI3GDL(handles.X,handles.Y,handles.Z);
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in xminus.
function xminus_Callback(hObject, eventdata, handles)
if (handles.selectore>0)
handles.output=hObject;
cla;
plot3(15,-15,15,-15,15,0);
T00=eye(4);
end
if (handles.selectore==1)
    handles.ax1=handles.ax1-1;
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3)
    DrawRobots(T00,T01,T12,T23);
    handles.X=T03(1,4);
    handles.Y=T03(2,4);
    handles.Z=T03(3,4);
end
if (handles.selectore==2)
    timy=[1 0 0 -0.25; ... 
      0 1 0 0; ...
      0 0 1 0; ...
      0 0 0 1];
    Tycon=Trans(handles.ramory,'Rz')*timy
    handles.X=handles.X+Tycon(1,4);
    handles.Y=handles.Y+Tycon(2,4);
    nani=CI3GDL(handles.X,handles.Y,handles.Z);
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
if (handles.selectore==3)
    handles.X=handles.X-0.25;
    nani=CI3GDL(handles.X,handles.Y,handles.Z)
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
% Update handles structure
guidata(hObject, handles);
% --- Executes on button press in yplus.
function yplus_Callback(hObject, eventdata, handles)
if (handles.selectore>0)
handles.output=hObject;
cla;
plot3(15,-15,15,-15,15,0);
T00=eye(4);
end
if (handles.selectore==1)
    handles.ax2=handles.ax2+1;
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3)
    DrawRobots(T00,T01,T12,T23);
    handles.X=T03(1,4);
    handles.Y=T03(2,4);
    handles.Z=T03(3,4);
end
if (handles.selectore==2)
    timy=[1 0 0 0; ... 
      0 1 0 .25; ...
      0 0 1 0; ...
      0 0 0 1];
    Tycon=Trans(handles.ramory,'Rz')*timy
    handles.X=handles.X+Tycon(1,4);
    handles.Y=handles.Y+Tycon(2,4);
    nani=CI3GDL(handles.X,handles.Y,handles.Z);
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
if (handles.selectore==3)
    handles.Y=handles.Y+0.25;
    nani=CI3GDL(handles.X,handles.Y,handles.Z)
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in yminus.
function yminus_Callback(hObject, eventdata, handles)
if (handles.selectore>0)
handles.output=hObject;
cla;
plot3(15,-15,15,-15,15,0);
T00=eye(4);
end
if (handles.selectore==1)
    handles.ax2=handles.ax2-1;
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3)
    DrawRobots(T00,T01,T12,T23);
    handles.X=T03(1,4);
    handles.Y=T03(2,4);
    handles.Z=T03(3,4);
end
if (handles.selectore==2)
    timy=[1 0 0 0; ... 
      0 1 0 -.25; ...
      0 0 1 0; ...
      0 0 0 1];
    Tycon=Trans(handles.ramory,'Rz')*timy
    handles.X=handles.X+Tycon(1,4);
    handles.Y=handles.Y+Tycon(2,4);
    nani=CI3GDL(handles.X,handles.Y,handles.Z);
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
if (handles.selectore==3)
    handles.Y=handles.Y-0.25;
    nani=CI3GDL(handles.X,handles.Y,handles.Z)
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in zplus.
function zplus_Callback(hObject, eventdata, handles)
if (handles.selectore>0)
handles.output=hObject;
cla;
plot3(15,-15,15,-15,15,0);
T00=eye(4);
end
if (handles.selectore==1)
    handles.ax3=handles.ax3+1;
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3)
    DrawRobots(T00,T01,T12,T23);
    handles.X=T03(1,4);
    handles.Y=T03(2,4);
    handles.Z=T03(3,4);
end
if (handles.selectore==2)
    handles.Z=handles.Z+0.25;
    nani=CI3GDL(handles.X,handles.Y,handles.Z)
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
% U
if (handles.selectore==3)
    handles.Z=handles.Z+0.25;
    nani=CI3GDL(handles.X,handles.Y,handles.Z)
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in zminus.
function zminus_Callback(hObject, eventdata, handles)
if (handles.selectore>0)
handles.output=hObject;
cla;
plot3(15,-15,15,-15,15,0);
T00=eye(4);
end
if (handles.selectore==1)
    handles.ax3=handles.ax3-1;
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3)
    DrawRobots(T00,T01,T12,T23);
    handles.X=T03(1,4);
    handles.Y=T03(2,4);
    handles.Z=T03(3,4);
end
if (handles.selectore==2)
    handles.Z=handles.Z-0.25;
    nani=CI3GDL(handles.X,handles.Y,handles.Z)
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
if (handles.selectore==3)
    handles.Z=handles.Z-0.25;
    nani=CI3GDL(handles.X,handles.Y,handles.Z)
    handles.ax1=nani(1);
    handles.ax2=-nani(2);
    handles.ax3=-nani(3);
    [T03,T01,T12,T23] = ScaraRobot(handles.ax1,handles.ax2,handles.ax3);
    DrawRobots(T00,T01,T12,T23);
end
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in Articulacion.
function Articulacion_Callback(hObject, eventdata, handles)
handles.output=hObject;
handles.selectore=1;
set(handles.A1,'Visible',true);
set(handles.A2,'Visible',true);
set(handles.A3,'Visible',true);
set(handles.xplus,'String','+');
set(handles.xminus,'String','-');
set(handles.yplus,'String','+');
set(handles.yminus,'String','-');
set(handles.zplus,'String','+');
set(handles.zminus,'String','-');

guidata(hObject, handles);

% --- Executes on button press in TOOL.
function TOOL_Callback(hObject, eventdata, handles)
handles.output=hObject;
handles.selectore=2;
handles.ramory=handles.ax1;
set(handles.A1,'Visible',false);
set(handles.A2,'Visible',false);
set(handles.A3,'Visible',false);
set(handles.xplus,'String','x+');
set(handles.xminus,'String','x-');
set(handles.yplus,'String','y+');
set(handles.yminus,'String','y-');
set(handles.zplus,'String','z+');
set(handles.zminus,'String','z-');

guidata(hObject, handles);



% --- Executes on button press in GlobalRef.
function GlobalRef_Callback(hObject, eventdata, handles)
handles.output=hObject;
handles.selectore=3;
set(handles.A1,'Visible',false);
set(handles.A2,'Visible',false);
set(handles.A3,'Visible',false);
set(handles.xplus,'String','x+');
set(handles.xminus,'String','x-');
set(handles.yplus,'String','y+');
set(handles.yminus,'String','y-');
set(handles.zplus,'String','z+');
set(handles.zminus,'String','z-');

guidata(hObject, handles);
