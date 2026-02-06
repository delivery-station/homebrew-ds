class DeliveryStation < Formula
  desc "Delivery Station binary executable"
  homepage "https://github.com/delivery-station/ds"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-darwin-arm64.tar.gz"
      sha256 ""
    end

    on_intel do
      url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-darwin-amd64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-linux-arm.tar.gz"
      sha256 ""
    end

    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-linux-amd64.tar.gz"
        sha256 ""
      end
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "ds"
  end

  test do
    system "#{bin}/ds", "--version"
  end
end
