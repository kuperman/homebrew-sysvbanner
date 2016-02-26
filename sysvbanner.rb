require 'formula'

class Sysvbanner < Formula
  homepage 'http://packages.debian.org/source/stable/sysvbanner'
  url 'http://ftp.debian.org/debian/pool/main/s/sysvbanner/sysvbanner_1.0.15.tar.gz'
  sha1 '310960c38ff9778bc1597322f45f8b052b7c5ede'

  def install
    system 'make'
    bin.install  'banner'
    man1.install 'banner.1'
    # These really should be renamed, and changed in the manpage
    #bin.install  'banner' => 'sysvbanner'
    #man1.install 'banner.1' => 'sysvbanner.1'
  end

  test do
    system "#{bin}/banner", "testing", "banner"
  end
end
