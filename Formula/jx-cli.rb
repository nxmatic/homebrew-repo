class JxCli < Formula
  desc "a simple small new modular CLI for Jenkins X v3"
  homepage "https://github.com/jenkins-x/jx-cli"
  url "https://github.com/jenkins-x/jx-cli/releases/download/v3.1.64/jx-cli-darwin-amd64.tar.gz"
  sha256 "4ef6ee0f120e4e7d5e5766d37f2fb097c741ccf1797c25afa16784062aaabcca"
  license "Apache-2.0"


  # depends_on "cmake" => :build

  def install
    mv "jx", "jx-cli"
    bin.install "jx-cli"
    output = Utils.popen_read("SHELL=bash #{bin}/jx-cli completion bash")
    (bash_completion/"jx-cli").write output

    prefix.install_metafiles
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test jx-cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
