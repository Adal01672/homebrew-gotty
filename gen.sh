#/bin/bash -e

VERSION=`curl -s -L https://api.github.com/repos/yudai/gotty/releases/latest | jq -r .tag_name`

SHASUMS=`curl -s -L "https://github.com/yudai/gotty/releases/download/${VERSION}/SHA256SUMS"`

SHA256_DARWIN=`echo "${SHASUMS}" | grep gotty_darwin_amd64.tar.gz | cut -f 1 -d ' '`
SHA256_LINUX=`echo "${SHASUMS}" | grep gotty_linux_amd64.tar.gz | cut -f 1 -d ' '`

echo "VERSION: ${VERSION}"
echo "SHA256 DARWIN: ${SHA256_DARWIN}"
echo "SHA256  LINUX: ${SHA256_LINUX}"

cat > gotty.rb <<EOF
require "formula"

class Gotty < Formula
  homepage "https://github.com/yudai/gotty"
  version '$VERSION'

  url "https://github.com/yudai/gotty/releases/download/$VERSION/gotty_darwin_amd64.tar.gz"
  sha256 "$SHA256_DARWIN"

    if OS.linux? && Hardware::CPU.is_64_bit?
      url "https://github.com/yudai/gotty/releases/download/$VERSION/gotty_linux_amd64.tar.gz"
      sha256 "$SHA256_LINUX"
  end

  depends_on :arch => :intel

  def install
    bin.install 'gotty'
  end

  def caveats
    "GoTTY!"
  end
end
EOF
