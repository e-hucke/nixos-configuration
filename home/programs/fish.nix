{ pkgs, ...}:

{
  programs.fish =
  {
    enable = true;
    
    functions =
    {
      fish_greeting = "fastfetch";
      last_history_item = "echo $history[1]";
    };

    shellAliases = 
    {
      clear = ''printf "\033c"'';
    };

    interactiveShellInit =
    ''
      set -g fish_glob_dotfiles 1
      abbr -a '!!' --position anywhere --function last_history_item
    '';    
  };
}
