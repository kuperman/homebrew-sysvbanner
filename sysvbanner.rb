require 'formula'

class Sysvbanner < Formula
  homepage 'http://packages.debian.org/source/stable/sysvbanner'
  url 'http://ftp.debian.org/debian/pool/main/s/sysvbanner/sysvbanner_1.0.15.tar.gz'
  sha256 'f30ddfaeebb635c088c861a6f009bcf2ee2ffb1cf56fb9c0e0ff84dba7d84a94'

  def install
    system 'make'
    bin.install  'banner'
    man1.install 'banner.1'
    # These really should be renamed, and changed in the manpage
    #bin.install  'banner' => 'sysvbanner'
    #man1.install 'banner.1' => 'sysvbanner.1'
  end
  def caveats; <<-EOS.undent
    This version of banner displays horizontally, not vertically.
    
    The supplied version of banner is /usr/bin/banner and is designed
    for printing on accordion folded paper.

    You will want to change your path to have /usr/local/bin come before
    /usr/bin to invoke 'banner' directly from the command line.
    EOS
  end

  test do
    system "#{bin}/banner", "testing", "banner"
  end
end
