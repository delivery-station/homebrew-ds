class DeliveryStation < Formula
  desc "Delivery Station binary executable"
  homepage "https://github.com/delivery-station/ds"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-darwin-arm64.tar.gz"
      sha256 "26b019e9743e1e910af5caf3700f0d6a78c43796b402e31219e482716ac3900a"
    end

    on_intel do
      url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-darwin-amd64.tar.gz"
      sha256 "75a27da52911cd0bdb7340ce8edc5cecff7a34a6d43e96f0c3829cfb3379b3d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-linux-arm.tar.gz"
      sha256 "16a01df8575763f1ed00884af8c58011ac2670e77c68f8f935ea3ff3cd444e00"
    end

    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-linux-amd64.tar.gz"
        sha256 "6952fa49521646f05377a7a3b42f28b3d5be0bd60763924a09ab2f449ad66286"
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
