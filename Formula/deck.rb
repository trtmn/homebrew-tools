class Deck < Formula
  desc "Manage Elgato Stream Deck profiles, pages, and buttons from the CLI"
  homepage "https://github.com/trtmn/streamdeck-profiles"
  url "https://github.com/trtmn/streamdeck-profiles/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c7a71dd6fa11b5a134ff5e87641d1ae25852cb62a66c6346b426edf7cba1c10a"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install "pydantic>=2.0"
    venv.pip_install "click>=8.0"
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/deck"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/deck --help")
  end
end
