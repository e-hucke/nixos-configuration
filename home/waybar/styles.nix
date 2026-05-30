{ ... }:

{
  programs.waybar.style =
  ''
    * {
        font-family: "Fira Sans SemiBold", "Symbols Nerd Font";
        font-size: 12px;
        font-weight: 900;
        margin: 0;
        padding: 0;
    }

    * {
        border: none;
        border-radius: 0;
        min-height: 0;
    }

    #waybar {
        background-color: #1e1a1d;
        color: #d4cdd1;
        border-bottom: 2px solid #de99c7;
        margin: 0;
        padding: 0;
    }

    window#waybar.empty #window {
        background-color: transparent;
        padding: 0;
        margin: 0;
        min-width: 0;
    }

    window#waybar.hidden {
        opacity: 0.2;
    }

    #workspaces {
        background-color: transparent;
        padding: 0;
        margin: 0;
    }

    #workspaces button {
        padding: 4px 10px;
        margin: 0;
        border-radius: 0;
        color: #7a6f75;
        background-color: transparent;
        border-bottom: 2px solid transparent;
        transition: all 0.2s ease;
    }

    #workspaces button.active {
        color: #de99c7;
        background: rgba(222, 153, 199, 0.1);
        border-bottom: 2px solid #de99c7;
    }

    #workspaces button:hover {
        background: rgba(222, 153, 199, 0.05);
        color: #d4cdd1;
    }

    #workspaces button.urgent {
        background-color: rgba(201, 112, 130, 0.3);
        color: #c97082;
    }

    #window {
        background-color: transparent;
        font-weight: 600;
        color: #8a8087;
        padding: 4px 12px;
        margin: 0;
        border-left: 1px solid #3d363b;
    }

    #clock,
    #cpu,
    #memory,
    #wireplumber,
    #idle_inhibitor
    #custom-gpu,
    #custom-power {
        background-color: transparent;
        padding: 4px 12px;
        color: #d4cdd1;
        border-left: 1px solid #3d363b;
    }

    #clock {
        color: #de99c7;
        font-weight: 700;
        border-left: none;
        border-right: none;
    }

    #cpu {
        color: #d98a9a;
    }

    #memory {
        color: #d4b76e;
    }

    #custom-gpu {
        color: #8abfd9;
    }

    #wireplumber {
        color: #a5c789;
    }

    #idle_inhibitor {
        color: #efb2db;
    }

    #custom-power {
        color: #de99c7;
        padding: 4px 14px;
        margin-right: 4px;
        border-left: 1px solid #3d363b;
    }

    #custom-power:hover {
        background: rgba(222, 153, 199, 0.15);
    }

    #tray {
        background-color: transparent;
        padding: 4px 8px;
        border-left: 1px solid #3d363b;
    }

    #tray > .passive {
        -gtk-icon-effect: dim;
    }

    #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: rgba(201, 112, 130, 0.3);
    }

    label:focus {
        background-color: #3d363b;
    }
  '';
}