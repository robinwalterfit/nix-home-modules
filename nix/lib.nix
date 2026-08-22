# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
# Meta information
{ self, ... }: {
  projectName = "nix-home-modules";

  # Use (short) git revision hash or dirty, if there are uncommitted changes
  #
  # See https://discourse.nixos.org/t/flakes-accessing-selfs-revision/11237/8
  rev = toString (self.rev or self.dirtyRev or self.lastModified or "unknown");
  shortRev = toString (self.shortRev or self.dirtyShortRev or self.lastModified or "unknown");
}
