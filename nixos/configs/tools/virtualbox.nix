{ config, lib, inputs, pkgs, ... }:  
# não sei se isso está correto...

  let
     # Verifica se o KVM está ativado e então habilita as caixas virtuais
     hardwareConfig = builtins.readFile ../../hardware-configuration.nix;
     hasKvm = (builtins.match ".*kvm_amd.*" hardwareConfig != null) ||
              (builtins.match ".*kvm_intel.*" hardwareConfig != null);
  in
  {
     # VirtualBox (compilar isso é muito chato!!!)
     virtualisation.virtualbox.host = {
        enable = true;
        enableKvm = hasKvm;  # usa KVM
        addNetworkInterface = false;
     };
}
