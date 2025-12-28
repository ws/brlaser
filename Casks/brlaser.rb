cask "brlaser" do
  version "6"
  sha256 :no_check

  url "https://github.com/ws/homebrew-brlaser/archive/refs/heads/master.tar.gz"
  name "brlaser"
  desc "CUPS driver for Brother laser printers"
  homepage "https://github.com/pdewacht/brlaser"

  depends_on formula: "cmake"

  preflight do
    system_command "/opt/homebrew/bin/cmake",
                   args: [
                     "-S", "#{staged_path}/homebrew-brlaser-master",
                     "-B", "#{staged_path}/build",
                     "-DCMAKE_BUILD_TYPE=Release"
                   ]
    system_command "/opt/homebrew/bin/cmake",
                   args: ["--build", "#{staged_path}/build"]
  end

  postflight do
    system_command "/opt/homebrew/bin/cmake",
                   args: ["--install", "#{staged_path}/build"],
                   sudo: true

    system_command "/bin/launchctl",
                   args: ["stop", "org.cups.cupsd"],
                   sudo: true
    system_command "/bin/launchctl",
                   args: ["start", "org.cups.cupsd"],
                   sudo: true
  end

  uninstall_preflight do
    system_command "/bin/rm",
                   args: ["-f", "/usr/libexec/cups/filter/rastertobrlaser"],
                   sudo: true
    system_command "/bin/rm",
                   args: ["-f", "/Library/Printers/PPDs/Contents/Resources/brlaser.drv"],
                   sudo: true
    system_command "/bin/sh",
                   args: ["-c", "rm -f /Library/Printers/PPDs/Contents/Resources/br*.ppd"],
                   sudo: true
    system_command "/bin/sh",
                   args: ["-c", "rm -f /Library/Printers/PPDs/Contents/Resources/brl*.ppd"],
                   sudo: true

    system_command "/bin/launchctl",
                   args: ["stop", "org.cups.cupsd"],
                   sudo: true
    system_command "/bin/launchctl",
                   args: ["start", "org.cups.cupsd"],
                   sudo: true
  end

  caveats <<~EOS
    The brlaser CUPS driver has been installed and CUPS has been restarted.

    Add your Brother printer using System Settings > Printers & Scanners.
    Look for printer entries marked 'brlaser'.

    Tested on: Brother HL-2300D

    Other supported printers include:
      - Brother DCP-1510, DCP-1600, DCP-7xxx series
      - Brother HL-1110, HL-1200, HL-2xxx, HL-L2xxx series
      - Brother MFC-7xxx, MFC-L2xxx series
  EOS
end
