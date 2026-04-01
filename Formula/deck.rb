class Deck < Formula
  include Language::Python::Virtualenv

  desc "Manage Elgato Stream Deck profiles, pages, and buttons from the CLI"
  homepage "https://github.com/trtmn/streamdeck-profiles"
  url "https://github.com/trtmn/streamdeck-profiles/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "06a7927794e171f81edecf2cefdc736487a007059878df073f081c54c43c7924"
  license "MIT"

  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/deck --help")
  end
end
