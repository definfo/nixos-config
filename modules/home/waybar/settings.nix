{ ... }:
{
  programs.waybar.settings = [
    {
      position = "bottom";
      layer = "top";
      height = 5;
      margin-top = 0;
      margin-bottom = 0;
      margin-left = 0;
      margin-right = 0;
      modules-left = [
        "custom/launcher"
        "hyprland/workspaces"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "tray"
        "cpu"
        "memory"
        "disk"
        "pulseaudio"
        "battery"
        "network"
        "custom/notification"
      ];
      clock = {
        calendar = {
          format = {
            today = "<span color='#b4befe'><b><u>{}</u></b></span>";
          };
        };
        format = " {:%H:%M}";
        tooltip = "true";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = " {:%m-%d}";
      };
      "hyprland/workspaces" = {
        active-only = false;
        disable-scroll = true;
        format = "{icon}";
        on-click = "activate";
        format-icons = {
          "1" = "󰈹";
          "2" = "";
          "3" = "󰘙";
          "4" = "󰙯";
          "5" = "";
          "6" = "";
          "7" = "";
          urgent = "";
          focused = "";
          default = "";
          sort-by-number = true;
        };
        persistent-workspaces = {
          "1" = [ ];
          "2" = [ ];
          "3" = [ ];
          "4" = [ ];
          "5" = [ ];
        };
      };
      memory = {
        format = "󰟜 {}%";
        format-alt = "󰟜 {used} GiB"; # 
        interval = 2;
      };
      cpu = {
        format = " {usage}%";
        format-alt = " {avg_frequency} GHz";
        interval = 2;
      };
      disk = {
        # path = "/";
        format = "󰋊 {percentage_used}%";
        interval = 60;
      };
      tray = {
        icon-size = 20;
        spacing = 4;
      };
      pulseaudio = {
        format = "{icon} {volume}%";
        format-bluetooth = "{icon} {volume}%";
        format-muted = " {volume}%";
        format-icons = {
          "alsa_output.pci-0000_00_1f.3.analog-stereo" = " ";
          "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = " ";
          headphone = " ";
          # phone = " ";
          # phone-muted = " ";
          # portable = " ";
          # car = " ";
          default = [
            ""
            ""
          ];
        };
        scroll-step = 5;
        on-click = "pamixer -t";
        on-right-click = "pavucontrol";
      };
      network = {
        format-wifi = "  {signalStrength}%";
        format-ethernet = "󰀂 ";
        tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
        format-linked = "{ifname} (No IP)";
        format-disconnected = "󰖪 ";
      };
      battery = {
        format = "{icon} {capacity}%";
        format-icons = [
          " "
          " "
          " "
          " "
          " "
        ];
        format-charging = " {capacity}%";
        format-full = " {capacity}%";
        format-warning = " {capacity}%";
        interval = 5;
        states = {
          warning = 20;
        };
        format-time = "{H}h{M}m";
        tooltip = true;
        tooltip-format = "{time}";
      };
      "custom/launcher" = {
        format = "";
        on-click = "fuzzel";
        on-click-right = "wallpaper-picker";
        tooltip = "false";
      };
      "custom/notification" = {
        tooltip = false;
        format = " {icon} ";
        format-icons = {
          notification = "<span foreground='red'><sup></sup></span>   ";
          none = "   ";
          dnd-notification = "<span foreground='red'><sup></sup></span>   ";
          dnd-none = "   ";
          inhibited-notification = "<span foreground='red'><sup></sup></span>   ";
          inhibited-none = "   ";
          dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>   ";
          dnd-inhibited-none = "   ";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
      };
    }
    {
      position = "top";
      layer = "top";
      # output = "!eDP-1";
      height = 5;
      margin-top = 0;
      margin-bottom = 0;
      margin-left = 0;
      margin-right = 0;
      modules-left = [ "custom/lyrics" ];
      modules-center = [ ];
      modules-right = [ "mpris" ];
      mpris = {
        format = "{player_icon} {title} - {artist} - {album}";
        format-paused = "{status_icon} <i>{title} - {artist} - {album}</i>";
        player-icons = {
          default = "▶";
          audacious = "🎵";
        };
        status-icons = {
          paused = "⏸";
        };
        ignored-players = [ "firefox" ];
      };
      "custom/lyrics" = {
        format = "♪ {}";
        interval = 1;
        exec = "cat /tmp/lyrics";
        exec-if = "test -f /tmp/lyrics";
        return-type = "json";
      };
    }
  ];
}
