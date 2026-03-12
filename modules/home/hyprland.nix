{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    package = null;
    portalPackage = null;
    settings = {
      monitor = [
        ", highres, auto, 1"
      ];

      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "vicinae toggle";
      "$browser" = "brave";
      "$mainMod" = "SUPER";

      "exec-once" = [
        "${pkgs.vorbis-tools}/bin/ogg123 ${pkgs.kdePackages.oxygen-sounds}/share/sounds/oxygen/stereo/desktop-login-short.ogg &"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = true;
        layout = "scrolling";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };


        blur = {
          enabled = true;
          size = 5;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      misc = {
        focus_on_activate = true;
        disable_watchdog_warning = true;
        vfr = false;
        vrr = 3;
      };

      animations = {
        enabled = true;

        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];

        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      plugin = {
        hyprscrolling = {
          column_width = 0.7;
          fullscreen_on_one_column = true;
          follow_focus = true;
        };
      };

      input = {
        kb_layout = "us,th";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 2;
        sensitivity = 0;
        accel_profile = "flat";
        touchpad = {
          tap-to-click = true;
          natural_scroll = true;
          scroll_factor = 0.1;
        };
      };

      device = [
        {
          name = "tpps/2-elan-trackpoint";
          sensitivity = 0.5;
          accel_profile = "flat";
          scroll_factor = 0.2;
        }
        {
          name = "synps/2-synaptics-touchpad";
          sensitivity = 0.5;
        }
        {
          name = "yichip-wireless-device-mouse";
          sensitivity = -0.5;
        }
      ];

      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod, Q, killactive"
        "$mainMod, V, exec, noctalia-shell ipc call launcher clipboard"
        "$mainMod, E, exec, $fileManager"
        "$mainMod Shift, R, exec, ${config.vars.configsrc}/src/scripts/record.sh"

        "Alt, Space, exec, $menu"
        "$mainMod, L, exec, hyprlock"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, W, movewindow, u"
        "$mainMod SHIFT, A, movewindow, l"
        "$mainMod SHIFT, S, movewindow, d"
        "$mainMod SHIFT, D, movewindow, r"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, W, movefocus, u"
        "$mainMod, A, movefocus, l"
        "$mainMod, S, movefocus, d"
        "$mainMod, D, movefocus, r"
        "$mainMod, X, layoutmsg, move +col"
        "$mainMod, Z, layoutmsg, move -col"
        "$mainMod SHIFT, Q, layoutmsg, promote"

        ", PRINT, exec, ${config.vars.configsrc}/src/scripts/screenshots.sh full"
        "Alt, PRINT, exec, ${config.vars.configsrc}/src/scripts/screenshots.sh window"
        "Ctrl, PRINT, exec,${config.vars.configsrc}/src/scripts/screenshots.sh region"
      ];

      bindl = [
        ", XF86AudioNext, exec, noctalia-shell ipc call media next"
        ", XF86AudioPause, exec, noctalia-shell ipc call media pause"
        ", XF86AudioPlay, exec, noctalia-shell ipc call media play"
        ", XF86AudioPrev, exec, noctalia-shell ipc call media previous"

        ",XF86AudioRaiseVolume, exec, noctalia-shell ipc call volume increase"
        ",XF86AudioLowerVolume, exec, noctalia-shell ipc call volume decrease"
        ",XF86AudioMute, exec, noctalia-shell ipc call volume muteOutput"
        ",XF86AudioMicMute, exec, noctalia-shell ipc call volume muteInput"
        ",XF86MonBrightnessUp, exec, noctalia-shell ipc call brightness increase"
        ",XF86MonBrightnessDown, exec, noctalia-shell ipc call brightness decrease"

        ",XF86WLAN, exec, noctalia-shell ipc call wifi toggle"
        ",XF86NotificationCenter, exec, noctalia-shell ipc call notifications toggleHistory"
        ",XF86Display, exec, notify-send -a \"System\" \"Have you considered trying to match wits with a rutabaga?\""

        ",XF86Favorites, exec, noctalia-shell ipc call launcher toggle"
        ",XF86PickupPhone, exec, $terminal"
        ",XF86HangupPhone, exec, $browser"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrule = [
        "match:class org.freedesktop.impl.portal.desktop.kde, float on"
        "match:class udiskie, float on"
      ];
      layerrule = [
        {
          name = "noctalia";
          "match:namespace" = "noctalia-background-.*$";
          ignore_alpha = 0.5;
          blur = true;
          blur_popups = true;
        }
        {
          name = "vicinae-blur";
          "match:namespace" = "vicinae";
          blur = true;
          ignore_alpha = 0;
        }
        {
          name = "vicinae-no-animation";
          "match:namespace" = "vicinae";
          no_anim = true;
        }
      ];
    };
  };
}
