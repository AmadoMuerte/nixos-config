{ config, pkgs, ... }:

{
  # ========== GRAPHICS ==========
  hardware = {
    # OpenGL support
    opengl = {
      enable = true;
      driSupport32Bit = true;  # Required for 32-bit games on Steam
    };
    
    # Modern graphics subsystem (for Vulkan)
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # ========== AMD DRIVERS ==========
  services.xserver = {
    enable = true;
    # Use AMDGPU driver (open-source, works great with Radeon RX 7000 series)
    videoDrivers = [ "amdgpu" ];
  };

  # ========== AUDIO (needed for Steam) ==========
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;  # 32-bit ALSA compatibility for games
    };
    pulse.enable = true;    # PipeWire as PulseAudio replacement
  };

  # ========== STEAM ==========
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;      # Allow Steam Remote Play
    dedicatedServer.openFirewall = true;  # Allow Steam dedicated servers
  };

  # ========== VULKAN - RADV IS DEFAULT ==========
  # No need to specify extraPackages for Vulkan anymore
  # RADV (open-source Vulkan driver for AMD) is enabled by default in NixOS 26.05
  # Vulkan loader is automatically included with graphics.enable

  # ========== PERFORMANCE TWEAKS ==========
  # Fix for potential display issues on some AMD GPUs
  boot.kernelParams = [ "amdgpu.sg_display=0" ];
}
