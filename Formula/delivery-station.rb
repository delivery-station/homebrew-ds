class DeliveryStation < Formula
  desc "Delivery Station binary executable"
  homepage "https://github.com/delivery-station/ds"
  version "1.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-darwin-arm64.tar.gz"
      sha256 "941cfd487c021271719ff459c09f534b5a0d08725a87044bf2873b6efbf0a9cb"
    end

    on_intel do
      url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-darwin-amd64.tar.gz"
      sha256 "19d6ad8902d5d36b9f124e852cfefd30e69de5b3750d64043e7c1f31f03e9f9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-linux-arm.tar.gz"
      sha256 "d91d3b9feded3b3814949afe79166cf92ea2f725fdbe014ee43594534a4c2014"
    end

    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/delivery-station/ds/releases/download/v#{version}/ds-linux-amd64.tar.gz"
        sha256 "54b5bd008d1e052e55a1e001358aac7ff50c4e4619891c77b2f073b897869bf6"
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
