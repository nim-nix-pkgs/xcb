{
  description = ''xcb bindings'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-xcb-master.flake = false;
  inputs.src-xcb-master.ref   = "refs/heads/master";
  inputs.src-xcb-master.owner = "SolitudeSF";
  inputs.src-xcb-master.repo  = "xcb";
  inputs.src-xcb-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-xcb-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-xcb-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}