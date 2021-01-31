class Kfctl < Formula
  desc "Kubeflow CLI tool"
  homepage "https://www.kubeflow.org"
  url "https://github.com/kubeflow/kfctl/releases/download/v1.2.0/kfctl_v1.2.0-0-gbc038f9_darwin.tar.gz"
  version "1.2.0"
  sha256 "c542d8e5872db4181cefa7feb83058fdf34174a6a7d1bb33600da855f3cf0096"
  head "https://github.com/kubeflow/kubeflow.git"

  bottle :unneeded

  depends_on "kubernetes-cli"

  def install
    bin.install "kfctl"
  end

  test do
    ohai "Verify that `kfctl version` contains \"kfctl v#{version}\" ..."
    assert_match "kfctl v#{version}", shell_output("#{bin}/kfctl version 2>&1")

    ohai "Verify that `kfctl --help` contains \"Available Commands\" ..."
    assert_match "Available Commands", shell_output("#{bin}/kfctl --help 2>&1")
  end
end
