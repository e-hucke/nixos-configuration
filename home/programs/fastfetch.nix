{ ... }:

{
  programs.fastfetch =
  {
    enable = true;

    settings =
    {
      "$schema" =  "https=//github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json";
      logo =
      {
        color =
        {
          "1" = "magenta";
          "2" = "white";
          "3" = "magenta"
        };
      };
      display =
      {
        separator = "  ";
        color =
        {
          keys= "magenta";
          title= "magenta";
          output= "white"
        };
        percent =
        {
          type = 1;
          colorGreen = "magenta";
          colorYellow = "yellow";
          colorRed = "red"
        };
      };
      modules =
      [
        {
          type = "title";
          key = " ";
          keyColor = "magenta"
        }
        {
          type= "separator";
          string = "─────────────────────────"
        }
        {
          type= "os";
          key= "  OS";
          keyColor= "magenta"
        }
        { 
          type= "host";
          key= "  Host";
          keyColor= "magenta"
        }
        { 
          type= "kernel";
          key= "  Kernel";
          keyColor= "bright_red"
        }
        { 
          type= "uptime";
          key= "  Uptime";
          keyColor= "bright_blue"
        }
        { 
          type= "packages";
          key= "  Packages";
          keyColor= "bright_yellow"
        }
        { 
          type= "shell";
          key= "  Shell";
          keyColor= "bright_yellow"
        }
        {
          type= "display";
          key= "  Display";
          keyColor= "bright_blue"
        }
        { 
          type= "de";
          key="  DE";
          keyColor= "magenta"
        }
        { 
          type= "wm";
          key= "  WM";
          keyColor= "magenta"
        }
        { 
          type= "wmtheme"; 
          key="  Theme";
          keyColor= "magenta"
        }
        { 
          type= "theme";
          key= "  GTK";
          keyColor= "magenta"
        }
        { 
          type= "icons";
          key="  Icons";
          keyColor= "bright_blue"
        }
        { 
          type= "font";
          key= "  Font";
          keyColor= "bright_blue"
        }
        { 
          type= "cursor";
          key= "  Cursor";
          keyColor= "bright_blue"
        }
        { 
          type= "terminal";
          key= "  Terminal";
          keyColor= "bright_red"
        }
        { 
          type= "terminalfont";
          key= "  Term Font";
          keyColor= "bright_red"
        }
        { 
          type= "cpu";
          key= "  CPU";
          keyColor= "bright_red"
        }
        { 
          type= "gpu";
          key= "  GPU";
          keyColor= "bright_red"
        }
        { 
          type= "memory";
          key= "  Memory";
          keyColor= "bright_yellow"
        }
        { 
          type= "swap";
          key= "  Swap";
          keyColor= "bright_yellow"
        }
        { 
          type= "disk";
          key= "  Disk";
          keyColor= "bright_yellow"
        }
        { 
          type= "localip";
          key= "  IP";
          keyColor= "bright_cyan"
        }
        { 
          type= "battery";
          key= "  Battery";
          keyColor= "magenta"
        }
        { 
          type= "poweradapter";
          key= "  Power";
          keyColor= "magenta"
        }
        { 
          type= "locale";
          key= "  Locale";
          keyColor= "bright_blue"
        }
        "break"
        {
            type= "colors";
            "symbol"= "circle"
        }
    ];
  };
  };
}