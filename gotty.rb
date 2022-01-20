require "formula"

class Gotty < Formula
  homepage "https://github.com/yudai/gotty"
  version 'v1.0.1'

  url "https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_darwin_amd64.tar.gz"
  sha256 "ad74832b344480e6647ee9d0c14c783b024735bad8c8a711b1db2284c38cdcfe"

   if OS.linux? && Hardware::CPU.is_64_bit?
      url "https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz"
      sha256 "3ff6e0fda6b946e35b0d5fc038054b4b7e8b9558ab697f0a61dc63cebaabd2e1"
  end

  depends_on :arch => :intel

  def install
    bin.install 'gotty'
  end

  def caveats
    "GoTTY!"
  end
end
