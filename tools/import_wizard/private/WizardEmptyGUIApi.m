function api = WizardEmptyGUIApi( api,varargin )


%% get parameters
type = get_option(varargin,'type','');
name = get_option(varargin,'name','Import Wizard','char');

Spacings.FontSizeTitle       =   14;
Spacings.FontSizeDescription =   10;
Spacings.FontSize            =   10;

Spacings.ButtonWidth         =   85;
Spacings.ButtonHeight        =   30;

Spacings.Margin              =    8;

Spacings.TopHeight           =   75;
Spacings.PageHeight          =  get_option(varargin,'PageHeight',275);
Spacings.BottomHeight        =  Spacings.ButtonHeight+3*Spacings.Margin;

Spacings.Width   = 500;
Spacings.Height  = 2*Spacings.Margin + ...
  Spacings.TopHeight + Spacings.PageHeight + Spacings.BottomHeight;

Spacings.PageWidth = Spacings.Width  - 2*Spacings.Margin;

gui = localCreateGUI();

api.hFigure               = gui.hFigure;
api.hPanel                = gui.hPanel;

api.Spacings              = Spacings;

api.setWizardDescription  = @setDescription;
api.setWizardTitle        = @setTitle;
api.clearPage             = @clearPanel;


  function clearPanel
    
    delete(get(gui.hPanel,'children'));
    
  end

  function setDescription(str)
    
    set(gui.hDescription,'String',str);
    
  end

  function setTitle(str)
    
    set(gui.hTitle,'String',str);
    
  end
 
  function gui = localCreateGUI()
    
    % local renaming ..
    w    = Spacings.Width;
    h    = Spacings.Height;
    tH   = Spacings.TopHeight;
    pH   = Spacings.PageHeight;
    tFS  = Spacings.FontSizeTitle;
    dFS  = Spacings.FontSizeDescription;
    m    = Spacings.Margin;
    
    scrsz = get(0,'ScreenSize');
    
    if ~api.isPublishMode
      
      hWzrd = figure('MenuBar','none',...
        'Name',[type ' ' name],...
        'Resize','off',...
        'NumberTitle','off',...
        'Color',get(0,'defaultUicontrolBackgroundColor'),...
        'Position',[(scrsz(3)-w)/2 (scrsz(4)-h)/2 w h]);
      
      iconMTEX(hWzrd);
      
    else
      
      figure('units','pixels',...
        'Position',[(scrsz(3)-w+1)/2 (scrsz(4)-h+1)/2 w+1 h+1],...
        'Color',get(0,'defaultUicontrolBackgroundColor'));
      hWzrd = uipanel('units','pixels',...
        'position',[1 1 w h],...
        'BorderType','line',...
        'borderwidth',1,...
        'HighlightColor',[0 0 0]);
      
    end
    
    uicontrol('BackgroundColor',[1 1 1],...
      'Parent',hWzrd,...
      'Position',[2 h-tH w-2 tH],...
      'String','',...
      'Style','text',...
      'HandleVisibility','off',...
      'HitTest','off');
    
    title = uicontrol(...
      'Parent',hWzrd,...
      'FontSize',tFS,...
      'FontUnits','pixels',...
      'FontWeight','bold',...
      'ForegroundColor',[.2 .2 .2],...
      'BackgroundColor',[1 1 1],...
      'HorizontalAlignment','left',...
      'Units','pixels',...
      'Position',[m h-tH+m+(2*tFS-m) w-2*m 2*tFS],...
      'String',type,...
      'Style','text',...
      'HandleVisibility','off',...
      'HitTest','off');
    
    description = uicontrol(...
      'Parent',hWzrd,...
      'FontSize',dFS,...
      'FontWeight','normal',...
      'ForegroundColor',[.2 .2 .2],...
      'BackgroundColor',[1 1 1],...
      'HorizontalAlignment','left',...
      'Units','pixels',...
      'Position',[m h-tH+m+(2*tFS-m-2*dFS)  w-2*m 2*dFS],...
      'String',type,...
      'Style','text',...
      'HandleVisibility','off',...
      'HitTest','off');
    
    hPanel = uipanel('BorderType','none',...
      'parent',hWzrd,...
      'units','pixels',...  'background',[1 1 1],...
      'position',[m h-m-tH-pH w-2*m pH]);
    
    gui.hFigure      = hWzrd;
    gui.hPanel       = hPanel;
    gui.hTitle       = title;
    gui.hDescription = description;
    
  end


end


